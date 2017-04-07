$(function(){
    console.log("hey");

    var pie = true;
    var isGoal = false;
    var chart, chart2;
    var numCheckins = gon.num_checkins;
    var maxCheckins = gon.max_checkins;
    var daysLeft = gon.days_left;
    renderChart();

    $("#toggleChart").click(function() {
        pie = !pie
        console.log(pie)
        renderChart();
    });

    function renderChart() {
        if(pie){
            var chart = c3.generate({
                bindto: '#chart',
                data: {
                columns: [
                    ['Days Gone', numCheckins],
                    ['Days Left', daysLeft],
                    ['Money Lost', maxCheckins - numCheckins - daysLeft]
                ],
                type: 'pie'
                }
            });
        } else {

            var chart2 = c3.generate({
                bindto: '#chart',
                data: {
                    columns: [
                        ['Dollars Saved', (numCheckins)],
                    ],
                    type: 'gauge',
                },
                color: {
                    pattern: ['#FF0000', '#F97600', '#F6C600', '#60B044'], // the three color levels for the percentage values.
                    threshold: {
                        values: [maxCheckins]
                    }
                },
                size: {
                    height: 180
                },
                gauge: {
                    max: maxCheckins,
                    label: {
                        format: function(val, ratio){
                            return '$' + val;
                        }
                    }
                },
            });
        }
    }






});
