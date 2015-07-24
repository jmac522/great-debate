
$(function () {
  var titles = $('#container').data('title');
  var scores = $('#container').data('score');
  var title = $('#container').data('topic');
  var graph = {
      chart: {
          type: 'bar'
      },
      title: {
          text: title
      },
      xAxis: {
          categories: titles
      },
      yAxis: {
          title: {
              text: 'Score'
          }
      },
      series: [{
          name: 'Votes',
          data: scores
      }]
  };

$('#container').highcharts(graph);
});
