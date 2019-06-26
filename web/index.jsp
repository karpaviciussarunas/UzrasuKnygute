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

        <ul><% for (Person p : DB.getAll()) {%>
            <li> <%= "Name: " + p.getFirstName() + ".    " +" Last Name: " + p.getLastName()+".      " + " Birth Date: " + p.getBirthDate()+".       " + " Salary: " + p.getSalary()+".   " %>
               
                <a href="editPerson.jsp?id=<%=p.getId()%>">  <button type="button">Edite</button></a>
                <a href="removeServlet?id=<%=p.getId()%>"> <button type="button">Remove</button></a>    
                <a href="address.jsp?id=<%=p.getId()%>">   <button type="button">Address</button></a>
                <a href="contact.jsp?id=<%=p.getId()%>">  <button type="button">Contact</button></a> 
            </li>  
            <%}%>    
        </ul>
        <form method= "POST" action="editPerson.jsp" >
            <input type="submit"  value="Add">
        </form>

    </body>
</html>
