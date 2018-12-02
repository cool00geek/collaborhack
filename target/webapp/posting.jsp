<%@ page import="org.eclipse.jetty.server.Request" %>
<%@ page import="java.io.IOException" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.io.FileWriter" %><%--
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

<%!
    class RequestParse{
        String firstName;
        String lastName;
        String email;
        String framework;
        String state;
        JspWriter out;

        RequestParse(JspWriter out, HttpServletRequest request){
            firstName = request.getParameter("first_name");
            lastName = request.getParameter("last_name");
            email = request.getParameter("email");
            framework = request.getParameter("framework");
            state = request.getParameter("state");

            this.out = out;
        }

        boolean verifyInput() throws IOException {
            if (firstName == null && lastName == null && email == null && framework == null && state.equals("select")) {
                out.println("<b>Form data not received!</b><br>");
            } else if (firstName == null || firstName.trim().equals("")) {
                out.println("<b>Please enter a valid first name</b>");
            } else if (lastName == null || lastName.trim().equals("")) {
                out.println("<b>Please enter a valid last name</b>");
            } else if (email == null || email.trim().equals("")) {
                out.println("<b>Please enter a valid email address</b>");
            } else if (framework == null || framework.trim().equals("")) {
                out.println("<b>Please enter a valid framework</b>");
            } else if (state.equals("select")) {
                out.println("<b>Please select a state</b>");
            } else {
                return true;
            }
            return false;
        }

        void printRequest() throws IOException {
            String[] frameworks = framework.trim().split(",");

            out.println("<p><b>Name:</b>");
            out.println(lastName + ", " + firstName);
            out.println("</p>");
            out.println("<p><b>Contact email:</b>");
            out.println(email);
            out.println("</p>");
            out.println("<p><b>State:</b>");
            out.println(state);
            out.println("</p>");
            out.println("<p><b>Framework:</b>");
            out.println("<ul>");
            for (String fw : frameworks){
                out.println("<li>" + fw + "</li>");
            }
            out.println("</ul></p>");
        }

        void writeToFile() throws IOException {
            PrintWriter users = new PrintWriter(new FileWriter("userData.csv", true));
            String line = firstName + "," + lastName + "," + email + "," + state;

            String[] frameworks = framework.trim().split(",");
            for (String fw : frameworks){
                line += ","  +fw;
            }
            users.println(line);
            users.close();
        }
    }
%>

<%
    try {
        RequestParse rp = new RequestParse(out, request);
        if (rp.verifyInput()) {
            rp.printRequest();
            rp.writeToFile();
            out.println("<b>Profile added!</b>");
        }
    } catch (Exception e){
        out.println("Unable to print the data!");
    }
%>
<button onclick="location.href='/index.jsp'" type="button">Go Home</button>
</body>
</html>
