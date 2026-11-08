<?php

namespace WHMCS\Module\Server\BitNinja\Model;

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Schema\Builder;
use Illuminate\Database\Eloquent\Model;
use WHMCS\Database\Capsule;

class License extends Model
{
    protected $table = 'mod_bitninja_licenses';
    protected $primaryKey = 'client_id';

    public static function installTable()
    {
        try {
            $schema = Capsule::schema();
            if (!$schema->hasTable('mod_bitninja_licenses')) {
                $schema->create('mod_bitninja_licenses', function (Blueprint $table) {
                    $table->charset = 'utf8';
                    $table->collation = 'utf8_unicode_ci';
                    $table->increments('id');
                    $table->unsignedBigInteger('client_id')->unique();
                    $table->string('user_id')->nullable();
                    $table->timestamps();
                });
            }
        } catch (\Exception $e) {
            logActivity($e->getMessage());
        }
    }
}