<!DOCTYPE html>
<html ng-app="railwayModule">
<head>
    <meta name="viewport" content="width=device-width"/>
    <title><g:layoutTitle default="Grails"/></title>

    <script src= "http://ajax.googleapis.com/ajax/libs/angularjs/1.2.26/angular.min.js"></script>
    <script src="js/pnrapp.js">
    </script>
    <link rel="stylesheet" href="https://css-tricks.com/examples/ResponsiveTables/css/style.css">


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
<body class="back"  ng-controller="PnrController">

<g:layoutBody/>
<div id="spinner"  class="spinner" style="display:none;"><g:message code="spinner.alt" default="Loading&hellip;"/></div>
<r:layoutResources />
</body>
</html>
