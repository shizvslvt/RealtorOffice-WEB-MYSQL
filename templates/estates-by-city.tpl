<link rel="stylesheet" href="../assets/style/statistic_style.css">
<h1>Estates by City</h1>
<form>
    <label for="city_select">Select(ed) city:</label>
    <select id="city_select" onchange="redirectToCity()">
        {foreach $list_city as $city}
            <option value="{$city['id']}" {if $city['id'] == $current_city_id}selected{/if}>
                {$city['total_estates']} | {$city['name']}
            </option>
        {/foreach}
    </select>
    <h3>Estates for City:</h3>
</form>




<script>
    function redirectToCity() {
        var cityId = document.getElementById('city_select').value;
        var link = '?p=control-panel&c=statistic&a=estates-by-city&id=' + cityId;
        window.location.href = link;
    }
</script>
