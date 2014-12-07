<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="layout" content="main1"/>
    <title>Full Page Background Image | Progressive</title>
    <link rel="stylesheet" href="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/button.css">
    <link rel="stylesheet" href="css/styles.css">
    <link rel="stylesheet" href="css/media.css">
    <g:javascript library="jquery"/>
    <style>
    </style>
</head>

<body class="back">
<!--
<div id="header" style="top:0;border:3px;background-color:#F5F5F5;width:110%;position:fixed;height:7%;opacity:0.8;">
<p class="muted credit">How it works?<a href="http:progragmmerworks.blogspot.com">Like</a> and <a href="http://ryanfait.com/sticky-footer/">Ravi</a>.</p>
</div>

-->

<div class="divbox">
    <g:formRemote name="a" url="[controller:'echo',action:'checkpnr']" update="results" onLoading="showSpinner(true);" onComplete="showSpinner(false);">
        <g:textField class="tf tsz" id="search" name="rf" placeholder="Enter your pnr number"/>

        <input type="submit" class="myButton bs" value="Go"/>
    </g:formRemote>

</div>

<!-- include table -->
<div id="results">
    <g:render template="/echo/diff"/>
</div>
<!-- table ends -->

<div id="footer" style="background-color:black;opacity:0.8;">
    <div class="container" style="background-color:black;opacity:0.8;">
        <p class="muted credit">Programmer Works <a href="http:progragmmerworks.blogspot.com">Ravi Teja</a> and <a href="http://ryanfait.com/sticky-footer/">Ravi</a>.</p>
    </div>
</div>


</body>
</html>