<link rel="stylesheet" href="../assets/style/estate_modify_style.css">

<div class="auth">
    <h2>Edit Estate</h2>
    <form action="?p=edit-estate&id={$estate.id}" method="POST">
        <div class="user-box"><input type="text" name="title" required="" value="{$estate.title}"><label>Title</label></div>
        <div class="user-box"><input type="text" name="cost" required="" value="{$estate.cost}"><label>Cost</label></div>
        <div class="user-box"><select name="type" required="">{foreach $locations.types as $type}<option value="{$type.id}" {if $type.id == $estate.type}selected{/if}>{$type.name}</option>{/foreach}</select><label>Type</label></div>
        <div class="user-box"><select name="locality" required="">{foreach $locations.localities as $locality}<option value="{$locality.id}" {if $locality.id == $estate.type}selected{/if}>{$locality.name}</option>{/foreach}</select><label>Locality</label></div>
        <div class="user-box"><select name="city" required="">{foreach $locations.cities as $city}<option value="{$city.id}" {if $city.id == $estate.type}selected{/if}>{$city.name}</option>{/foreach}</select><label>City</label></div>
        <div class="user-box"><input type="text" name="area" required="" value="{$estate.area}"><label>Area</label></div>
        <div class="user-box"><input type="text" name="bedrooms" required="" value="{$estate.bedrooms}"><label>Bedrooms</label></div>
        <div class="user-box"><input type="text" name="floors" required="" value="{$estate.floors}"><label>Floors</label></div>
        <div class="checkbox-wrapper-4">
            <input name="archived" class="inp-cbx" id="labelcbx" type="checkbox" {if $estate.archived == 0}checked{/if}/>
            <label class="cbx" for="labelcbx"><span></span><span>Active</span></label>
            <input type="hidden" name="archived" value="{if $estate.archived == 0}1{else}0{/if}">
        </div>
        <button type="submit">Save</button>
    </form>

</div>
