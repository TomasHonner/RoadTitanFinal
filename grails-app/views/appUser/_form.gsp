<%@ page import="roadtitan.security.AppUser" %>


<div class="fieldcontain ${hasErrors(bean: appUserInstance, field: 'appUserName', 'error')} required  list-group-item  list-group-item-success list-group-item-heading ">
	<label for="appUserName" class="h4 control-label">
		<g:message code="user.name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="appUserName" class="form-control" required="" value="${appUserInstance?.appUserName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: appUserInstance, field: 'appUserPassword', 'error')} required  list-group-item">
	<label for="appUserPassword" class="h4 control-label">
		<g:message code="user.password"/>
		<span class="required-indicator">*</span>
	</label>
	<g:field type="password"  class="form-control" name="appUserPassword" required="" value="${appUserInstance?.appUserPassword}"/>

</div>

<div class="list-group-item required">
	<label class="h4 control-label"><g:message code="user.role"/></label>
	<select name="role" class="form-control">
		<option value="1">User</option>
		<sec:ifAllGranted roles="ROLE_ADMIN">
		<option value="2">Supervisor</option>
		<option value="3">Admin</option>
		</sec:ifAllGranted>
	</select>
</div>

<div class="fieldcontain ${hasErrors(bean: appUserInstance, field: 'appUserEmail', 'error')} required  list-group-item">
	<label for="appUserEmail" class="h4 control-label">
		<g:message code="user.email"/>
		<span class="required-indicator">*</span>
	</label>
	<g:field type="email"  class="form-control" name="appUserEmail" required="" value="${appUserInstance?.appUserEmail}"/>

</div>


<div class="fieldcontain ${hasErrors(bean: appUserInstance, field: 'appUserAddress', 'error')} list-group-item">
	<label for="appUserAddress" class="h4 control-label">
		<g:message code="user.address"/>
		
	</label>
	<g:textField name="appUserAddress" class="form-control" value="${appUserInstance?.appUserAddress}"/>

</div>

<sec:ifAnyGranted roles="ROLE_ADMIN">
<div class="fieldcontain ${hasErrors(bean: appUserInstance, field: 'company', 'error')} required list-group-item">
	<label for="company" class="h4 control-label">
		<g:message code="company.title" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="company" name="company.id" from="${roadtitan.core.Company.list()}" optionKey="id" required="" value="${appUserInstance?.company?.id}" class="many-to-one form-control"/>

</div>
</sec:ifAnyGranted>

%{--<div class="fieldcontain ${hasErrors(bean: appUserInstance, field: 'secUser', 'error')} required">
	<label for="secUser">
		<g:message code="appUser.secUser.label" default="Sec User" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="secUser" name="secUser.id" from="${roadtitan.security.SecUser.list()}" optionKey="id" required="" value="${appUserInstance?.secUser?.id}" class="many-to-one"/>

</div>--}%

