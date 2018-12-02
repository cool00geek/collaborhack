<%--
  Created by IntelliJ IDEA.
  User: vinay
  Date: 12/1/18
  Time: 11:48 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="javax.servlet.jsp.JspWriter" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Scanner" %>
<%@ page import="java.io.*" %>
<html>
<head>
    <title>Sources used in building this website</title>
</head>
<body>
<%!
    class Source {

        JspWriter out;
        ArrayList<String> links;

        Source(JspWriter out) {
            this.out = out;
            links = new ArrayList<>();

            InputStream ins = getServletConfig().getServletContext().getResourceAsStream("/res/sources");
            try {
                if (ins != null) {
                    BufferedReader br = new BufferedReader((new InputStreamReader(ins)));
                    String data;
                    while ((data = br.readLine()) != null) {
                        links.add(data);
                    }
                }
            } catch (IOException e) {
                //out.println(e.getMessage());
            }
        }

        void printSourcesLinks() {
            for (String link : links) {
                try {
                    out.println("<A HREF=\"" + link + "\" style=\"text-decoration:none\" class=\"A\">" + link + "</a><br>");

                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
    }
%>
<%
    Source src = new Source(out);
    src.printSourcesLinks();
%>

</body>
</html>
