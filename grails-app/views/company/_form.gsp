<%@ page import="roadtitan.core.Company" %>


<div class="fieldcontain ${hasErrors(bean: companyInstance, field: 'companyName', 'error')} required  list-group-item  list-group-item-success list-group-item-heading">
	<label for="companyName">
		<g:message code="company.name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="companyName" required="" value="${companyInstance?.companyName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: companyInstance, field: 'companyCode', 'error')}  list-group-item">
	<label for="companyCode">
		<g:message code="company.code" />
	</label>
	<g:textField name="companyCode" value="${companyInstance?.companyCode}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: companyInstance, field: 'companyAddress', 'error')}  list-group-item ">
	<label for="companyAddress">
		<g:message code="company.address" />
	</label>
	<g:textField name="companyAddress" value="${companyInstance?.companyAddress}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: companyInstance, field: 'cars', 'error')}  list-group-item ">
	<label for="cars">
		<g:message code="company.cars" />
	</label>
<ul class="one-to-many">
<g:each in="${companyInstance?.cars?}" var="c">
    <li><g:link controller="car" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="car" action="create" params="['company.id': companyInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'car.title')])}</g:link>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: companyInstance, field: 'users', 'error')}  list-group-item ">
	<label for="users">
		<g:message code="company.users" />
	</label>
<ul class="one-to-many">
<g:each in="${companyInstance?.users?}" var="u">
    <li><g:link controller="appUser" action="show" id="${u.id}">${u?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="appUser" action="create" params="['company.id': companyInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'user.title')])}</g:link>
</li>
</ul>


</div>

