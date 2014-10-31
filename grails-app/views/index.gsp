<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Welcome PNR Status</title>
    <g:javascript library="jquery"/>
    <style>
    #echoBox {
        border: 1px solid #000; width: 300px; height: 100px; background-color: #c0c0c0;
    }
    </style>
</head>
<body>



<div style="border: 2px solid #32CD32;padding: 10px 10px;background: #FFFFF0;width: 220px;border-radius: 15px; font-family: Lucida Grande">

<b>&#8608;</b>Please Enter 10 Digit pnr<br>
<b>&#8608;</b>Sample pnr:4100979246<br>
<b>&#8608;</b>Wait for a while to see result
<b>&#8608;</b>Like us if you love it

<br>
</div>
</br>
%{--<div>
<div style="float: left">--}%
<g:remoteField maxlength="10" controller="echo"  action="checkpnr" update="results" name="rf" onLoading="showSpinner(true);" onComplete="showSpinner(false);"/>
%{--</div>--}%
<div class="bouncer" style="color: #abbf78;left: 210px;top:-21px;"><h3>&#8678;Enter your PNR</h3></div>
%{--</div>--}%
<div style="clear: both;"></div>
<div id="results">
    <g:render template="/echo/pnrResults"/>
</div>


</body>
</html>	