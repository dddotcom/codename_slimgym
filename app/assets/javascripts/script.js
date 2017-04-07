$(function(){

    var pie = true;
    var isGoal = false;
    var chart, chart2;
    var numCheckins = gon.num_checkins;
    var maxCheckins = gon.max_checkins;
    
    
    renderChart();
    $("#pieTrue").css("background-color", "#696969")
    function changeBorder() {
        if (pie) {
            $("#pieTrue").css("background-color", "#696969")
            $("#pieFalse").css("background-color", "orange")
        } else {
            $("#pieTrue").css("background-color", "orange")
            $("#pieFalse").css("background-color", "#696969")
        }
    }

    $("#pieTrue").click(function() {
        pie = true
        renderChart();
        changeBorder();
    });

    $("#pieFalse").click(function() {
        pie = false
        renderChart();
        changeBorder();
    });

    function renderChart() {
        if(pie){
            var chart = c3.generate({
                bindto: '#chart',
                data: {
                columns: [
                    ['Days Gone', numCheckins],
                    ['Days Left', 10],
                    ['Money Lost', maxCheckins - numCheckins - 10]

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
                    max: 30,
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