<%@ page import="java.util.ArrayList" %>
<%@ page import="java.io.File" %>
<%@ page import="java.util.Scanner" %>
<%@ page import="java.lang.reflect.Array" %>
<%@ page import="java.util.Arrays" %><%--
  Created by IntelliJ IDEA.
  User: vinay
  Date: 12/1/18
  Time: 5:58 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Hack buddy matches!</title>
</head>
<body>
<%!
    class Person {
        String firstName;
        String lastName;
        String email;
        String state;
        ArrayList<String> frameworks;


        Person(String fName, String lName, String email, String state, ArrayList<String> frameworks) {
            firstName = fName;
            lastName = lName;
            this.email = email;
            this.state = state;
            this.frameworks = frameworks;
        }

        public boolean equals(Object o) {
            Person other = (Person) o;
            return other.firstName.equals(this.firstName) &&
                    other.lastName.equals(this.lastName) &&
                    other.email.equals(this.email);
        }

        public String toString() {
            String frame = "";
            for (int i = 0; i < frameworks.size(); i++) {
                frame += frameworks.get(i);
                if (i <= frameworks.size() - 2) {
                    frame += ", ";
                }
                if (i == (frameworks.size() - 2)) {
                    frame += " and ";
                }
            }
            String mailTo = "<A HREF=\"mailto:" + email + "\" style=\"text-decoration:none\" class=\"A\">" + email + "</a><br>";
            return firstName + " " + lastName + ", in " + state + " wants to learn: " + frame + ". " + mailTo;
        }
    }
%>
<%
    ArrayList<Person> peopleInList = new ArrayList<>();
    Scanner scanner = new Scanner(new File("userData.csv"));
    while (scanner.hasNextLine()) {
        String line = scanner.nextLine();
        String[] parts = line.split(",");
        ArrayList<String> fw = new ArrayList<>();

        fw.addAll(Arrays.asList(parts).subList(4, parts.length));

        Person p = new Person(parts[0].toUpperCase(), parts[1].toUpperCase(), parts[2].toUpperCase(), parts[3], fw);
        peopleInList.add(p);
    }

    String firstName = request.getParameter("first_name");
    String lastName = request.getParameter("last_name");
    String email = request.getParameter("email");

    if (lastName != null && firstName != null && email != null) {
        firstName = firstName.toUpperCase();
        lastName = lastName.toUpperCase();
        email = email.toUpperCase();

        Person targetPerson = null;
        Person dummyP = new Person(firstName, lastName, email, null, null);
        for (Person p : peopleInList) {
            if (p.equals(dummyP)) {
                targetPerson = p;
            }
        }


        ArrayList<Person> matches = new ArrayList<>();
        if (targetPerson == null) {
            out.println("You could not be found!");
        } else {
            for (Person p : peopleInList) {
                ArrayList<String> fws = p.frameworks;
                if (p.state.equals(targetPerson.state) && !p.equals(targetPerson)) {
                    for (String fwWeWant : targetPerson.frameworks) {
                        if (fws.contains(fwWeWant)) {
                            matches.add(p);
                            break;
                        }
                    }
                }
            }
        }

        if (matches.size() == 0) {
            out.println("Unfortunately, there are no matches! Please check again later");
        } else {
            out.println("<ul>");
            for (Person p : matches) {
                out.println("<li>" + p + "</li>");
            }
            out.println("</ul>");
        }
        out.println("<button onclick=\"location.href='/index.jsp'\" type=\"button\">Go Home</button>");

    }


%>
</body>
</html>
