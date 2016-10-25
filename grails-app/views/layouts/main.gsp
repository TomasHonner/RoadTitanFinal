<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title><g:layoutTitle default="Road Titan"/></title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
  		<asset:stylesheet src="application.css"/>
		<asset:javascript src="application.js"/>
		<asset:javascript src="maplace.js"/>
		<asset:javascript src="ajax.js"/>
		<g:layoutHead/>
	</head>
	<body>
	<div id="header" >
		<nav class="navbar navbar-default">
			<div class="container-fluid">
				<div class="navbar-header">
					<span class="navbar-brand"><g:message code="app.title"/></span>
				</div>
				<ul class="nav navbar-nav">
					<sec:ifAnyGranted roles="ROLE_USER, ROLE_SUPERVISOR, ROLE_ADMIN">
						<li role="presentation"><g:link controller="logBook"><g:message code="logbook.title2"/></g:link></li>
						<li role="presentation"><g:link controller="reservation"><g:message code="reservation.title2"/></g:link></li>
					</sec:ifAnyGranted>
					<sec:ifAnyGranted roles="ROLE_ADMIN, ROLE_SUPERVISOR">
						<li role="presentation"><g:link controller="car"><g:message code="car.title2"/></g:link></li>
						<li role="presentation"><g:link controller="tracker"><g:message code="tracker.title2"/></g:link></li>
						<li role="presentation"><g:link controller="appUser"><g:message code="user.title2"/></g:link></li>
						<sec:ifAllGranted roles="ROLE_ADMIN">
							<li role="presentation"><g:link controller="company"><g:message code="company.title2"/></g:link></li>
						</sec:ifAllGranted>
					</sec:ifAnyGranted>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<sec:ifNotLoggedIn>
						<li role="presentation"><span class="glyphicon glyphicon-log-in"></span><g:link controller="login"><g:message code="app.login"/></g:link></li>
					</sec:ifNotLoggedIn>
					<sec:ifLoggedIn>
						%{--<li role="presentation"><span class="glyphicon glyphicon-log-out"><g:link controller="logout"><g:message code="app.logout"/></g:link></span></li>--}%
						<li role="presentation" style="padding-right: 10px">
							<g:message code="app.loggedUser"/> <sec:loggedInUserInfo field="username"/>
						</li>
						<li role="presentation"><span class="glyphicon glyphicon-log-out"></span><form name="logout" method="post" action="${createLink(controller:'logout') }">
							<button type="submit" class="btn"><g:message code="app.logout"/></button>
						</form></li>
					</sec:ifLoggedIn>
				</ul>
			</div>
		</nav>
	</div>
	<div class="row center col-lg-10 col-lg-offset-1">
			<g:layoutBody/>
	</div>
	<div class="footer row" role="contentinfo">

	</div>
	</body>
</html>
