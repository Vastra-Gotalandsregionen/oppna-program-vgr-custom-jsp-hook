<%@ include file="/html/taglib/ui/user_display/init.jsp" %>

<c:set var="styleDisplay" value="<%= (String)request.getAttribute(\"liferay-ui:user-display:displayStyle\") %>" scope="page" />

<c:choose>
	<c:when test="${styleDisplay == '1' or styleDisplay == '2'}">
		<liferay-util:include page="/html/taglib/ui/user_display/start_org.jsp" servletContext="<%= application %>" />
	</c:when>
	<c:otherwise>
		<liferay-util:include page="/html/taglib/ui/user_display/start_rp.jsp" servletContext="<%= application %>" />
	</c:otherwise>
</c:choose>