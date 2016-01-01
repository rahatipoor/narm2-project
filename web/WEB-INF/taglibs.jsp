<%-- Import Tags --%>
<%@taglib prefix="s" uri="http://stripes.sourceforge.net/stripes.tld" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--<%@taglib prefix="d" uri="http://displaytag.sf.net" %>--%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%-- Load Farsi Bundle --%>
<fmt:setBundle basename="fa_rb"/>
<%-- Save Contex Path --%>
<c:set var="context" value="${pageContext.request.contextPath}"/>