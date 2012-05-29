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
					<li>
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

					<%-- Link to previous --%>
					<li>
						<c:choose>
							<c:when test="<%= cur != 1 %>">
								<a class="arrowleft" href="<%= _getHREF(formName, curParam, cur - 1, jsCall, url, urlAnchor) %>" title="<liferay-ui:message key="previous" />">
									&laquo;
								</a>
							</c:when>
							<c:otherwise>
								<span class="arrowleft" title="<liferay-ui:message key="previous" />">
									&laquo;
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
									<strong><c:out value="${i}" /></strong>
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
					<li>
						<c:choose>
							<c:when test="<%= cur != pages %>">
								<a class="arrowright" href="<%= _getHREF(formName, curParam, cur + 1, jsCall, url, urlAnchor) %>" title="<liferay-ui:message key="next" />">
									&raquo;
								</a>
							</c:when>
							<c:otherwise>
								<span class="arrowright" title="<liferay-ui:message key="next" />">
									&raquo;
								</span>
							</c:otherwise>
						</c:choose>
					</li>
					
					<%-- Link to last --%>
					<li>
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
					
					
				</c:when>
				<c:otherwise></c:otherwise>
			</c:choose>
		</ul>
	</div>
</c:if>
		
<%--
<div class="rp-paging actionlinks clearfix">
	<ul>
		<li><a href="#">Första</a></li>
		<li><a href="#" class="arrowleft" title="Föregående">&laquo;</a></li>
		<li><a href="#">1</a></li>
		<li><a href="#">2</a></li>
		<li><a href="#">3</a></li>
		<li><a href="#">4</a></li>
		<li><strong>5</strong></li>
		<li><a href="#">6</a></li>
		<li><a href="#">7</a></li>
		<li><a href="#">8</a></li>
		<li><a href="#">9</a></li>
		<li><a href="#">10</a></li>
		<li><a href="#" class="arrowright" title="Nästa">&raquo;</a></li>
		<li><a href="#">Sista</a></li>
	</ul>
</div>
		
--%>

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