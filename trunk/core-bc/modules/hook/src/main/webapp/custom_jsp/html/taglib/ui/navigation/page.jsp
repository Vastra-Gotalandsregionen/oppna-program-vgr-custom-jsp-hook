<%@ include file="/html/taglib/init.jsp" %>

<c:set var="styleDisplay" value="<%= (String)request.getAttribute(\"liferay-ui:navigation:displayStyle\") %>" scope="page" />

<c:choose>
	<c:when test="${styleDisplay == 'relative-with-breadcrumb'}">
		<liferay-util:include page="/html/taglib/ui/navigation/page_extended.jsp" servletContext="<%= application %>" />
	</c:when>
	<c:otherwise>
		<liferay-util:include page="/html/taglib/ui/navigation/page_org.jsp" servletContext="<%= application %>" />
	</c:otherwise>
</c:choose>