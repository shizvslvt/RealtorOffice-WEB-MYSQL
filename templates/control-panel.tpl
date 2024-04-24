<link rel="stylesheet" href="../assets/style/realtors_style.css">


<div class="realtor-item">
    <h1>Realtors</h1>
    <table>
        <thead>
        <tr>
            <th>ID</th>
            <th>User ID</th>
            <th>Percent</th>
            <th>Experience</th>
            <th>Action</th>
        </tr>
        </thead>
        <tbody>
        {foreach $realtors as $realtor}
            <tr>
                <td>{$realtor.id}</td>
                <td>{$realtor.user_id}</td>
                <td>{$realtor.percent}</td>
                <td>{$realtor.experience}</td>
                <td><a href="?p=edit-realtor&id={$realtor.id}">Edit</a></td>
            </tr>
        {/foreach}
        </tbody>
    </table>

</div>

