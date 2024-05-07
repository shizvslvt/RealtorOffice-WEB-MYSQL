<h1>Sold Estates Statistics</h1>
<form>
    <label for="year_month">Год и месяц:</label>
    <input type="month" id="year_month" name="year_month">
    <button type="button" onclick="redirectToLink()">Подтвердить</button>
</form>


<div class="control-panel-item statistic">
    [{$current_date}] Total Sold Estates : {$sold_estates_by_date}
</div>






<script>
    function redirectToLink() {
        var yearMonth = document.getElementById('year_month').value;
        var link = '?p=control-panel&c=statistic&a=sold-estates&d=' + yearMonth;
        window.location.href = link;
    }
</script>