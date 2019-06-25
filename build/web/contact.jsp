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
            if (id < 0 || id >= DB.getAll().size()) {
                id = -1;
            }
            if (idp != null && id == -1) {
                response.sendRedirect("index.jsp");
                return;
            } 
             %>
             <%-- paimame person id ir pagal ji ispausdiname person varda adresu skiltyje --%>
             <% if(DB.getAll().get(id) != null) { %>
             <% String vardas = DB.getAll().get(id).getFirstName(); %>
            <% String pavarde = DB.getAll().get(id).getLastName(); %>
            <h2> <%= vardas + ", " + pavarde + " - " %> Contact</h2>        
          <% } %>
        <ul>
            <!--einam per Address sarasa ir rodome jo rezultata-->
            <!-- pagal personId ispausdiname adresus -->
            <% for (Contact c : DB.getPersonContacts(DB.getAll().get(id).getId())) {%>
            <li><%= c %>

                <a href="editContact.jsp?idc=<%= c.getId() %>">   Edit Contact, </a><%= c.getId() %>
                <a href="deleteContact?idc=<%= c.getId() %>">     Remove Contact, </a>    
                <a href="address.jsp?personId=<%= id %>">         Address,</a>
 <%--= a.getId() %> Gaunu adsress id 
 <%= DB.getByAddress(a).getFirstName() --%> <p><%= c.getId() %></p>
            </li>
               <%}%> 
        </ul>
               
               <a href="editContact.jsp?personId=<%= id %>">Add new contact</a>
     <%--= DB.getAll().get(id).getId() --%>
        <a href="index.jsp">Cancel</a>
         
    </body>
</html>
