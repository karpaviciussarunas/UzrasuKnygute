<%-- 
    Document   : index
    Created on : 2019-06-13, 23.37.49
    Author     : Sars
--%>

<%@page import="lt.bit.data.Person"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="lt.bit.db.DB"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% String personids = request.getParameter("id"); %>
        <% Integer personId = null;%>
        <% try {
                personId = new Integer(personids);
            } catch (Exception ex) {
            }
            //       patikrinu ar paduotas personId yra person sarase

        %>

        <h1>Užrašų knygutė</h1>
        <h2>Person List</h2>

        <ul><% for (int i = 0; i < DB.getAll().size(); i++) {%>
            <li> <%= DB.getAll().get(i)%>
                <a href="editPerson.jsp?id=<%= i%>"> Edit, </a>
                <a href="removeServlet?id=<%= i%>">  Remove,</a>    
                <a href="address.jsp?id=<%= i %>">   Address,</a>
                <a href="contact.jsp?id=<%= i %>">   Contact,</a> 
            </li>  
            <%}%>    
        </ul>


        <a href="editPerson.jsp">Add</a>
    </body>
</html>
