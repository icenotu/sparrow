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
    var endDate1 = $("#endDate1").val();
    var startDate1;
    if(endDate1!="") {
        startDate1 = new Date(nowYear, nowMonth, 1);
        endDate1 = new Date(nowYear, nowMonth, getMonthDays(nowMonth));
    }else {
        endDate1 = getLastDay();
        startDate1 = getFirstDay();
    }
    var endDate2 = $("#endDate2").val();
    var startDate2;
    if(endDate2!="") {
        startDate2 = new Date(nowYear, nowMonth, 1);
        endDate2 = new Date(nowYear, nowMonth, getMonthDays(nowMonth));
    }else {
        endDate2 = getLastDay();
        startDate2 = getFirstDay();
    }
    var endDate3 = $("#endDate3").val();
    var startDate3;
    if(endDate3!="") {
        startDate3 = new Date(nowYear, nowMonth, 1);
        endDate3 = new Date(nowYear, nowMonth, getMonthDays(nowMonth));
    }else {
        endDate3 = getLastDay();
        startDate3 = getFirstDay();
    }
    var endDate4 = $("#endDate4").val();
    var startDate4;
    if(endDate4!="") {
        startDate4 = new Date(nowYear, nowMonth, 1);
        endDate4 = new Date(nowYear, nowMonth, getMonthDays(nowMonth));
    }else {
        endDate4 = getLastDay();
        startDate4 = getFirstDay();
    }
    var endDate5 = $("#endDate5").val();
    var startDate5;
    if(endDate5!="") {
        startDate5 = new Date(nowYear, nowMonth, 1);
        endDate5 = new Date(nowYear, nowMonth, getMonthDays(nowMonth));
    }else {
        endDate5 = getLastDay();
        startDate5 = getFirstDay();
    }
    // Chart.defaults.global.legend = {
    //     enabled: false
    // };


    $("#ivSearch").click(function(){
        $.ajax({
            url: "../../../chart/salesProfitBar.form",
            data: {startDate:startDate,endDate:endDate},
            type:'post',
            dataType:'json',
            success:function(result){
                // alert(result);

                var data1=new Array();  //data是一个数组
                var data2=new Array();  //data是一个数组
                var labels = new Array();
                $(result).each(function(i){
                    //alert("i:" + i + "," + this.s_name + "," + this.number);
                    //data[i]=new Array();  // data[i] 声明为数组
                    labels[i]=this.goods_name;
                    data1[i]=this.scd_total_price;
                    data2[i]=this.scd_total_cost;
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
                            label: '本月收入',
                            backgroundColor: "#26B99A",
                            data: data1
                        },{
                            label: '本月成本',
                            backgroundColor: "#03586A",
                            data: data2
                        }]
                    },

                    options: {
                        scales: {
                            yAxes: [{
                                ticks: {
                                    beginAtZero: true,
                                    // stepSize:3000
                                },
                                pointLabels:{
                                    fontColor:"#f00"
                                }
                            }]
                        }
                    },

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

    $("#ivSearch1").click(function(){
        $.ajax({
            url: "../../../chart/salesProfitBar.form",
            data: {startDate:startDate1,endDate:endDate1},
            type:'post',
            dataType:'json',
            success:function(result){

                var data1=new Array();  //data是一个数组
                var data2=new Array();  //data是一个数组
                var labels = new Array();
                $(result).each(function(i){
                    labels[i]=this.goods_name;
                    data1[i]=this.scd_total_price;
                    data2[i]=this.scd_total_cost;
                });
                // Line chart
                var ctx = document.getElementById("lineChart");
                var lineChart = new Chart(ctx, {
                    type: 'line',
                    data: {
                        labels: labels,
                        datasets: [{
                            label: "收入",
                            backgroundColor: "rgba(38, 185, 154, 0.31)",
                            borderColor: "rgba(38, 185, 154, 0.7)",
                            pointBorderColor: "rgba(38, 185, 154, 0.7)",
                            pointBackgroundColor: "rgba(38, 185, 154, 0.7)",
                            pointHoverBackgroundColor: "#fff",
                            pointHoverBorderColor: "rgba(220,220,220,1)",
                            pointBorderWidth: 1,
                            data: data1
                        }, {
                            label: "成本",
                            backgroundColor: "rgba(3, 88, 106, 0.3)",
                            borderColor: "rgba(3, 88, 106, 0.70)",
                            pointBorderColor: "rgba(3, 88, 106, 0.70)",
                            pointBackgroundColor: "rgba(3, 88, 106, 0.70)",
                            pointHoverBackgroundColor: "#fff",
                            pointHoverBorderColor: "rgba(151,187,205,1)",
                            pointBorderWidth: 1,
                            data: data2
                        }]
                    },
                });
            }
        });



    });

    $("#ivSearch2").click(function(){
        $.ajax({
            url: "../../../chart/salesProfitBar.form",
            data: {startDate:startDate2,endDate:endDate2},
            type:'post',
            dataType:'json',
            success:function(result){

                var data1=new Array();  //data是一个数组
                var data2=new Array();  //data是一个数组
                var labels = new Array();
                $(result).each(function(i){
                    labels[i]=this.goods_name;
                    data1[i]=this.scd_total_price;
                    data2[i]=this.scd_total_cost;
                });
                // Doughnut chart
                var ctx = document.getElementById("canvasDoughnut");
                var data = {
                    labels: labels,
                    datasets: [{
                        data: data1,
                        backgroundColor: [
                            "#455C73",
                            "#9B59B6",
                            "#BDC3C7",
                            "#26B99A",
                            "#3498DB",
                            "#ed6b75",
                            "#e67f50",
                            "#03586A"
                        ],
                        hoverBackgroundColor: [
                            "#34495E",
                            "#B370CF",
                            "#CFD4D8",
                            "#36CAAB",
                            "#49A9EA",
                            "#ed6b75",
                            "#e67f50",
                            "#03586A"
                        ]

                    }]
                };
                var canvasDoughnut = new Chart(ctx, {
                    type: 'doughnut',
                    tooltipFillColor: "rgba(51, 51, 51, 0.55)",
                    data: data
                });
            }
        });



    });

    $("#ivSearch3").click(function(){
        $.ajax({
            url: "../../../chart/salesProfitBar.form",
            data: {startDate:startDate2,endDate:endDate2},
            type:'post',
            dataType:'json',
            success:function(result){

                var data1=new Array();  //data是一个数组
                var data2=new Array();  //data是一个数组
                var labels = new Array();
                $(result).each(function(i){
                    labels[i]=this.goods_name;
                    data1[i]=this.scd_total_price;
                    data2[i]=this.scd_total_cost;
                });
                // Radar chart
                var ctx = document.getElementById("canvasRadar");
                var data = {
                    labels: labels,
                    datasets: [{
                        label: "收入",
                        backgroundColor: "rgba(3, 88, 106, 0.2)",
                        borderColor: "rgba(3, 88, 106, 0.80)",
                        pointBorderColor: "rgba(3, 88, 106, 0.80)",
                        pointBackgroundColor: "rgba(3, 88, 106, 0.80)",
                        pointHoverBackgroundColor: "#fff",
                        pointHoverBorderColor: "rgba(220,220,220,1)",
                        data: data1
                    }, {
                        label: "成本",
                        backgroundColor: "rgba(38, 185, 154, 0.2)",
                        borderColor: "rgba(38, 185, 154, 0.85)",
                        pointColor: "rgba(38, 185, 154, 0.85)",
                        pointStrokeColor: "#fff",
                        pointHighlightFill: "#fff",
                        pointHighlightStroke: "rgba(151,187,205,1)",
                        data: data2
                    }]
                };

                var canvasRadar = new Chart(ctx, {
                    type: 'radar',
                    data: data,
                });
            }
        });



    });

    $("#ivSearch4").click(function(){
        $.ajax({
            url: "../../../chart/salesProfitBar.form",
            data: {startDate:startDate2,endDate:endDate2},
            type:'post',
            dataType:'json',
            success:function(result){

                var data1=new Array();  //data是一个数组
                var data2=new Array();  //data是一个数组
                var labels = new Array();
                $(result).each(function(i){
                    labels[i]=this.goods_name;
                    data1[i]=this.scd_total_price;
                    data2[i]=this.scd_total_cost;
                });
                // PolarArea chart
                var ctx = document.getElementById("polarArea");
                var data = {
                    datasets: [{
                        data: data2,
                        backgroundColor: [
                            "#455C73",
                            "#9B59B6",
                            "#BDC3C7",
                            "#26B99A",
                            "#3498DB",
                            "#ed6b75",
                            "#e67f50",
                            "#03586A"
                        ],
                        label: '成本' // for legend
                    }],
                    labels:labels
                };

                var polarArea = new Chart(ctx, {
                    data: data,
                    type: 'polarArea',
                    options: {
                        scale: {
                            ticks: {
                                beginAtZero: true
                            }
                        }
                    }
                });
            }
        });



    });

    $("#ivSearch5").click(function(){
        $.ajax({
            url: "../../../chart/salesProfitBar.form",
            data: {startDate:startDate2,endDate:endDate2},
            type:'post',
            dataType:'json',
            success:function(result){

                var data1=new Array();  //data是一个数组
                var data2=new Array();  //data是一个数组
                var labels = new Array();
                $(result).each(function(i){
                    labels[i]=this.goods_name;
                    data1[i]=this.scd_total_price;
                    data2[i]=this.scd_total_cost;
                });
                // Pie chart
                var ctx = document.getElementById("pieChart");
                var data = {
                    datasets: [{
                        data: data1,
                        backgroundColor: [
                            "#455C73",
                            "#9B59B6",
                            "#BDC3C7",
                            "#26B99A",
                            "#3498DB",
                            "#ed6b75",
                            "#e67f50",
                            "#03586A"
                        ],
                        label: '收入' // for legend
                    }],
                    labels: labels
                };

                var pieChart = new Chart(ctx, {
                    data: data,
                    type: 'pie',
                    
                });
            }
        });



    });
});
