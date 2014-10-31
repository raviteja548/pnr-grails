<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title><g:layoutTitle default="Grails"/></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon">
    <link rel="apple-touch-icon" href="${resource(dir: 'images', file: 'apple-touch-icon.png')}">
    <link rel="apple-touch-icon" sizes="114x114" href="${resource(dir: 'images', file: 'apple-touch-icon-retina.png')}">
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}" type="text/css">
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'bouncearrow.css')}" type="text/css">
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'mobile.css')}" type="text/css">
    <g:layoutHead/>
    <g:javascript library="application"/>
    <r:layoutResources />
    <g:javascript library="prototype" plugin="prototype" />
    <g:javascript>
        function showSpinner(visible) {
            $('spinner').style.display = visible ? "inline" : "none";
        }

        Ajax.Responders.register({
            onLoading: function() {
                showSpinner(true);
            },
            onComplete: function() {
                if(!Ajax.activeRequestCount) showSpinner(false);
            }
        });


    </g:javascript>
</head>
<body>
<div>
<div id="grailsLogo" role="banner"><div style="float: left;"><a href="http://programmerworks.blogspot.in/"><img src="${resource(dir: 'images', file: 'train.gif')}" alt="programmerworks" height="80px" width="100px"/></a></div>
    <div style="float: left; margin-top: 55px; "><h2>PNR STATUS CHECK</h2></div>
    <div style="clear: both;"></div></div>
    %{--<div id="grailsLogo" role="banner" style="height: 80px">PNR STATUS</div>--}%
<div style="float: right; border: 1px solid;">
    <iframe src="//www.facebook.com/plugins/like.php?href=https%3A%2F%2Fwww.facebook.com%2Fpages%2FProgrammerworks%2F799070020131801&amp;width&amp;layout=standard&amp;action=like&amp;show_faces=true&amp;share=true&amp;height=80&amp;appId=841354282549502" scrolling="no" frameborder="0" style="border:none; overflow:hidden; height:80px;" allowtransparency="true"></iframe>
</div>
</div>

<g:layoutBody/>
<div class="footer" role="contentinfo"></div>

<table><thead><tr><th><h5>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Developed on grails platform</h5></th></thead>
</tr>
</table>

<div id="spinner"  class="spinner" style="display:none;"><g:message code="spinner.alt" default="Loading&hellip;"/></div>
<r:layoutResources />
</body>
</html>
