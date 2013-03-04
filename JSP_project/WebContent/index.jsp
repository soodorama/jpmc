<!doctype html>
<html ng-app>
	<head>
		<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/angularjs/1.0.4/angular.min.js"></script>
		<script type="text/javascript" src="my_portlets.js"></script>
		<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
  		<script src="http://code.jquery.com/ui/1.10.1/jquery-ui.js"></script>
		<link rel="stylesheet" type="text/css" href="style.css">
		<script>
		$(function() {
			$( "#leftcol, #rightcol" ).sortable({
				connectWith: ".connectedSortable",
				revert: 100,
				receive: function(event, ui) {
					if($(ui.item[0]).hasClass("lg")) {
						$(ui.item[0]).removeClass("lg");
						$(ui.item[0]).addClass("sm");
					}
					else if($(ui.item[0]).hasClass("sm")) {
						$(ui.item[0]).removeClass("sm");
						$(ui.item[0]).addClass("lg");
					}
				}
			}).disableSelection();
		});
		</script>
	</head>
	<body>
		<div ng-controller="PortletsCtrl">
			<div id="leftcol" class="connectedSortable">
				<div ng-repeat="portlet in portlets" class="{{portlet.size}}">{{portlet.name}}:<br>{{portlet.desc}}</div>
			</div>
			<div id="rightcol" class="connectedSortable">
				<div ng-repeat="portlet2 in portlets2" class="{{portlet2.size}}">{{portlet2.name}}:<br>{{portlet2.desc}}</div>
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