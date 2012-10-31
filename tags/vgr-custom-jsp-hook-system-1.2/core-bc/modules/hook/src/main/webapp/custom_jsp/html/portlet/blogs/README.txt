====
    Copyright 2010 Västra Götalandsregionen

      This library is free software; you can redistribute it and/or modify
      it under the terms of version 2.1 of the GNU Lesser General Public
      License as published by the Free Software Foundation.

      This library is distributed in the hope that it will be useful,
      but WITHOUT ANY WARRANTY; without even the implied warranty of
      MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
      GNU Lesser General Public License for more details.

      You should have received a copy of the GNU Lesser General Public
      License along with this library; if not, write to the
      Free Software Foundation, Inc., 59 Temple Place, Suite 330,
      Boston, MA 02111-1307  USA
====

-------------------------------------------------------------
- view_entries.jspf
-------------------------------------------------------------

*	At line 79 a loop iterating blog entries starts.
	Before the loop starts there is a custom added variable resultsEntryIndex which is passed to the jsp include further down
	(<liferay-util:include page="/html/portlet/blogs/view_entry_content.jsp" />)

*	Also, before the loop, a wrapper div is added
	<div class="blogs-entries-wrap"></div>

-------------------------------------------------------------
- view_entry_content.jsp
-------------------------------------------------------------

*	At line 27 the custom variable resultsEntryIndex is fetched
	If entry is odd, a class "entry-odd" is added to the entry div:
	<div class="entry <%= entry.isApproved() ? "" : "draft" %> <%= entryCssClass %>">

* At line 77 changed date format from using dateFormatDateTime to using dateFormatDate so that time is not shown