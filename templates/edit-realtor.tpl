<link rel="stylesheet" href="../assets/style/auth_style.css">

<div class="auth">
    <h2>Edit Realtor</h2>
<form action="?p=edit-realtor&id={$realtor.id}" method="POST">
    <div class="user-box">
        <input type="text" name="user_id" required="" value="{$realtor.user_id}">
        <label>User ID</label>
    </div>
    <div class="user-box">
        <input type="text" name="percent" required="" value="{$realtor.percent}">
        <label>Percent</label>
    </div>
    <div class="user-box-active">
        <input type="date" name="exp" required="" value="{$realtor.experience}">
        <label class="active">Experience</label>
    </div>
    <button type="submit">Save</button>
</form>
</div>

