{foreach $navbar as $item}
    <li menuItemName="{$item->getName()}" class="{if $item->hasChildren()}dropdown settings{/if}{if $item->getClass()} {$item->getClass()}{/if}" id="{$item->getId()}">
		<button type="button" class="btn btn-default dropdown-toggle options" id="toggle-user" data-toggle="dropdown">
			<i class="fas fa-user"></i>
		</button>
        <a {if $item->hasChildren()}class="dropdown-toggle hidden-xs" data-toggle="dropdown" href="#"{else}href="{$item->getUri()}"{/if}{if $item->getAttribute('target')} target="{$item->getAttribute('target')}"{/if}>
            {if $item->hasIcon()}<i class="{$item->getIcon()}"></i>&nbsp;{/if}
            {$item->getLabel()}
            {if $item->hasBadge()}&nbsp;<span class="badge">{$item->getBadge()}</span>{/if}
            {if $item->hasChildren()}&nbsp;<b class="caret"></b>{/if}
        </a>
        {if $item->hasChildren()}
            <ul class="dropdown-menu dropdown-menu-right animated fadeInDown">
            {foreach $item->getChildren() as $childItem}
                <li menuItemName="{$childItem->getName()}"{if $childItem->getClass()} class="{$childItem->getClass()}"{/if} id="{$childItem->getId()}">
                    <a href="{$childItem->getUri()}"{if $childItem->getAttribute('target')} target="{$childItem->getAttribute('target')}"{/if}>
                        {if $childItem->hasIcon()}<i class="{$childItem->getIcon()}"></i>&nbsp;
						{elseif $childItem->getName() eq "Edit Account Details"}<i class="fas fa-user-edit fa-fw"></i>&nbsp;
						{elseif $childItem->getName() eq "Payment Methods"}<i class="fas fa-credit-card fa-fw"></i>&nbsp;
						{elseif $childItem->getName() eq "Contacts/Sub-Accounts"}<i class="fas fa-address-book fa-fw"></i>&nbsp;
						{elseif $childItem->getName() eq "Change Password"}<i class="fas fa-key fa-fw"></i>&nbsp;
                        {elseif $childItem->getName() eq "Security Settings"}<i class="fas fa-fw fa-wrench"></i>&nbsp;
						{elseif $childItem->getName() eq "Email History"}<i class="fas fa-envelope fa-fw"></i>&nbsp;
						{elseif $childItem->getName() eq "Logout"}<i class="fas fa-sign-out-alt fa-fw"></i>&nbsp;
						{elseif $childItem->getName() eq "Login"}<i class="fas fa-sign-in-alt fa-fw"></i>&nbsp;
						{elseif $childItem->getName() eq "Register"}<i class="fas fa-level-up-alt fa-fw"></i>&nbsp;
						{elseif $childItem->getName() eq "Forgot Password?"}<i class="fas fa-question-circle fa-fw"></i>&nbsp;
                        {elseif $childItem->getName() eq "User Management"}<i class="fas fa-users-cog fa-fw"></i>&nbsp;
                        {elseif $childItem->getName() eq "Contacts"}<i class="fas fa-address-book fa-fw"></i>&nbsp;
                        {elseif $childItem->getName() eq "Account Security"}<i class="fas fa-user-lock fa-fw"></i>&nbsp;
                        {elseif $childItem->getName() eq "Profile"}<i class="fas fa-id-card fa-fw"></i>&nbsp;
						{else}<i class="fas fa-angle-right fa-fw"></i>&nbsp;
						{/if}
                        {$childItem->getLabel()}
                        {if $childItem->hasBadge()}&nbsp;<span class="badge">{$childItem->getBadge()}</span>{/if}
                    </a>
                </li>
            {/foreach}
            </ul>
        {/if}
    </li>
{/foreach}
