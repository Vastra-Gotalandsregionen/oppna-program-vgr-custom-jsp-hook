<%@ include file="/html/taglib/ui/user_display/init.jsp" %>
<c:set var="styleDisplay" value="<%= (String)request.getAttribute(\"liferay-ui:user-display:displayStyle\") %>" scope="page" />

<c:set var="userToDisplay" value="<%= (User)request.getAttribute(\"liferay-ui:user-display:user\") %>" scope="page" />

<c:choose>
	<c:when test="${styleDisplay == '10'}">
	
		<div class="taglib-user-display">
			${userToDisplay.fullName}
		</div>
	</c:when>
	<c:otherwise>
	</c:otherwise>
</c:choose>