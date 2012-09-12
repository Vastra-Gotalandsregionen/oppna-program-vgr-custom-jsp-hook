------------------------------------------------------------
- view_entries.jspf
------------------------------------------------------------

*	At line 79 a loop iterating blog entries starts.
	Before the loop starts there is a custom added variable resultsEntryIndex which is passed to the jsp include further down
	(<liferay-util:include page="/html/portlet/blogs/view_entry_content.jsp" />)

*	Also, before the loop, a wrapper div is added
	<div class="blogs-entries-wrap"></div>

------------------------------------------------------------
- view_entry_content.jsp
------------------------------------------------------------

*	At line 27 the custom variable resultsEntryIndex is fetched
	If entry is odd, a class "entry-odd" is added to the entry div:
	<div class="entry <%= entry.isApproved() ? "" : "draft" %> <%= entryCssClass %>">
