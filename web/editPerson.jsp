<%-- 
    Document   : editPerson
    Created on : 2019-06-14, 01.52.38
    Author     : Sars
--%>


<%@page import="lt.bit.data.Person"%>
<%@page import="java.text.SimpleDateFormat"%>
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

        <h1>Edit Person</h1>

        <%
            String ids = request.getParameter("id");
            int id = -1;
            try {
                id = Integer.parseInt(ids);
            } catch (Exception ex) {
            }
//            saugomės nuo nesamo person id
            if (id <= 0 || id > DB.getById(id).getNextId()) {
                id = -1;
            }
            if (ids != null && id == -1) {
                response.sendRedirect("index.jsp");
                return;
            }
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        %>
        <% Person p = null; %>
        <form method= "POST" action="saveServlet">
            <% if (ids != null) {%>
            <% p = DB.getById(id);%> 
            <input name="id" type="hidden" value="<%= id%>">
            <% }%>
            Vardas<input name="firstName" value="<%= (ids == null) ? "" : p.getFirstName()%>">
            Pavardė<input name="lastName" value="<%= (ids == null) ? "" : p.getLastName()%>">
            Gimimo data<input type="date" name="birthDate" value="<%=(ids == null) ? "" : sdf.format(p.getBirthDate())%>">
            Salary<input name="salary"  value="<%= (ids == null) ? "" : p.getSalary()%>">
            <input type="submit" value="save">

        </form>
        <form method= "POST" action="index.jsp" >
            <input type="submit"  value="Cancel">
        </form>

    </body>
</html>
