/**
 * Created by Administrator on 2016-10-23.
 */



$(function(){
    var now = new Date(); //当前日期
    var nowDayOfWeek = now.getDay(); //今天本周的第几天
    var nowDay = now.getDate(); //当前日
    var nowMonth = now.getMonth(); //当前月
    var nowYear = now.getFullYear(); //当前年
    //获得某月的天数
    function getMonthDays(myMonth){
        var monthStartDate = new Date(nowYear, myMonth, 1);
        var monthEndDate = new Date(nowYear, myMonth + 1, 1);
        var days = (monthEndDate - monthStartDate)/(1000 * 60 * 60 * 24);
        return days;
    }
    //获取本月第一天
    function getFirstDay() {
        return new Date(nowYear, nowMonth, 1)
    }
    //获取本月最后一天
    function getLastDay() {
        return new Date(nowYear, nowMonth, getMonthDays(nowMonth))
    }

    var endDate = $("#endDate").val();
    var startDate;
    if(endDate!="") {
        startDate = new Date(nowYear, nowMonth, 1);
        endDate = new Date(nowYear, nowMonth, getMonthDays(nowMonth));
    }else {
        endDate = getLastDay();
        startDate = getFirstDay();
    }
    Chart.defaults.global.legend = {
        enabled: false
    };


    $("#ivSearch").click(function(){
        $.ajax({
            url: "../../../chart/salesProfitBar.form",
            data: {startDate:startDate,endDate:endDate},
            type:'post',
            dataType:'json',
            success:function(result){
                // alert(result);

                var data=new Array();  //data是一个数组
                var labels = new Array();
                $(result).each(function(i){
                    //alert("i:" + i + "," + this.s_name + "," + this.number);
                    //data[i]=new Array();  // data[i] 声明为数组
                    labels[i]=this.goods_name;
                    data[i]=this.spr_total_profit;
                });
                //支持js二维数组、json格式、xml格式数据源
                /* var myData = new Array([ "商品1", 20 ], [  "商品2", 10 ], [  "商品3", 30 ], [  "商品4", 10 ],
                 [  "商品5", 5 ]); */
                //第二个参数值有：line,bar,pie分别表示用线形图、柱状图、饼图来展示报表
                var ctx = document.getElementById("mybarChart");
                var mybarChart = new Chart(ctx, {
                    type: 'bar',
                    data: {
                        labels: labels,
                        datasets: [{
                            label: '本月利润',
                            backgroundColor: "#26B99A",
                            data: data
                        }]
                    },

                    options: {
                        scales: {
                            yAxes: [{
                                ticks: {
                                    beginAtZero: true
                                }
                            }]
                        }
                    }
                });
                // var myChart = new JSChart('#mybarChart',"bar");
                //数据源处理方式一：setDataArray(myData)使用js数组
                // myChart.setDataArray(data);
                //数据源处理方式二：setDataJSON使用json格式数据
                //myChart.setDataJSON(result);
                //数据源处理方式三：setDataXML使用xml格式数据
                //myChart.setDataXML("data.xml");

                // myChart.setTitle('测试报表');

                // myChart.draw();
            }
        });



    });
});


// Bar chart
/*
var ctx = document.getElementById("mybarChart");
var mybarChart = new Chart(ctx, {
    type: 'bar',
    data: {
        labels: ["January", "February", "March", "April", "May", "June", "July"],
        datasets: [{
            label: '# of Votes',
            backgroundColor: "#26B99A",
            data: [51, 30, 40, 28, 92, 50, 45]
        }, {
            label: '# of Votes',
            backgroundColor: "#03586A",
            data: [41, 56, 25, 48, 72, 34, 12]
        }]
    },

    options: {
        scales: {
            yAxes: [{
                ticks: {
                    beginAtZero: true
                }
            }]
        }
    }
});*/
