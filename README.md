
<td id="wikicontent" class="psdescription">
  <h1>
    <a name="Custom_JSP_Hook">
    </a>
    Custom JSP Hook
    <a href="#Custom_JSP_Hook" class="section_anchor">
    </a>
  </h1>
  <p>
    This project contains custom configurations of Liferay specific jsps (portlets and taglibs) and javascript files. Configurations and overrides done with a custom jsp hook are unobtrusive and will be changed back to original settings when the hook is undeployed. 
  </p>
  <p>
    JSP (or javascript) files are placed in the src/main/webapp/custom_jsp folder. The structure inside this folder mimics the folder structure that can be found in a Liferay bundle inside webapps/ROOT/: html/js html/portal html/portlet html/tablib 
  </p>
  <p>
    One example of this is overriding the view.jsp file in the dockbar portlet, which is a native Liferay portlet typically added to the page through the theme. The dockbar portlet provides a bar at the top of the page with various controls for administrating and navigating throughout the portal. 
  </p>
  <p>
    To implement a custom version of the view.jsp file in the dockbar portlet, add the following to the custom_jsp folder referred to above: html/portlet/dockbar/view.jsp. This view.jsp file will contain the custom implementation of the view. When the custom jsp hook is deployed to the portal, the original view.jsp (inside webapps/ROOT/html/portlet/dockbar) will be renamed to view.portal.jsp and the view.jsp file from the hook will be copied to the corresponding folder. Now the custom implementation is used instead of the native Liferay implementation. 
  </p>
  <p>
    If the hook is undeployed, Liferay will remove the customized view.jsp and rename the original jsp file from view.portal.jsp to view.jsp. Now the original implementation is used again. 
  </p>
</td>
