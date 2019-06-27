<%-- 
    Document   : contact
    Created on : 2019-06-19, 10.35.26
    Author     : Sars
--%>

<%@page import="lt.bit.data.Contact"%>
<%@page import="lt.bit.data.Person"%>
<%@page import="lt.bit.db.DB"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String idp = request.getParameter("id");
            int id = -1;
            try {
                id = Integer.parseInt(idp);
            } catch (Exception ex) {
            }
//            saugomės nuo nesamo person id
            if (id <= 0 || id > DB.getById(id).getNextId()) {
                id = -1;
            }
            if (idp != null && id == -1) {
                response.sendRedirect("index.jsp");
                return;
            }
        %>
        <%-- paimame person id ir pagal ji ispausdiname person varda adresu skiltyje --%>
        <% if (DB.getById(id) != null) { %>
        <% String vardas = DB.getById(id).getFirstName(); %>
        <% String pavarde = DB.getById(id).getLastName();%>
        <h2> <%= vardas + ", " + pavarde + " - "%> Contact</h2>        
        <% } %>
        <ul>
            <!--einam per Contact sarasa ir rodome jo rezultata-->
            <!-- pagal personId ispausdiname contacts -->
            <% for (Contact c : DB.getPersonContacts(id)) {%>
            <li><%= c%>
                
               
                <a href="editContact.jsp?idc=<%= c.getId()%> "><button type="button">Edit Contact</button></a>
                <a href="deleteContact?idc=<%= c.getId()%> "><button type="button">Remove Contact</button></a>    
                <a href="address.jsp?id=<%= id%>"><button type="button">Address</button></a>
            </li>
            <%}%> 
        </ul>

        <form method= "POST" action="editContact.jsp?id=<%= id%>" >
            <input type="submit"  value="Add new contact">
        </form>
        <form method= "POST" action="index.jsp?id<%=id%>" >
            <input type="submit"  value="cancel">
        </form>


    </body>
</html>
