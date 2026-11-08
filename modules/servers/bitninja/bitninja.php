<?php

use WHMCS\Module\Server\BitNinja\API;
use WHMCS\Module\Server\BitNinja\Controllers\ClientAreaController;
use WHMCS\Module\Server\BitNinja\Model\License as BitNinjaLicense;
use WHMCS\Service\Service;
use WHMCS\User\Client;

if (!defined("WHMCS")) {
    die("This file cannot be accessed directly");
}

/**
 * Define module related meta data.
 *
 * Values returned here are used to determine module related abilities and
 * settings.
 *
 * @see https://developers.whmcs.com/provisioning-modules/meta-data-params/
 *
 * @return array
 */
function bitninja_MetaData()
{
    return array(
        'DisplayName' => 'BitNinja Server Security',
        'APIVersion' => '1', // Use API Version 1.1
        'RequiresServer' => true, // Set true if module requires a server to work
        'DefaultNonSSLPort' => '443', // Default Non-SSL Connection Port
        'DefaultSSLPort' => '443', // Default SSL Connection Port
        'ServiceSingleSignOnLabel' => 'Login to BitNinja',
        'AdminSingleSignOnLabel' => 'Login to BitNinja',
    );
}

/**
 * Define product configuration options.
 *
 * The values you return here define the configuration options that are
 * presented to a user when configuring a product for use with the module. These
 * values are then made available in all module function calls with the key name
 * configoptionX - with X being the index number of the field from 1 to 24.
 *
 * You can specify up to 24 parameters, with field types:
 * * text
 * * password
 * * yesno
 * * dropdown
 * * radio
 * * textarea
 *
 * Examples of each and their possible configuration parameters are provided in
 * this sample function.
 *
 * @see https://developers.whmcs.com/provisioning-modules/config-options/
 *
 * @return array
 */
function bitninja_ConfigOptions()
{
    return [];
}

/**
 * Provision a new instance of a product/service.
 *
 * Attempt to provision a new instance of a given product/service. This is
 * called any time provisioning is requested inside of WHMCS. Depending upon the
 * configuration, this can be any of:
 * * When a new order is placed
 * * When an invoice for a new order is paid
 * * Upon manual request by an admin user
 *
 * @param array $params common module parameters
 *
 * @see https://developers.whmcs.com/provisioning-modules/module-parameters/
 *
 * @return string "success" or an error message
 */
function bitninja_CreateAccount(array $params)
{
    try {
        BitNinjaLicense::installTable();

        $service = $params['model'];

        $ipAddress = isset($params['customfields']['IP Address']) ? $params['customfields']['IP Address'] : '';
        if (!filter_var($ipAddress, FILTER_VALIDATE_IP)) {
            throw new \Exception("Invalid IP address specified.");
        }

        $client = Client::findOrFail($params['userid']);
        $api = new API($params['serverusername'], $params['serverpassword']);

        $bitninjaUser = BitNinjaLicense::find($client->id);

        if (is_null($bitninjaUser)) {
            $bitninjaUser = new BitNinjaLicense;
            $bitninjaUser->client_id = $client->id;
            $users = $api->listUsers();
            $userExists = false;
            foreach ($users as $user) {
                if ($user['email'] === $client->email) {
                    $userExists = true;
                    $userid = $user['user_id'];
                    break;
                }
            }

            if (!$userExists) {
                $name = $client->firstname . ' ' . $client->lastname;
                $userid = $api->registerUser($name, $client->email);
            }

            $bitninjaUser->user_id = $userid;
            $bitninjaUser->save();
        }

        $license = $api->assignLicense($bitninjaUser->user_id, $ipAddress);

        $service->serviceProperties->save(['Domain' => $license,]);

    } catch (\Exception $e) {
        // Record the error in WHMCS's module log.
        logModuleCall(
            'bitninja',
            __FUNCTION__,
            $params,
            $e->getMessage(),
            $e->getTraceAsString()
        );

        return $e->getMessage();
    }

    return 'success';
}

/**
 * Terminate instance of a product/service.
 *
 * Called when a termination is requested. This can be invoked automatically for
 * overdue products if enabled, or requested manually by an admin user.
 *
 * @param array $params common module parameters
 *
 * @see https://developers.whmcs.com/provisioning-modules/module-parameters/
 *
 * @return string "success" or an error message
 */
