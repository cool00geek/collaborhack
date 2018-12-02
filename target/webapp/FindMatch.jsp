<%--
  Created by IntelliJ IDEA.
  User: vinay
  Date: 12/1/18
  Time: 5:56 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Find a Match!</title>
</head>
<body>
<h1>Enter the name and email address you registered with to find any matches!</h1>
<form action="MatchResult.jsp" method="POST">
    First Name: <input type="text" name="first_name">
    <br/>
    Last Name: <input type="text" name="last_name"/>
    <br/>
    Email: <input type="text" name="email"/>
    <input type="submit" value="Submit"/>
</form>
</body>
</html>
