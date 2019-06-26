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
            String idps = request.getParameter("id");
            int idp = -1;
            try {
//                jeigu personId yra normalus skaicius, paverciam ji Integer
                idp = Integer.parseInt(idps);
            } catch (Exception ex) {
            }
//            saugomės nuo nesamo personId. reik sugalvoti geresni buda
            if (idp <= 0 || idp > DB.getById(idp).getNextId()) {
                idp = -1;
            }
            //            jei ivesta nesamoninga id reiksme, graziname i index.jsp ir nutraukiam procesus
            if (idps != null && idp == -1) {
                response.sendRedirect("index.jsp");
                return;
            }
        %>

        <%-- pagal gauta personId isvedu i ekrana tvarkomo person varda --%>

        <% if (DB.getById(idp) != null) { %>
        <% String vardas = DB.getById(idp).getFirstName(); %>
        <% String pavarde = DB.getById(idp).getLastName();%> 
        <h2> <%= vardas + ", " + pavarde + " - "%> Edit Address</h2>        
        <% } %>

        <%-- paimame addressId reiksme redagavimui is address.jsp --%>
        <% String idas = request.getParameter("ida");
//         jei ida tures normalia reikme ji pasikeis 
            int ida = -1;
            try {
//                paverciu addressId i Integer
                ida = Integer.parseInt(idas);
            } catch (Exception ex) {
            }
        %>


        <form method= "POST" action="AddressSaveServlet?id=<%= idp%>">
            <%-- jeigu adresas jau yra sukurtas --%>
            <% if (idas != null) {%>
            <input name="ida" type="hidden" value="<%= ida%>">
            <% }%>
            <% Address a = DB.getAddressById(ida);%>
            Address<input name="address" value="<%= (idas == null) ? "" : a.getAddress()%>">
            City<input name="city" value="<%= (idas == null) ? "" : a.getCity()%>">
            Postcode<input name="postcode"  value="<%= (idas == null) ? "" : a.getPostcode()%>">
            <input type="submit"  value="save">
        </form>
            
        <form method= "POST" action="address.jsp?id<%=idp%>" >
            <input type="submit"  value="cancel">
        </form>
       
    </body>
</html>