function bitninja_TerminateAccount(array $params)
{
    try {
        $service = $params['model'];
        $api = new API($params['serverusername'], $params['serverpassword']);
        $api->terminateLicense($service->serviceProperties->get('Domain'));
    } catch (Exception $e) {
        // Record the error in WHMCS's module log.
        logModuleCall(
            'bitninja',
            __FUNCTION__,
            $params,
            $e->getMessage(),
            $e->getTraceAsString()
        );

        return $e->getMessage();
    }

    return 'success';
}

/**
 * Test connection with the given server parameters.
 *
 * Allows an admin user to verify that an API connection can be
 * successfully made with the given configuration parameters for a
 * server.
 *
 * When defined in a module, a Test Connection button will appear
 * alongside the Server Type dropdown when adding or editing an
 * existing server.
 *
 * @param array $params common module parameters
 *
 * @see https://developers.whmcs.com/provisioning-modules/module-parameters/
 *
 * @return array
 */
function bitninja_TestConnection(array $params)
{
    try {
        $api = new API($params['serverusername'], $params['serverpassword']);

        $success = true;
        $errorMsg = '';
    } catch (Exception $e) {
        // Record the error in WHMCS's module log.
        logModuleCall(
            'bitninja',
            __FUNCTION__,
            $params,
            $e->getMessage(),
            $e->getTraceAsString()
        );

        $success = false;
        $errorMsg = $e->getMessage();
    }

    return [
        'success' => $success,
        'error' => $errorMsg,
    ];
}

/**
 * Additional actions an admin user can invoke.
 *
 * Define additional actions that an admin user can perform for an
 * instance of a product/service.
 *
 * @see bitninja_buttonOneFunction()
 *
 * @return array
 */
function bitninja_AdminCustomButtonArray()
{
    return [];
}

/**
 * Additional actions a client user can invoke.
 *
 * Define additional actions a client user can perform for an instance of a
 * product/service.
 *
 * Any actions you define here will be automatically displayed in the available
 * list of actions within the client area.
 *
 * @return array
 */
function bitninja_ClientAreaCustomButtonArray()
{
    return [];
}

/**
 * Client area output logic handling.
 *
 * This function is used to define module specific client area output. It should
 * return an array consisting of a template file and optional additional
 * template variables to make available to that template.
 *
 * The template file you return can be one of two types:
 *
 * * tabOverviewModuleOutputTemplate - The output of the template provided here
 *   will be displayed as part of the default product/service client area
 *   product overview page.
 *
 * * tabOverviewReplacementTemplate - Alternatively using this option allows you
 *   to entirely take control of the product/service overview page within the
 *   client area.
 *
 * Whichever option you choose, extra template variables are defined in the same
 * way. This demonstrates the use of the full replacement.
 *
 * Please Note: Using tabOverviewReplacementTemplate means you should display
 * the standard information such as pricing and billing details in your custom
 * template or they will not be visible to the end user.
 *
 * @param array $params common module parameters
 *
 * @see https://developers.whmcs.com/provisioning-modules/module-parameters/
 *
 * @return array
 */
function bitninja_ClientArea(array $params)
{
    // Determine the requested action and set service call parameters based on
    // the action.
    $requestedAction = isset($_REQUEST['customAction']) ? $_REQUEST['customAction'] : 'overview';

    try {
        if (method_exists(ClientAreaController::class, $requestedAction)) {
            $controller = new ClientAreaController($params);
            return $controller->{$requestedAction}();
        } else {
            throw new \Exception('Invalid action specified.');
        }
    } catch (Exception $e) {
        // Record the error in WHMCS's module log.
        logModuleCall(
            'bitninja',
            __FUNCTION__,
            $params,
            $e->getMessage(),
            $e->getTraceAsString()
        );

        // In an error condition, display an error page.
        return [
            'tabOverviewReplacementTemplate' => 'error.tpl',
            'templateVariables' => [
                'usefulErrorHelper' => $e->getMessage(),
            ],
        ];
    }
}
