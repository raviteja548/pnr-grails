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



<!-- Bootstrap start  -->

<div class="row">
    <div class="col-md-9" style="padding-top: 10px;">
        <div style="border: 1px solid #abbf78;padding: 10px 10px;background: #FFFFF0;width: 245px;border-radius: 0px; font-family: Lucida Grande;float: left;">

            <b>&#8608;</b>Please Enter 10 Digit pnr<br/>
            <b>&#8608;</b>Sample pnr:4100979246<br/>
            <b>&#8608;</b>Wait for a while to see result<br/>
            <b>&#8608;</b>Like us if you love it
        </div>
    </div>

    <div class="col-md-3" style="float:left;padding-top: 10px">
        <div style="float:right;border: 1px solid #abbf78;padding: 0px;">
            <iframe src="//www.facebook.com/plugins/likebox.php?href=http://www.facebook.com/pages/Programmerworks/799070020131801&width=292&height=258&colorscheme=light&show_faces=true&border_color&stream=false&header=false&" style="border:none; overflow:hidden; width:242px; height:205px;" >
            </iframe>
        </div>
    </div>
</div>


<!-- Bootstrap End -->



%{--<g:remoteField maxlength="10" controller="echo"  action="checkpnr" update="results" name="rf" onLoading="showSpinner(true);" onComplete="showSpinner(false);"/>--}%

<g:formRemote name="a" url="[controller:'echo',action:'checkpnr']" update="results" onLoading="showSpinner(true);" onComplete="showSpinner(false);">
    <g:textField  type="text" name="rf"/>
    <g:submitButton name="submit" value="Check PNR"/>
</g:formRemote>



%{--</div>--}%
%{--<div class="bouncer" style="color: #abbf78;left: 210px;top:-21px;"><h3>&#8678;Enter your PNR</h3></div>--}%
%{--</div>--}%
<div style="clear: both;"></div>
<div id="results">
    <g:render template="/echo/pnrResults"/>
</div>


</body>
</html>	