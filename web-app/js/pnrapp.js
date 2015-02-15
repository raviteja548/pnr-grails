var app = angular.module('railwayModule',[]);

app.controller('PnrController', function($http,$scope) {
    $scope.results = "";
    $scope.getPnr = function (pnr) {
        console.log(pnr+"received");

        var responsePromise =$http({method: 'GET', url: 'http://checkpnr.herokuapp.com/echo/checkpnr',params:{rf:pnr}});
        responsePromise.success(function(data)
        {
            $scope.results = data; // response data
            console.log($scope.results);
        });

    }



});