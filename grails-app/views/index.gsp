<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="layout" content="main1"/>
    <meta name="viewport" content="width=device-width"/>
    <title>PNR Status</title>
    <link rel="stylesheet" href="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/button.css"/>
    <link rel="stylesheet" href="css/media.css"/>
    <link rel="stylesheet" href="css/styles.css"/>
    <g:javascript library="jquery"/>
     <link rel="stylesheet" href="css/table.css"/>
    <link rel="stylesheet" href="css/css-tricks.css"/>

</head>

<body>
<!--
<div id="header" style="top:0;border:3px;background-color:#F5F5F5;width:110%;position:fixed;height:7%;opacity:0.8;">
<p class="muted credit">How it works?<a href="http:progragmmerworks.blogspot.com">Like</a> and <a href="http://ryanfait.com/sticky-footer/">Ravi</a>.</p>
</div>

-->
<div style="float: right;top: 0px;right: 0px;position: absolute;color: black;">
    <iframe src="//www.facebook.com/plugins/like.php?href=https%3A%2F%2Fwww.facebook.com%2Fpages%2FProgrammerworks%2F799070020131801&amp;width&amp;layout=standard&amp;action=like&amp;show_faces=false&amp;share=false&amp;height=35&amp;colorscheme=dark&amp;appId=841354282549502" scrolling="no" frameborder="0" style="border:none; overflow:hidden; height:35px;" allowTransparency="true"></iframe>
</div>
<div class="divbox">

    <input type="text" class="tf tsz" id="search"  ng-model="rf" placeholder="Enter your pnr number" maxlength="10"/>

    <button type="submit" ng-click="getPnr(rf)" class="myButton bs" >Go</button><br/>
    
</div>


<div class="alert alert-danger" role="alert" ng-show="results.error" style="margin-left:1%;margin-right:1%;">{{results.error}}</div>


<!-- include table -->

<div id="page-wrap" ng-show="results.train_num">

    <table class="table1">
        <thead>
        <tr>
            <th style="width: 20%">PNR</th>
            <th style="width: 20%">Date Of Journey</th>
            <th style="width: 20%">Class</th>
            <th style="width: 20%">ChartPrepared</th>
            <th style="width: 20%">From Station</th>

        </tr>
        </thead>
        <tbody>
        <tr>
            <td>{{results.pnr}}</td>
            <td>{{results.doj}}</td>
            <td>{{results.class}}</td>
            <td>{{results.chart_prepared}}</td>
            <td>{{results.from_station.name}}</td>
        </tr>
        </tbody>

    </table>
    <table class="table2">
        <thead>
        <tr>
            <th style="width: 20%">To Station</th>
            <th style="width: 20%">Reservation Upto</th>
            <th style="width: 20%">Train Name</th>
            <th style="width: 20%">Train Number</th>
            <th style="width: 20%">No Of Passengers</th>

        </tr>
        </thead>
        <tbody>
        <tr>
            <td>{{results.to_station.name}}</td>
            <td>{{results.reservation_upto.name}}</td>
            <td>{{results.train_name}}</td>
            <td>{{results.train_num}}</td>
            <td>{{results.no_of_passengers}}</td>
        </tr>
        </tbody>
    </table>
    <table class="table3">
        <thead>
        <tr>
            <th style="width: 33.33%">SNO</th><th style="width: 33.33%">Booking Status</th><th style="width: 33.33%">Current Status</th>
        </tr>
        </thead>
        <tr ng-repeat="pass in results.passengers">
            <td>{{pass.sr}}</td><td>{{pass.booking_status}}</td><td>{{pass.current_status}}</td>
        </tr>
    </table>

</div>


<!-- table ends -->

<div id="footer" style="background-color:black;opacity:0.6;">
    <div class="container" style="background-color:black;opacity:0.8;">
        <p class="muted credit" style="color: #ffffff;">Programmer Works by <a href="http://programmerworks.blogspot.in/2014/11/check-pnr-status.html">Ravi Teja</a> Developed on grails platform & Angular JS</p>
    </div>

</div>


</body>
</html>