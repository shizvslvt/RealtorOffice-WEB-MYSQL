<link rel="stylesheet" href="../assets/style/logs_style.css">

<div class="control-panel-items">
<div class="control-panel-item">
    <h1>Logs</h1>
    <table>
        <tr>
            <th>ID</th><th>Text</th><th>Link</th><th>Type</th><th>Date</th><th>User ID</th><th>Estate ID</th>
        </tr>
        {foreach $logs as $log}
            <tr><td>{$log.id}</td><td>{$log.text}</td><td>{$log.link}</td><td>{$log.type}</td><td>{$log.date}</td><td>{$log.user_id}</td><td>{$log.estate_id}</td>
            </tr>
        {/foreach}
    </table>
</div>
</div>

