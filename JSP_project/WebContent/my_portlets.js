function PortletsCtrl($scope) {
  $scope.portlets = [
    {name:'Graph', desc: 'this will be my graph', size:'lg'},
    {name:'Table', desc: 'this will be my table', size:'sm'},
    {name:'Chart', desc: 'this will be my chart', size:'sm'}
  ];
  
  $scope.portlets2 = [
     {name:'Graph2', desc: 'this will be my graph2', size:'sm'},
     {name:'Table2', desc: 'this will be my table2', size:'sm'}
  ];
 
  $scope.add_portlet = function() {
    $scope.portlets.push({name:$scope.portletName, desc:$scope.portletDesc, size:$scope.portletSize});
    $scope.portletName = '';
    $scope.portletDesc = '';
  };
  
  $scope.changesize = function(item) {
	  item.size = 'sm';
  };
}