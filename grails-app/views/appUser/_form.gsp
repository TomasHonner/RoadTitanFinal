<%@ page import="roadtitan.security.AppUser" %>


<div class="fieldcontain ${hasErrors(bean: appUserInstance, field: 'appUserName', 'error')} required">
	<label for="appUserName">
		<g:message code="appUser.appUserName.label" default="App User Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="appUserName" required="" value="${appUserInstance?.appUserName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: appUserInstance, field: 'appUserAddress', 'error')} ">
	<label for="appUserAddress">
		<g:message code="appUser.appUserAddress.label" default="App User Address" />
		
	</label>
	<g:textField name="appUserAddress" value="${appUserInstance?.appUserAddress}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: appUserInstance, field: 'appUserEmail', 'error')} required">
	<label for="appUserEmail">
		<g:message code="appUser.appUserEmail.label" default="App User Email" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="email" name="appUserEmail" required="" value="${appUserInstance?.appUserEmail}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: appUserInstance, field: 'company', 'error')} required">
	<label for="company">
		<g:message code="appUser.company.label" default="Company" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="company" name="company.id" from="${roadtitan.core.Company.list()}" optionKey="id" required="" value="${appUserInstance?.company?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: appUserInstance, field: 'secUser', 'error')} required">
	<label for="secUser">
		<g:message code="appUser.secUser.label" default="Sec User" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="secUser" name="secUser.id" from="${roadtitan.security.SecUser.list()}" optionKey="id" required="" value="${appUserInstance?.secUser?.id}" class="many-to-one"/>

</div>

