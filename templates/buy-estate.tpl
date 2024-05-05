<div class="buy-estate-item">
    <link rel="stylesheet" href="../assets/style/buy_estate_style.css">
    <div class="auth">
        <h2>Buy Estate</h2>
        <form action="?p=buy-estate-process&chat_id={$chat_id}" method="post">
            <h4>Total Cost, with Realtor Percent: {$total_cost}</h4>
            {if {$total_cost} > {$balance}}
                <h4>Your current Balance: {$balance}</h4>
                <h2>top up your balance</h2>
            {else}
            <button type="submit">Confirm</button> {/if}
        </form>
    </div>
</div>