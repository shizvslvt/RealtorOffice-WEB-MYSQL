<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.7.0/chart.min.js"></script>
<br><br>

<label style="color: white">Sales By City in {$current_year}</label>
<div style="display: flex; width: 300px;">
    <canvas id="circleDiagram" style="width: 200px; margin: 10px"></canvas>
    <div><ul id="cityList" style="width: 200px"></ul></div>

</div>

<script>

    function getRandomColor() {
        var letters = '0123456789ABCDEF';
        var color = '#';
        for (var i = 0; i < 6; i++) {
            color += letters[Math.floor(Math.random() * 10)];
        }
        return color;
    }
    var circleData = {$circleData|json_encode};
    if (circleData.length === 0) {
        console.log("Отсутствуют данные для построения диаграммы");
    } else {
        var totalSales = 0;
        circleData.forEach(function (item) {
            totalSales += item.value;
        });
        var labels = [];
        var values = [];
        var backgroundColors = [];
        var colorMapping = [];
        circleData.forEach(function (item) {
            labels.push(item.label);
            values.push(item.value);
            var color = getRandomColor();
            backgroundColors.push(color);
            colorMapping[item.label] = color;
            var percentage = ((item.value / totalSales) * 100).toFixed(2) + '%';
            var listItem = document.createElement('li');
            listItem.textContent = item.label  + ' - ' + item.value + ' (' + percentage + ')';
            listItem.style.color = color;
            document.getElementById('cityList').appendChild(listItem);
        });
        var ctx = document.getElementById('circleDiagram').getContext('2d');
        var circleDiagram = new Chart(ctx, {
            type: 'doughnut',
            data: {
                labels: labels,
                datasets: [{
                    data: values,
                    backgroundColor: backgroundColors
                }]
            }
        });
    }
</script>
