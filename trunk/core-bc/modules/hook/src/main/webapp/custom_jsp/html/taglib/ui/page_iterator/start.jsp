<%@ include file="/html/taglib/init.jsp" %>

<c:set var="paginatorType" value="<%= (String)request.getAttribute(\"liferay-ui:page-iterator:type\") %>" scope="page" />

<c:choose>
	<c:when test="${paginatorType == 'rp_paginator'}">
		<liferay-util:include page="/html/taglib/ui/page_iterator/start_rp.jsp" servletContext="<%= application %>" />
	</c:when>
	<c:otherwise>
		<liferay-util:include page="/html/taglib/ui/page_iterator/start_original.jsp" servletContext="<%= application %>" />
	</c:otherwise>
</c:choose>