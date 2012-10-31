The following changes has been made:

(01)	Changed displayStyle for user_display from "2" to "10"

		<liferay-ui:user-display
			userId="<%= message.getUserId() %>"
			userName="<%= HtmlUtil.escape(message.getUserName()) %>"
			displayStyle="<%= 10 %>"
		/>

		This triggers the /user_display/start_rp.jsp to be used for the user-display taglib.

(02)	Added css classes to aui:layout and aui:column tags that allows styling

(03)	Changed add comment link so that the links are the same no matter if there are any comments or not. Changed from:

		<c:choose>
			<c:when test="<%= messagesCount == 1 %>">
				<liferay-ui:message key="no-comments-yet" /> <a href="<%= taglibPostReplyURL %>"><liferay-ui:message key="be-the-first" /></a>
			</c:when>
			<c:otherwise>
				<liferay-ui:icon
					image="reply"
					label="<%= true %>"
					message="add-comment"
					url="<%= taglibPostReplyURL %>"
				/>
			</c:otherwise>
		</c:choose>
		
		To
		
		<div class="post-reply-button clearfix">
			<liferay-ui:icon
				image="reply"
				label="<%= true %>"
				message="add-comment"
				url="<%= taglibPostReplyURL %>"
			/>
		</div>

(04)	Added css-class to reply-form wrap from (in two places):
		<div id="<%= randomNamespace %>postReplyForm<%= i %>" style="display: none;">

		to <div id="<%= randomNamespace %>postReplyForm<%= i %>" style="display: none;" class="post-reply-form clearfix">
		
(5)		Added css classes to message icon columns to allow styling:
			That is changed from:
				<c:if test="<%= ratingsEnabled %>">
					<aui:column>
					...
				and
					
				<c:if test="<%= MBDiscussionPermission.contains(permissionChecker, company.getCompanyId(), scopeGroupId, permissionClassName, permissionClassPK, userId, ActionKeys.ADD_DISCUSSION) %>">
					<aui:column>
					...
				
				and
					
				<c:if test="<%= i > 0 %>">

					<%
					String taglibTopURL = "#" + randomNamespace + "messages_top";
					%>

					<aui:column>
					...
					
				and
				<c:if test="<%= MBDiscussionPermission.contains(permissionChecker, company.getCompanyId(), scopeGroupId, permissionClassName, permissionClassPK, message.getMessageId(), userId, ActionKeys.UPDATE_DISCUSSION) %>">

					<%
					String taglibEditURL = "javascript:" + randomNamespace + "showForm('" + randomNamespace + "editForm" + i + "', '" + namespace + randomNamespace + "editReplyBody" + i + "');";
					%>

					<aui:column>
					...
				and
				
				<c:if test="<%= MBDiscussionPermission.contains(permissionChecker, company.getCompanyId(), scopeGroupId, permissionClassName, permissionClassPK, message.getMessageId(), userId, ActionKeys.DELETE_DISCUSSION) %>">

				<%
				String taglibDeleteURL = "javascript:" + randomNamespace + "deleteMessage(" + i + ");";
				%>
	
				<aui:column>
				
				to (just added cssClass to each column - no other markup changed):
				<aui:column cssClass="ratings-colum">
				<aui:column cssClass="reply-column">
				<aui:column cssClass="to-top-column">
				<aui:column cssClass="edit-column">
				<aui:column cssClass="delete-column">
				

					
(5)		Moved comment entry date from <aui:column cssClass="comment-message"> to <aui:column cssClass="comment-user">
		and wrapped user-display-tag in a div and changed date section to a span with a class
		Removed breaks between mession section and date section
		Removed hyperlink when comment is in reply to another message
		That is, from:
			<div>
				<c:choose>
					<c:when test="<%= message.getParentMessageId() == rootMessage.getMessageId() %>">
						<%= LanguageUtil.format(pageContext, "posted-on-x", dateFormatDateTime.format(message.getModifiedDate())) %>
					</c:when>
					<c:otherwise>

							<%
							MBMessage parentMessage = MBMessageLocalServiceUtil.getMessage(message.getParentMessageId());

							StringBundler sb = new StringBundler(7);

							sb.append("<a href=\"#");
							sb.append(randomNamespace);
							sb.append("message_");
							sb.append(parentMessage.getMessageId());
							sb.append("\">");
							sb.append(HtmlUtil.escape(parentMessage.getUserName()));
							sb.append("</a>");
							%>

							<%= LanguageUtil.format(pageContext, "posted-on-x-in-reply-to-x", new Object[] {dateFormatDateTime.format(message.getModifiedDate()), sb.toString()}) %>
					</c:otherwise>
				</c:choose>
			</div>
			
		to:
			<aui:column cssClass="comment-user">
				
				<div class="user-wrap">
					<liferay-ui:user-display
						userId="<%= message.getUserId() %>"
						userName="<%= HtmlUtil.escape(message.getUserName()) %>"
						displayStyle="<%= 10 %>"
					/>
				</div>
				
				<span class="date-wrap">
					<c:choose>
						<c:when test="<%= message.getParentMessageId() == rootMessage.getMessageId() %>">
							<%= LanguageUtil.format(pageContext, "posted-on-x", dateFormatDateTime.format(message.getModifiedDate())) %>
						</c:when>
						<c:otherwise>

							<%
							MBMessage parentMessage = MBMessageLocalServiceUtil.getMessage(message.getParentMessageId());
							%>
							
							<%= LanguageUtil.format(pageContext, "posted-on-x-in-reply-to-x", new Object[] {dateFormatDateTime.format(message.getModifiedDate()), HtmlUtil.escape(parentMessage.getUserName()) }) %>
						</c:otherwise>
					</c:choose>
				</span>								
				
			</aui:column>
			
(6)	Added css class to comment-wrap that allows different styling for even or odd 
