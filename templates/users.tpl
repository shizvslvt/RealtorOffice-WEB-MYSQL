<link rel="stylesheet" href="../assets/style/statistic_style.css">
<h1>Statistics for Users</h1>
<form>
    <label for="user_select">Select(ed) User:</label>
    <select id="user_select" onchange="redirectToUser()">
        {foreach $list_users as $user}
            <option value="{$user.id}" {if $user.id == {$current_user_id}}selected{/if}>{$user.id}</option>
        {/foreach}
    </select>
        <h3>Current Estates for Selected User:</h3>
</form>


<script>
    function redirectToUser() {
        var userId = document.getElementById('user_select').value;
        var link = '?p=control-panel&c=statistic&a=users&id=' + userId;
        window.location.href = link;
    }
</script>
