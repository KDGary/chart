<head>
  <script src="http://code.jquery.com/jquery-latest.js"></script>
  <script src="/resources/js/Chart.js"></script>
  <script src="./Chart.min.js"></script>
</head>

	<div style="width:30%">
		<div>
			<canvas id="canvas" height="450" width="600"></canvas>
		</div>
	</div>
<script>
var chartLabels = [];
var chartData1 = [];
var chartData2 = [];

$.getJSON("http://localhost:9080/gsonList",
  function(data) {
	$.each(data, function(inx, obj) {
		chartLabels.push(obj.job_id);
		chartData1.push(obj.max_salary);
		chartData2.push(obj.min_salary);
		
	});
	
	createChart();
  });

var lineChartData = {
	labels : chartLabels,
	datasets : [
		{
			label: "My First dataset",
			fillColor : "rgba(220,220,220,0.2)",
			strokeColor : "rgba(220,220,220,1)",
			pointColor : "rgba(220,220,220,1)",
			pointStrokeColor : "#fff",
			pointHighlightFill : "#fff",
			pointHighlightStroke : "rgba(220,220,220,1)",
			data : chartData1 
		},
		{
			label: "My Second dataset",
			fillColor : "rgba(151,187,205,0.2)",
			strokeColor : "rgba(151,187,205,1)",
			pointColor : "rgba(151,187,205,1)",
			pointStrokeColor : "#fff",
			pointHighlightFill : "#fff",
			pointHighlightStroke : "rgba(151,187,205,1)",
			data : chartData2
		}
	]

}

function createChart(){
	var ctx = document.getElementById("canvas").getContext("2d");
	window.myLine = new Chart(ctx).Line(lineChartData, {
		responsive: true
	});
}
</script>


