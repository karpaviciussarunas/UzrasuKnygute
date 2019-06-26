<%-- 
    Document   : contact
    Created on : 2019-06-14, 01.42.01
    Author     : Sars
--%>
<%@page import="org.apache.jasper.tagplugins.jstl.Util"%>
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
            // jei spaustas Add new address, tai pasiimame personId stringa
            String idps = request.getParameter("id");
            int idp = -1;
            try {
                //                jeigu personId yra normalus saicius, paverciam ji Integer
                idp = Integer.parseInt(idps);
            } catch (Exception ex) {
            }
            //            saugomės nuo nesamo personId
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
        <h2> <%= vardas + ", " + pavarde + " - "%> Edit Contact</h2>        
        <% } %>

        <%-- paimame contactId reiksme redagavimui is contact.jsp --%>
        <% String idcs = request.getParameter("idc");
//         jei idc tures normalia reikme ji pasikeis 
            int idc = -1;
            try {
//                paverciam contactId i Integer
                idc = Integer.parseInt(idcs);
            } catch (Exception ex) {
            }
        %>

        <form method= "POST" action="saveContactServlet?id=<%= idp%>" >
            <%-- jeigu contaktas jau yra sukurtas --%>
            <% if (idcs != null) {%>
            <input name="idc" type="hidden" value="<%= idc%>">
            <% }%>
            <% Contact c = DB.getContactById(idc);%>
            Contact<input name="contact" value="<%= (c == null) ? "" : c.getContact()%>">
            Type<input name="type" value="<%= (c == null) ? "" : c.getType()%>">
            <input type="submit"  value="save">
        </form>
        <form method= "POST" action="contact.jsp?id<%=idp%>" >
            <input type="submit"  value="cancel">
        </form>



 







    </body>
</html>
