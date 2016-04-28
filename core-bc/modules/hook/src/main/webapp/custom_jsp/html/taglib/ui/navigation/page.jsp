<%@ include file="/html/taglib/init.jsp" %>
<%@ taglib uri="http://liferay.com/tld/util" prefix="liferay-util" %>

<c:set var="styleDisplay" value="<%= (String)request.getAttribute(\"liferay-ui:navigation:displayStyle\") %>" scope="page" />

<c:choose>
	<c:when test="${styleDisplay == 'relative-with-breadcrumb'}">
		<%
			List layoutChildren = layout.getChildren(themeDisplay.getPermissionChecker());
		%>
		<c:set var="childLayouts" value="<%= layoutChildren %>" scope="page" />
		<c:set var="curTitle" value="Vad vill du g&ouml;ra?" scope="page" />

		<div class="navigation-extended-wrap">
			<c:if test="${not empty childLayouts}">
				<h2>${curTitle}</h2>
				<ul class="section-navigation-list clearfix">
					<c:forEach var="childLayout" items="${childLayouts}">
						<%
							Layout curLayout = (Layout) pageContext.getAttribute("childLayout");

							String curLayoutUrl = PortalUtil.getLayoutURL(curLayout, themeDisplay);
							String curLayoutTarget = PortalUtil.getLayoutTarget(curLayout);
							String curLayoutTitle = HtmlUtil.escape(curLayout.getName(themeDisplay.getLocale()));

							String curLayoutCssClass = (String)curLayout.getExpandoBridge().getAttribute("navigationCssClass");
							String curLayoutDescription = (String)curLayout.getExpandoBridge().getAttribute("navigationDescription");
						%>

						<c:set var="childLayoutUrl" value="<%= curLayoutUrl %>" />
						<c:set var="childLayoutTarget" value="<%= curLayoutTarget %>" />
						<c:set var="childLayoutTitle" value="<%= curLayoutTitle %>" />

						<c:set var="childLayoutCssClass" value="<%= curLayoutCssClass %>" />
						<c:set var="childLayoutDescription" value="<%= curLayoutDescription %>" />

						<li class="${childLayoutCssClass}">
							<a href="${childLayoutUrl}" ${childLayoutTarget}>
						<span class="inner">
							<span class="title" id="aui_3_2_0_13824">${childLayoutTitle}</span>
							<span class="description">${childLayoutDescription}</span>
						</span>
							</a>
						</li>
					</c:forEach>
				</ul>

			</c:if>
		</div>
	</c:when>
	<c:otherwise>
		<liferay-util:include page="/html/taglib/ui/navigation/page.jsp" useCustomPage="false" />
	</c:otherwise>
</c:choose>