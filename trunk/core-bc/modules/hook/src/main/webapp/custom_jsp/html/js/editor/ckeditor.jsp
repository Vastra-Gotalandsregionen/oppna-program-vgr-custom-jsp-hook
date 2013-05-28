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

<%@ page import="com.liferay.portal.kernel.util.HtmlUtil" %>
<%@ page import="com.liferay.portal.kernel.util.HttpUtil" %>
<%@ page import="com.liferay.portal.kernel.util.ParamUtil" %>
<%@ page import="com.liferay.portal.kernel.util.Validator" %>
<%@ page import="com.liferay.portal.util.PortalUtil" %>
<%@ page import="com.liferay.util.TextFormatter" %>

<%
long plid = ParamUtil.getLong(request, "p_l_id");
String portletId = ParamUtil.getString(request, "p_p_id");
String mainPath = ParamUtil.getString(request, "p_main_path");
String doAsUserId = ParamUtil.getString(request, "doAsUserId");
String doAsGroupId = ParamUtil.getString(request, "doAsGroupId");
String initMethod =	ParamUtil.getString(request, "initMethod", DEFAULT_INIT_METHOD);
String onChangeMethod = ParamUtil.getString(request, "onChangeMethod");
String toolbarSet = ParamUtil.getString(request, "toolbarSet", "liferay");
String cssPath = ParamUtil.getString(request, "cssPath");
String cssClasses = ParamUtil.getString(request, "cssClasses");
%>

<html>

<head>
	<style type="text/css">
		table.cke_dialog {
			position: absolute !important;
		}
	</style>

	<script type="text/javascript" src="ckeditor/ckeditor.js"></script>

	<script type="text/javascript">
		function initCkArea() {
			var textArea = document.getElementById("CKEditor1");
			var ckEditor = CKEDITOR.instances.CKEditor1;

			ckEditor.setData(parent.<%= HtmlUtil.escape(initMethod) %>());

			<%-- Start custom changed 2013-05-28 --%>
			<%-- According to LPS-22864. Move the two following lines further down --%>
			<%--
			CKEDITOR.config.toolbar = '<%= TextFormatter.format(HtmlUtil.escape(toolbarSet), TextFormatter.M) %>';
			CKEDITOR.config.customConfig = '<%= PortalUtil.getPathContext() %>/html/js/editor/ckeditor/ckconfig.jsp?p_l_id=<%= plid %>&p_p_id=<%= HttpUtil.encodeURL(portletId) %>&p_main_path=<%= HttpUtil.encodeURL(mainPath) %>&doAsUserId=<%= HttpUtil.encodeURL(doAsUserId) %>&doAsGroupId=<%= HttpUtil.encodeURL(doAsGroupId) %>&cssPath=<%= HttpUtil.encodeURL(cssPath) %>&cssClasses=<%= HttpUtil.encodeURL(cssClasses) %>';
			--%>
			<%-- End custom changed 2013-05-28 --%>

			ckEditor.on(
				'instanceReady',
				function() {
					setInterval(
						function() {
							try {
								onChangeCallback();
							}
							catch(e) {
							}
						},
						300
					);
				}
			);
		}

		function getCkData() {
			var data = CKEDITOR.instances.CKEditor1.getData();

			if (CKEDITOR.env.gecko && (CKEDITOR.tools.trim(data) == '<br />')) {
				data = '';
			}

			return data;
		}

		function getHTML() {
			return getCkData();
		}

		function getText() {
			return getCkData();
		}

		function onChangeCallback() {

			<%
			if (Validator.isNotNull(onChangeMethod)) {
			%>

				var ckEditor = CKEDITOR.instances.CKEditor1;
				var dirty = ckEditor.checkDirty();

				if (dirty) {
					parent.<%= HtmlUtil.escape(onChangeMethod) %>(getText());

					ckEditor.resetDirty();
				}

			<%
			}
			%>

		}
	</script>
</head>

<body>

<textarea id="CKEditor1" name="CKEditor1"></textarea>

<script type="text/javascript">

	<%-- Start custom changed 2013-05-28 --%>
	<%-- According to LPS-22864. The two following lines are moved from above --%>
	CKEDITOR.config.toolbar = '<%= TextFormatter.format(HtmlUtil.escape(toolbarSet), TextFormatter.M) %>';
	CKEDITOR.config.customConfig = '<%= PortalUtil.getPathContext() %>/html/js/editor/ckeditor/ckconfig.jsp?p_l_id=<%= plid %>&p_p_id=<%= HttpUtil.encodeURL(portletId) %>&p_main_path=<%= HttpUtil.encodeURL(mainPath) %>&doAsUserId=<%= HttpUtil.encodeURL(doAsUserId) %>&doAsGroupId=<%= HttpUtil.encodeURL(doAsGroupId) %>&cssPath=<%= HttpUtil.encodeURL(cssPath) %>&cssClasses=<%= HttpUtil.encodeURL(cssClasses) %>';
	<%-- End custom changed 2013-05-28 --%>

	<%
	String connectorURL = HttpUtil.encodeURL(mainPath + "/portal/fckeditor?p_l_id=" + plid + "&p_p_id=" + HttpUtil.encodeURL(portletId) + "&doAsUserId=" + HttpUtil.encodeURL(doAsUserId) + "&doAsGroupId=" + HttpUtil.encodeURL(doAsGroupId));
	%>

	CKEDITOR.replace(
		'CKEditor1',
		{
			filebrowserBrowseUrl: '<%= PortalUtil.getPathContext() %>/html/js/editor/ckeditor/editor/filemanager/browser/liferay/browser.html?Connector=<%= connectorURL %>',
			filebrowserUploadUrl: null
		}
	);

	if (parent.AUI) {
		parent.AUI().on('domready', initCkArea);
	}
</script>

</body>

</html>

<%!
public static final String DEFAULT_INIT_METHOD = "initEditor";
%>