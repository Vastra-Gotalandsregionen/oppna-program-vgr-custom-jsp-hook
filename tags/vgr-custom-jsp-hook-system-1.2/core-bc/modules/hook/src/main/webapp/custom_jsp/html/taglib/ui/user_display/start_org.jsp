<%--
/**
 * Copyright (c) 2000-2011 Liferay, Inc. All rights reserved.
 *
 * The contents of this file are subject to the terms of the Liferay Enterprise
 * Subscription License ("License"). You may not use this file except in
 * compliance with the License. You can obtain a copy of the License by
 * contacting Liferay, Inc. See the License for the specific language governing
 * permissions and limitations under the License, including but not limited to
 * distribution rights of the Software.
 *
 *
 *
 */
--%>

<%@ include file="/html/taglib/ui/user_display/init.jsp" %>

<%
if (Validator.isNull(url) && (userDisplay != null)) {
	url = userDisplay.getDisplayURL(themeDisplay);
}
%>

<div class="taglib-user-display">
	<c:if test="<%= displayStyle == 1 %>">
		<table class="lfr-table">
		<tr>
			<td class="lfr-top">
	</c:if>

	<c:if test="<%= displayStyle == 2 %>">
		<%--<div style="white-space: nowrap;">--%>
		<div>
	</c:if>

	<div class="user-profile-image">

		<%
		String taglibAlt = (userDisplay != null) ? HtmlUtil.escapeAttribute(userDisplay.getFullName()) : LanguageUtil.get(pageContext, "generic-portrait");

		String taglibSrc = null;

		if (userDisplay != null) {
			taglibSrc = userDisplay.getPortraitURL(themeDisplay);
		}
		else {
			taglibSrc = UserConstants.getPortraitURL(themeDisplay.getPathImage(), true, 0);
		}
		%>

		<aui:a href="<%= url %>">
			<img alt="<%= taglibAlt %>" class="avatar" src="<%= HtmlUtil.escape(taglibSrc) %>" width="65" />
		</aui:a>
	</div>

	<c:if test="<%= displayStyle == 1 %>">
		</td>
		<td class="lfr-top">
	</c:if>

	<c:if test="<%= displayStyle == 2 %>">
	</c:if>

	<div class="user-details">
		<c:choose>
			<c:when test="<%= userDisplay != null %>">
				<aui:a cssClass="user-name" href="<%= url %>">
					<%= HtmlUtil.escape(userDisplay.getFullName()) %>
				</aui:a>
			</c:when>
			<c:otherwise>
				<%= HtmlUtil.escape(userName) %>
			</c:otherwise>
		</c:choose>