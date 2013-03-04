<!doctype html>
<html ng-app>
	<head>
		<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/angularjs/1.0.4/angular.min.js"></script>
		<script type="text/javascript" src="my_portlets.js"></script>
		<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
  		<script src="http://code.jquery.com/ui/1.10.1/jquery-ui.js"></script>
		<link rel="stylesheet" type="text/css" href="style.css">
		<style>
		#sortable { list-style-type: none; padding: 0; float: left; margin: 0; width: 608px; background:blue }
		#sortable li { margin: 2px; float: left; padding: 0; background:lightblue }
		#sortable2 { list-style-type: none; margin: 0; padding: 0; float:left; width: 304px; background:green }
		#sortable2 li { margin: 2px; padding: 0; background:lightgreen }
		</style>
		<script>
		$(function() {
		$( "#sortable" ).sortable();
		$( "#sortable" ).disableSelection()
		$( "#sortable2" ).sortable();
		$( "#sortable2" ).disableSelection();
		});
		</script>
	</head>
	<body>
		<div ng-controller="PortletsCtrl">
			<div style="float:left">
			<ul id="sortable">
				<li ng-repeat="portlet in portlets" class="{{portlet.size}}">{{portlet.name}}:<br>{{portlet.desc}}</li>
			</ul>
			</div>
			<div style="float:left">
			<ul id="sortable2">
				<li ng-repeat="portlet2 in portlets2" class="{{portlet2.size}}">{{portlet2.name}}:<br>{{portlet2.desc}}</li>
			</ul>
			</div>
			<br style="clear:left">
			<form ng-submit="add_portlet()">
				<input type="text" ng-model="portletName" placeholder="New portlet name">
				<input type="text" ng-model="portletDesc" placeholder="Portlet description">
				<br>
				<input type="radio" ng-model="portletSize" value="sm"> Small 
				<input type="radio" ng-model="portletSize" value="lg"> Large 
				<br>
				<input type="submit" value="Add portlet">
			</form>
		</div>
	</body>
</html>