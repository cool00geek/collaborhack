<%--
  Created by IntelliJ IDEA.
  User: vinay
  Date: 12/1/18
  Time: 12:32 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Read POST data from index</title>
</head>
<body>
    <%
        if (request.getParameter("first_name") == null ||
            request.getParameter("last_name") == null){
            out.println("<b>Form data not received!</b>");

        } else {
            out.println("<ul><li><p><b>First Name:</b>");
            out.println(request.getParameter("first_name"));
            out.println("</p></li>");
            out.println("<li><p><b>Last  Name:</b>");
            out.println(request.getParameter("last_name"));
            out.println("</p></li></ul>");
        }
    %>
    <button onclick="location.href='/index.jsp'" type="button">Go back</button>
</body>
</html>
