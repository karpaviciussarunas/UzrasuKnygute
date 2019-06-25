<%-- 
    Document   : address
    Created on : 2019-06-17, 17.37.44
    Author     : Sars
--%>

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
             <% Person p =DB.getAll().get(id);%>
             <% String vardas = p.getFirstName(); %>
            <% String pavarde = p.getLastName(); %>
            <h1> <%= vardas + ", " + pavarde + " - " %> Address</h1>        
          <% } %>
        <ul> 
            <!--einam per Address sarasa ir rodome jo rezultata-->
            <!-- pagal personId ispausdiname adresus -->
            <% for (Address a : DB.getPersonAddresses(DB.getAll().get(id).getId())) {%>
            <%-- for (Address a : DB.getPersonAddresses(DB.getAll().get(id).getId())) {--%>
            <li><%= a%> 

                <a href="editAddress.jsp?ida=<%= a.getId() %>">   Edit Address, </a><%= a.getId() %>
                <a href="deleteAddressServlet?ida=<%= a.getId() %>">     Remove Address, </a>    
                <a href="editContact.jsp?personId=<%= id %>">     Contact,</a>
               
 <%--= a.getId() %> Gaunu adsress id 
 <%= DB.getByAddress(a).getFirstName() --%> 
  <%}%>
            </li>
                
        </ul>
                
               <a href="editAddress.jsp?personId=<%= id %>">Add new address</a>
               <% // } %>
     <%--<%= DB.getAll().get(id).getId() %>--%>
        <a href="index.jsp">Cancel</a>
        <%--<%= id %>--%>
    </body>
</html>
