<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.7.0/chart.min.js"></script>
<canvas id="Estates" width="5" height="1"></canvas>
<script>
    var createdData = {
        labels: {$combined_data.created.labels|json_encode},
        datasets: [{
            label: '{$combined_data.created.datasetLabel}',
            data: {$combined_data.created.datasetValues|json_encode},
            backgroundColor: 'rgb(255,255,255)',
            borderColor: 'rgba(35,255,196,0.5)',
            borderWidth: 1
        }]
    };

    var soldData = {
        labels: {$combined_data.sold.labels|json_encode},
        datasets: [{
            label: '{$combined_data.sold.datasetLabel}',
            data: {$combined_data.sold.datasetValues|json_encode},
            backgroundColor: 'rgb(255,255,255)',
            borderColor: 'rgba(255,99,132,0.5)',
            borderWidth: 1
        }]
    };

    var ctx = document.getElementById('Estates').getContext('2d');

    var combinedChart = new Chart(ctx, {
        type: 'line',
        data: createdData,
        options: {
            scales: {
                y: {
                    beginAtZero: true
                }
            }
        }
    });

    combinedChart.data.datasets.push(soldData.datasets[0]);
    combinedChart.update();
</script>
