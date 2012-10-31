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

<%-- This code will only be run if user display style is either 1 or 2 --%>

<c:if test="<%= displayStyle == 1 || displayStyle == 2 %>">
		</div>
	
		<c:if test="<%= displayStyle == 1 %>">
				</td>
			</tr>
			</table>
		</c:if>
	
		<c:if test="<%= displayStyle == 2 %>">
			</div>
		</c:if>
	</div>
</c:if>