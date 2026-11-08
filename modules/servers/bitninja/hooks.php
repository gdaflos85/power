<?php

use WHMCS\Product\Product;
use WHMCS\CustomField;

function bitninja_ensureConfigOptionExists($vars)
{
    if ($vars['servertype'] === 'bitninja') {
        $product = Product::find($vars['pid']);
        $customFieldsAvailable = [];
        foreach($product->customFields as $customField) {
            $customFieldsAvailable[] = $customField->fieldName;
        }

        if (array_search('IP Address', $customFieldsAvailable) === false) {
            try {
                $newCustomField = new CustomField();
                $newCustomField->relatedId = $product->id;
                $newCustomField->type = 'product';
                $newCustomField->fieldName = 'IP Address';
                $newCustomField->fieldType = 'text';
                $newCustomField->description = 'Enter the IP address of the server you wish to protect';
                $newCustomField->required = 'on';
                $newCustomField->showOnOrderForm = 'on';
                $newCustomField->showOnInvoice = 'on';
                $newCustomField->save();
            } catch (\Exception $e) {
                logActivity($e->getMessage());
            }
        }
    }
}

add_hook("ProductEdit", 1, "bitninja_ensureConfigOptionExists");

/**
 * @param \WHMCS\View\Menu\Item $menu
 */
add_hook('ClientAreaPrimaryNavbar', 1, function ($menu)
{
    // Check whether the services menu exists.
    if (!is_null($menu->getChild('Services'))) {
        // Add a link to the module filter.
        $menu->getChild('Services')
            ->addChild(
                'My BitNinja Licenses',
                array(
                    'uri' => 'clientarea.php?action=services&module=bitninja',
                    'order' => 15,
                )
            );
    }
});
