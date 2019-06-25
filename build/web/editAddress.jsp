<%-- 
    Document   : address
    Created on : 2019-06-14, 01.41.39
    Author     : Sars
--%>
<%@page import="lt.bit.data.Address"%>
<%@page import="org.apache.jasper.tagplugins.jstl.Util"%>
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
// jei spaustas Add new address, tai pasiimame personId stringa
            String idps = request.getParameter("personId"); 
            int idp = -1;
            try {
//                jeigu personId yra normalus saicius, paverciam ji Integer
                idp = Integer.parseInt(idps);
                } catch (Exception ex) {
            }
//            saugomės nuo nesamo personId. reik sugalvoti geresni buda
            if (idp < 0 || idp >= DB.getAll().size()) {
                idp = -1;
            }
//            jei ivesta nesamoninga id reiksme, graziname i index.jsp ir nutraukiam procesus
            if (idps != null && idp == -1) {
                response.sendRedirect("index.jsp");
                return;
            }  
             %>
             
             <%-- pagal gauta personId isvedu i ekrana tvarkomo person varda --%>
             
            <% if(DB.getAll().get(idp) != null) { %>
             <% String vardas = DB.getAll().get(idp).getFirstName(); %>
            <% String pavarde = DB.getAll().get(idp).getLastName(); %> 
            <h1> <%= vardas + ", " + pavarde + " - " %> Edit Address</h1>        
          <% } %>
          
          <%-- paimame addressId reiksme redagavimui is address.jsp --%>
         <% String idas = request.getParameter("ida");
//         jei ida tures normalia reikme ji pasikeis 
            int ida = -1;
            try {
//                paverciam addressId i Integer
                ida = Integer.parseInt(idas);
                } catch (Exception ex) {
            }
          %>
          
      <% Address a = null; %>
        <form method= "POST" action="AddressSaveServlet?personId=<%= DB.getAll().get(idp).getId() %>" >
            <%-- jei jau yra sukurtas addressList su id --%>
            <% if (idas != null) {%>
            <%  a = DB.getAddressById(ida); %>
            <input name="ida" type="hidden" value="<%= ida %>">
            <% } %>

            Address<input name="address" value="<%= (idas == null) ? "" : a.getAddress() %>">
            City<input name="city" value="<%= (idas == null) ? "" : a.getCity() %>">
            Postcode<input name="postcode"  value="<%= (idas == null) ? "" : a.getPostcode() %>">
            <input type="submit"  value="save">
        </form>
        
        <a href="index.jsp">Cancel</a>
        
    </body>
</html>
