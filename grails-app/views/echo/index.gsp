<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Simple Ajax</title>
    <g:javascript library="jquery"/>
    <style>
    #echoBox {
        border: 1px solid #000; width: 300px; height: 100px; background-color: #c0c0c0;
    }
    </style>
</head>
<body>
<g:link controller="echo" action="pnr">CheckPnr</g:link>


<div id="echoBox">Please Enter 10 Digit pnr
</div>
<g:remoteField maxlength="10" controller="echo" action="checkpnr" update="results" name="rf" onLoading="showSpinner(true);" onComplete="showSpinner(false);"/>

<div id="results">
    <g:render template="pnrResults"/>
</div>


</body>
</html>	