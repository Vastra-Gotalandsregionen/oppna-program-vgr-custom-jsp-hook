<%@ include file="/html/taglib/init.jsp" %>

<%
String formName = namespace + request.getAttribute("liferay-ui:page-iterator:formName");
int cur = GetterUtil.getInteger((String)request.getAttribute("liferay-ui:page-iterator:cur"));
String curParam = (String)request.getAttribute("liferay-ui:page-iterator:curParam");
int delta = GetterUtil.getInteger((String)request.getAttribute("liferay-ui:page-iterator:delta"));
boolean deltaConfigurable = GetterUtil.getBoolean((String)request.getAttribute("liferay-ui:page-iterator:deltaConfigurable"));
String deltaParam = (String)request.getAttribute("liferay-ui:page-iterator:deltaParam");
String jsCall = GetterUtil.getString((String)request.getAttribute("liferay-ui:page-iterator:jsCall"));
int maxPages = GetterUtil.getInteger((String)request.getAttribute("liferay-ui:page-iterator:maxPages"));
String target = (String)request.getAttribute("liferay-ui:page-iterator:target");
int total = GetterUtil.getInteger((String)request.getAttribute("liferay-ui:page-iterator:total"));
String type = (String)request.getAttribute("liferay-ui:page-iterator:type");
String url = (String)request.getAttribute("liferay-ui:page-iterator:url");
String urlAnchor = (String)request.getAttribute("liferay-ui:page-iterator:urlAnchor");
int pages = GetterUtil.getInteger((String)request.getAttribute("liferay-ui:page-iterator:pages"));

int start = (cur - 1) * delta;
int end = cur * delta;

if (end > total) {
	end = total;
}

int resultRowsSize = delta;

if (total < delta) {
	resultRowsSize = total;
}
else {
	resultRowsSize = total - ((cur - 1) * delta);

	if (resultRowsSize > delta) {
		resultRowsSize = delta;
	}
}

String deltaURL = HttpUtil.removeParameter(url, namespace + deltaParam);

NumberFormat numberFormat = NumberFormat.getNumberInstance(locale);

%>

<c:set var="paginatorType" value="<%= (String)request.getAttribute(\"liferay-ui:page-iterator:type\") %>" scope="page" />

<%--
	rp_paginator_type_1 should have first and last buttons (as well as previous and next)
	rp_paginator_type_2 has previous and next buttons (but no first and last)
--%>

<c:if test='<%= (total > resultRowsSize) %>'>
	<div class="rp-paging clearfix">
		<ul>
			<%
			int pagesIteratorMax = maxPages;
			int pagesIteratorBegin = 1;
			int pagesIteratorEnd = pages;
			%>
			
			<c:if test="<%= (pages > pagesIteratorMax) %>">
				<%
				
					int pagesIteratorEachSide = (pagesIteratorMax -1) / 2;

					pagesIteratorBegin = cur - pagesIteratorEachSide;
					pagesIteratorEnd = cur + pagesIteratorEachSide;
					
					// At first half
					if(cur <= (pagesIteratorEachSide+1)) {
						pagesIteratorBegin = 1;
						pagesIteratorEnd = pagesIteratorMax;
					}

					if(pagesIteratorEnd > pages) {

						int diff = pagesIteratorEnd - pages;
						
						pagesIteratorEnd = pages;
						
						pagesIteratorBegin = pagesIteratorBegin - diff;
						
						if(pagesIteratorBegin < 1) {
							pagesIteratorBegin = 1;
						}
					}
				%>
			</c:if>

			<c:choose>
				<c:when test="<%= (pagesIteratorEnd > pagesIteratorBegin) %>">

					<%-- Link to first --%>
					
					
					<c:if test="${paginatorType == 'rp_paginator_type_1'}">
						<li class="first">
							<c:choose>
								<c:when test="<%= cur != 1 %>">
									<a href="<%= _getHREF(formName, curParam, 1, jsCall, url, urlAnchor) %>">
										<liferay-ui:message key="first" />
									</a>
								</c:when>
								<c:otherwise>
									<span>
										<liferay-ui:message key="first" />
									</span>
								</c:otherwise>
							</c:choose>
						</li>
					</c:if>					
					
					<%-- Link to previous --%>
					<li class="previous">
						<c:choose>
							<c:when test="<%= cur != 1 %>">
								<a class="arrowleft" href="<%= _getHREF(formName, curParam, cur - 1, jsCall, url, urlAnchor) %>" title="<liferay-ui:message key="previous" />">
									<liferay-ui:message key="previous" />
								</a>
							</c:when>
							<c:otherwise>
								<span class="arrowleft" title="<liferay-ui:message key="previous" />">
									<liferay-ui:message key="previous" />
								</span>
							</c:otherwise>
						</c:choose>
					</li>

					<%-- Iterate page links --%>
					<% int i = pagesIteratorBegin; %>
					<c:forEach var="i" begin="<%= pagesIteratorBegin %>" end="<%= pagesIteratorEnd %>" step="1">
						<li>
							<c:choose>
								<c:when test="<%= (i==cur) %>">
									<span class="current"><c:out value="${i}" /></span>
								</c:when>
								<c:otherwise>
									<% String curURL = _getHREF(formName, curParam, i, jsCall, url, urlAnchor); %>
									<a href="<%= curURL %>"><c:out value="${i}" /></a>				
								</c:otherwise>
							</c:choose>
						</li>
						<% i++; %>
					</c:forEach>
					
					<%-- Link to next --%>
					<li class="next">
						<c:choose>
							<c:when test="<%= cur != pages %>">
								<a class="arrowright" href="<%= _getHREF(formName, curParam, cur + 1, jsCall, url, urlAnchor) %>" title="<liferay-ui:message key="next" />">
									<liferay-ui:message key="next" />
								</a>
							</c:when>
							<c:otherwise>
								<span class="arrowright" title="<liferay-ui:message key="next" />">
									<liferay-ui:message key="next" />
								</span>
							</c:otherwise>
						</c:choose>
					</li>
					
					<c:if test="${paginatorType == 'rp_paginator_type_1'}">
						<%-- Link to last --%>
						<li class="last">
							<c:choose>
								<c:when test="<%= cur != pages %>">
									<a href="<%= _getHREF(formName, curParam, pages, jsCall, url, urlAnchor) %>">
										<liferay-ui:message key="last" />
									</a>
								</c:when>
								<c:otherwise>
									<span>
										<liferay-ui:message key="last" />
									</span>
								</c:otherwise>
							</c:choose>
						</li>
					</c:if>					
					
				</c:when>
				<c:otherwise></c:otherwise>
			</c:choose>
		</ul>
	</div>
</c:if>

<%!
private String _getHREF(String formName, String curParam, int cur, String jsCall, String url, String urlAnchor) throws Exception {
	String href = null;

	if (Validator.isNotNull(url)) {
		href = url + curParam + "=" + cur + urlAnchor;
	}
	else {
		href = "javascript:document." + formName + "." + curParam + ".value = '" + cur + "'; " + jsCall;
	}

	return href;
}
%>