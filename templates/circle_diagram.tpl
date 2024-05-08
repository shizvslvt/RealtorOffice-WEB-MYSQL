<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.7.0/chart.min.js"></script>
<br>

<div style="width: 200px; height: 200px">
    <canvas id="circleDiagram"></canvas>
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
        var labels = [];
        var values = [];
        var backgroundColors = [];
        circleData.forEach(function (item) {
            labels.push(item.label);
            values.push(item.value);
            backgroundColors.push(getRandomColor());
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

