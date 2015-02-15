<!DOCTYPE html>

<html lang="en" ng-app="trainsModule">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Trains-SeatAvailability</title>
<meta charset="utf-8">
<script type="text/javascript">


</script>



<link rel="stylesheet" href="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
<link rel="stylesheet" href="${resource(dir: 'css', file: 'masterdrid.css')}"/>
<link rel="stylesheet" href="${resource(dir: 'css', file: 'profiledrid.css')}"/>

<script src="http://code.jquery.com/jquery-1.7.1.min.js"></script>
<script src= "http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.16/jquery-ui.js"></script>
<link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1/themes/flick/jquery-ui.css" rel="stylesheet"/>

<script src= "http://ajax.googleapis.com/ajax/libs/angularjs/1.2.26/angular.min.js"></script>
<script src= "${resource(dir: 'js', file: 'trainsapp.js')}"></script>
<link rel="stylesheet" href="http://jqueryui.com/resources/demos/style.css"/>

</head>

<body id="profile" class="logged-out not-pro not-self not-team scroll" ng-controller="TrainsController" style="font-size: 11px;">


<hr>

<div class="ajax notice hide">
    <h2></h2>
</div>




<div id="wrap">

    <div class="profile-dash group">
        <div class="profile-dash-inner">
            <ul class="profile-stats">

                <li class="shots">

                    <a href="http://checkpnr.herokuapp.com">
                        <span class="meta">PnrStatus</span>
                    </a>
                </li>



                <li class="shots">

                    <a href="#">
                        <span class="meta">Plan Your Journey</span>
                    </a>
                </li>




                <li class="shots">

                    <a href="#">
                        <span class="meta">Developer</span>
                    </a>
                </li>


            </ul>

        </div>
    </div>


    <div id="wrap-inner">

        <div id="content" class="group">

            <div class="notice-alert">
                <h3><!-- message goes here --></h3>
                <a href="#" class="close">

                </a>
            </div>




            <div id="main" class="main-full profile-container ">
                <div class="profile-head">
                    <h1>
                        <a href="#" class="url" rel="contact" title="Raviteja Mulukuri">
                            <div>
                                <img alt="Me-eye-edit1_finished" class="photo" height="80" src="${resource(dir: 'images', file: 'ravi.jpg')}" width="80">
                            </div>
                            <span class="name">Raviteja Mulukuri</span>
                        </a></h1>

                    <h2 class="bio"></h2>


                    <div class="profile-dash-actions">

                    </div>
                </div>

            </div>

        </div> <!-- /content -->
    </div></div> <!-- /wrap -->

<hr>
<div style="width: 100%; overflow: hidden;margin-left:5px;">
    <div style="width: 180px; float: left;" class="ui-widget">
        <iframe src="//www.facebook.com/plugins/like.php?href=https%3A%2F%2Fwww.facebook.com%2Fpages%2FProgrammerworks%2F799070020131801&amp;width=120&amp;layout=button_count&amp;action=like&amp;show_faces=true&amp;share=true&amp;height=21&amp;appId=841354282549502" scrolling="no" frameborder="0" style="border:none; overflow:hidden; width:140px; height:21px;" allowTransparency="true"></iframe>
        <select id="sel" class="input-block-level" ng-model="quota" ng-options="obj.id as obj.name for obj in list_categories.data" ng-change="updateQuota(quota)" style="margin:2px;width: 190px;">
        <input auto-complete ui-items="names" ng-model="from" placeholder="Enter From Station" style="margin:2px;width: 190px;"/>
        <input auto-complete ui-items="names" ng-model="to" placeholder="Enter To Station" style="margin:2px;width: 190px;"/>
        <input id="date" type="date" ng-model="date" name="jdate" style="margin:2px;width:190px;height:25px;" />
        <button type="submit" ng-click="getTrainsBetweenStations(from,to,date,quota)">Search</button><br/>
    </div>
    <div style="margin-left: 200px;">
<div style="background-color: #dddddd;height:30px;">
    <center><pre style="font-size:12px;" ng-show="seats.response_code=='500'">{{seats.error}}</pre></center>
    <center ng-show="showLoader=='Y'"><img  src="${resource(dir: 'images', file: 'spinner.gif')}"></center>
    <div class="row">

        <div class="col-md-2" ng-repeat="ava in seats.availability.availability_status">
            <pre style="color: #4169e1;">{{ava.date}}<br/>{{ava.status}}</pre>
        </div>

    </div>
</div>
    <table style="width: 100%;" class="table table-bordered table-striped">
            <tr>
                <td>Train No</td><td>Train Name</td><td>From</td><td>Departure</td><td>To</td><td>Arrival</td><td>M</td><td>T</td><td>W</td><td>T</td><td>F</td><td>S</td><td>S</td><td>Class</td>

            </tr>
        <tr ng-repeat="tlist in trainslist.trains">
            <td>{{tlist.number}}</td>
            <td>{{tlist.name}}</td>
            <td>{{trainslist.from_station.code}}</td>
            <td>{{tlist.src_departure_time}}</td>
            <td>{{trainslist.to_station.code}}</td>
            <td>{{tlist.dest_arrival_time}}</td>
            <td>{{tlist.days[1].runs}}</td>
            <td>{{tlist.days[2].runs}}</td>
            <td>{{tlist.days[3].runs}}</td>
            <td>{{tlist.days[4].runs}}</td>
            <td>{{tlist.days[5].runs}}</td>
            <td>{{tlist.days[6].runs}}</td>
            <td>{{tlist.days[0].runs}}</td>
            <td><a href="" ng-click="greetVisitor(getClasses(tlist.classes[0],'1A'),tlist.number)">{{getClasses(tlist.classes[0],'1A')}}</a><a href="" ng-click="greetVisitor(getClasses(tlist.classes[1],'2A'),tlist.number)"> {{getClasses(tlist.classes[1],'2A')}}</a> <a href="" ng-click="greetVisitor(getClasses(tlist.classes[2],'FC'),tlist.number)">{{getClasses(tlist.classes[2],'FC')}}</a> <a href="" ng-click="greetVisitor(getClasses(tlist.classes[3],'3A'),tlist.number)">{{getClasses(tlist.classes[3],'3A')}}</a> <a href="" ng-click="greetVisitor(getClasses(tlist.classes[4],'CC'),tlist.number)">{{getClasses(tlist.classes[4],'CC')}}</a> <a href="" ng-click="greetVisitor(getClasses(tlist.classes[5],'SL'),tlist.number)">{{getClasses(tlist.classes[5],'SL')}}</a> <a href="" ng-click="greetVisitor(getClasses(tlist.classes[6],'2S'),tlist.number)">{{getClasses(tlist.classes[6],'2S')}}</a><a href="" ng-click="greetVisitor(getClasses(tlist.classes[7],'3E'),tlist.number)"> {{getClasses(tlist.classes[7],'3E')}}</a></td>
        </tr>
    </table>
        <center><pre style="font-size: 12px;" ng-show="trainslist.response_code=='500'"> {{trainslist.error}}</pre></center>
                    <div style="width:69px;height:89px;border:1px solid black;position:absolute;top:30%;left:50%;padding:2px;border:0px;" ng-show="showTLoader=='Y'">
        <center><img  src="${resource(dir: 'images', file: 'demo_wait.gif')}"></center>
                       </div>
    </div>
</div>
</body>
</html>