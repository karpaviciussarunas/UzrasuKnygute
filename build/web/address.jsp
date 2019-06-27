<%-- 
    Document   : address
    Created on : 2019-06-17, 17.37.44
    Author     : Sars
--%>

<%@page import="java.util.List"%>
<%@page import="lt.bit.data.Person"%>
<%@page import="lt.bit.data.Address"%>
<%@page import="org.apache.jasper.tagplugins.jstl.Util"%>
<%@page import="lt.bit.db.DB"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Address</title>
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
        <h2> <%= vardas + ", " + pavarde + " - "%> Addresses</h2>        
        <% } %>

        <ul> <% for (Address a : DB.getPersonAddresses(id)) {%>
            <li><%= a%>

                <a href="editAddress.jsp?ida=<%= a.getId()%>&id=<%= id%>"><button type="button">Edit Address</button></a>
                <a href="deleteAddressServlet?ida=<%= a.getId()%>&id=<%= id%>"><button type="button">Remove Address</button></a>   
                <a href="contact.jsp?id=<%= id%>"><button type="button">Contact</button></a>

            </li>
            <%}%>
        </ul>
        <form method= "POST" action="editAddress.jsp?id=<%= id%>" >
            <input type="submit"  value="Add new address">
        </form>
        <form method= "POST" action="index.jsp?id<%=id%>" >
            <input type="submit"  value="cancel">
        </form>

    </body>
</html>
