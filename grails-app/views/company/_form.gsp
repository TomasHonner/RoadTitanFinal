<%@ page import="roadtitan.core.Company" %>



<div class="fieldcontain ${hasErrors(bean: companyInstance, field: 'companyName', 'error')} required">
	<label for="companyName">
		<g:message code="company.companyName.label" default="Company Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="companyName" required="" value="${companyInstance?.companyName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: companyInstance, field: 'companyCode', 'error')} ">
	<label for="companyCode">
		<g:message code="company.companyCode.label" default="Company Code" />
		
	</label>
	<g:textField name="companyCode" value="${companyInstance?.companyCode}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: companyInstance, field: 'companyAddress', 'error')} ">
	<label for="companyAddress">
		<g:message code="company.companyAddress.label" default="Company Address" />
		
	</label>
	<g:textField name="companyAddress" value="${companyInstance?.companyAddress}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: companyInstance, field: 'cars', 'error')} ">
	<label for="cars">
		<g:message code="company.cars.label" default="Cars" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${companyInstance?.cars?}" var="c">
    <li><g:link controller="car" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="car" action="create" params="['company.id': companyInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'car.label', default: 'Car')])}</g:link>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: companyInstance, field: 'users', 'error')} ">
	<label for="users">
		<g:message code="company.users.label" default="Users" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${companyInstance?.users?}" var="u">
    <li><g:link controller="appUser" action="show" id="${u.id}">${u?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="appUser" action="create" params="['company.id': companyInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'appUser.label', default: 'AppUser')])}</g:link>
</li>
</ul>


</div>

