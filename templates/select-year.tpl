<link rel="stylesheet" href="../assets/style/statistic_style.css">

<form>
    <label for="year">Year:</label>
    <input type="year" id="year" name="year">
    <button type="button" onclick="redirectToLink()">Go</button>
</form>
<script>
    function redirectToLink() {
        var year = document.getElementById('year').value;
        var link = '?p=control-panel&c=statistic&a=total-estates&d=' + year;
        window.location.href = link;
    }
</script>