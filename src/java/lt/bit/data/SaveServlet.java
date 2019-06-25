/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package lt.bit.data;

import static com.sun.corba.se.spi.presentation.rmi.StubAdapter.request;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Date;
import static java.util.Locale.LanguageRange.parse;
import java.util.logging.Level;
import java.util.logging.Logger;
import javafx.scene.chart.XYChart.Data;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import lt.bit.db.DB;

/**
 *
 * @author Sars
 */
@WebServlet(name = "SaveServlet", urlPatterns = {"/saveServlet"})
public class SaveServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    //Datos metodas verčiantis data į Stringa
    private Date parse(String birthDate){
SimpleDateFormat sdf =new SimpleDateFormat("yyyy-MM-dd");
Date dt = null;
try{
    dt = sdf.parse(birthDate);
}catch(Exception ex){
    Logger.getLogger(SaveServlet.class.getName()).log(Level.SEVERE,null, ex);
}
    return dt;   
}
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");


// jeigu id lygus null kuriam nauja
        String idp = request.getParameter("id");
        if (idp == null) {
//          surenku i svetaine suvestas reiksmes
            String firstName = request.getParameter("firstName");
            String lastName = request.getParameter("lastName");
            String birthDate = request.getParameter("birthDate");
            String salary = request.getParameter("salary");
// partikrinu ar suvesti duomenys yra ne null ir ar netusti
            if ((firstName != null && !"".equals(firstName))
                    && (lastName != null && !"".equals(lastName))
                    && (firstName != null && !"".equals(firstName))
                    && (birthDate != null && !"".equals(birthDate))
                    && (salary != null && !"".equals(salary))) {
// sukuriam nauja Person
                Person p = new Person(firstName, lastName, (Date) parse(birthDate), new BigDecimal(salary));
// Sukurta Person ikeliu i DB lista
                DB.getAll().add(p);
            }
            
// EDIT Person kai id nera null
        } else {
            int id = -1;
            try {
//                gaunu id numeri
                id = Integer.parseInt(idp);
            } catch (Exception ex) {
            }
            if (id < 0 || id >= DB.getAll().size()) {
                id = -1;
            }
            if (id >= 0 && id < DB.getAll().size()){
// patikrinam ar id gaunu suvestus duomenis 
                String firstName = request.getParameter("firstName");
                String lastName = request.getParameter("lastName");
                String birthDate = request.getParameter("birthDate");
                String salary = request.getParameter("salary");
                if ((firstName != null && !"".equals(firstName))
                    && (lastName != null && !"".equals(lastName))
                    && (birthDate != null && !"".equals(birthDate))
                    && (salary != null && !"".equals(salary))) {
// priskiriame naujai suvestas reiksaes pagal redaguojamo person ID 
 DB.getAll().get(id).setFirstName(firstName);
 DB.getAll().get(id).setLastName(lastName);
 DB.getAll().get(id).setBirthDate(parse(birthDate));
 DB.getAll().get(id).setSalary(new BigDecimal(salary));
          
                }
            }
        }
        response.sendRedirect("index.jsp"); //atidirbus servletui ši eilute perleidzia darba index.jsp  
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    

}
