<?php

namespace WHMCS\Module\Server\BitNinja;

use GuzzleHttp\Client;
use GuzzleHttp\Exception\RequestException;
use GuzzleHttp\RequestOptions;

class API
{
    protected $username;
    protected $password;
    protected $client;
    protected $apiVersion;
    private $bearerToken;
    private $accessType;

    private $endpoint = 'https://reseller-api.bitninja.io/';

    /**
     * API constructor.
     * @param $username
     * @param $password
     * @param string $version
     * @throws \Exception
     * @TODO cache access token
     */
    public function __construct($username, $password, $version = '1')
    {
        $this->username = $username;
        $this->password = $password;
        $this->apiVersion = $version;
        $this->client = new Client([
            'base_uri' => $this->endpoint,
            RequestOptions::CONNECT_TIMEOUT => 30,
            RequestOptions::HTTP_ERRORS => false,
            RequestOptions::DEBUG => false,
        ]);

        $this->loginAndRetrieveBearer();
    }

    protected function loginAndRetrieveBearer()
    {
        $request = $this->client->post('oauth/access_token', [
            'headers' => [
                'Accept'     => 'application/json',
                'Content-Type' => 'application/json',
            ],
            'json' => [
                'grant_type'    => 'client_credentials',
                'client_id'     => $this->username,
                'client_secret' => $this->password,
            ],
        ]);

        if ($request->getStatusCode() !== 200) {
            throw new \Exception('Unable to authenticate.');
        }

        $data = json_decode($request->getBody()->getContents(), true);

        $this->bearerToken = $data['access_token'];
        $this->accessType = $data['token_type'];
    }

    public function endpoint($value = '')
    {
        return 'v' . $this->apiVersion . '/' . $value;
    }

    public function listUsers()
    {
        $request = $this->client->get($this->endpoint('users'), [
            'headers' => [
                'Authorization' => $this->accessType . ' ' . $this->bearerToken,
                'Accept' => '*/*',
                'Content-Type' => 'application/json',
            ],
        ]);

        if ($request->getStatusCode() !== 200) {
            throw new \Exception($request->getBody()->getContents());
        }

        $data = json_decode($request->getBody()->getContents(), true);

        return $data['message'];
    }

    public function registerUser($name, $email)
    {
        if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
            throw new \Exception('Invalid email address provided');
        }

        $userid = null;

        $request = $this->client->post($this->endpoint('users'), [
            'headers' => [
                'Authorization' => $this->accessType . ' ' . $this->bearerToken,
                'Accept'        => 'application/json',
            ],
            'json' => [
                'body' => json_encode([
                    'name'  => ucwords($name),
                    'email' => strtolower($email),
                ]),
            ],
        ]);

        if ($request->getStatusCode() !== 200) {
            throw new \Exception($request->getBody()->getContents());
        }

        $users = $this->listUsers();
        foreach ($users as $user) {
            if ($user['email'] === $email) {
                $userid = $user['user_id'];
                break;
            }
        }

        return $userid;
    }

    public function assignLicense($userId, $ipAddress)
    {
        if (!filter_var($ipAddress, FILTER_VALIDATE_IP)) {
            throw new \Exception('Invalid IP address provided');
        }

        $request = $this->client->post($this->endpoint('licensekeys'), [
            'headers' => [
                'Authorization' => $this->accessType . ' ' . $this->bearerToken,
                'Accept'        => 'application/json',
            ],
            'json' => [
                'body' => json_encode([
                    'user_id'  => $userId,
                    'ip_address' => $ipAddress,
                ]),
            ],
        ]);

        if ($request->getStatusCode() !== 200) {
            throw new \Exception($request->getBody()->getContents());
        }


        foreach ($this->getLicenses() as $k => $license) {
            if (
                $license['ip_address'] === $ipAddress
                && $license['state'] === 'active'
            ) {
                return $license['license_key'];
            }
        }

        return false;
    }

    public function getLicenses()
    {
        $request = $this->client->get($this->endpoint('licensekeys'), [
            'headers' => [
                'Authorization' => $this->accessType . ' ' . $this->bearerToken,
                'Accept'        => 'application/json',
                'Content-Type'  => 'application/json',
            ],
        ]);

        if ($request->getStatusCode() !== 200) {
            throw new \Exception($request->getBody()->getContents());
        }

        $data = json_decode($request->getBody()->getContents(), true);

        return $data['message'];
    }

    public function terminateLicense($licensekey)
    {
        $request = $this->client->delete($this->endpoint('licensekeys/' . $licensekey), [
            'headers' => [
                'Authorization' => $this->accessType . ' ' . $this->bearerToken,
                'Accept'        => 'application/json',
                'Content-Type'  => 'application/json',
            ],
        ]);

        if ($request->getStatusCode() !== 200) {
            throw new \Exception($request->getBody()->getContents());
        }

        return true;
    }

    public function getInstallInstructions($userId)
    {
        $request = $this->client->get($this->endpoint('users/' . $userId . '/install'), [
            'headers' => [
                'Authorization' => $this->accessType . ' ' . $this->bearerToken,
                'Accept'        => 'application/json',
                'Content-Type'  => 'application/json',
            ],
        ]);

        if ($request->getStatusCode() !== 200) {
            throw new \Exception($request->getBody()->getContents());
        }

        $data = json_decode($request->getBody()->getContents(), true);

        return $data['message']['instructions'];
    }
}