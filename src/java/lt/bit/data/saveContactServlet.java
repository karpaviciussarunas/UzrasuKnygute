/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package lt.bit.data;

import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "saveContactServlet", urlPatterns = {"/saveContactServlet"})
public class saveContactServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        
        String idcs = request.getParameter("idc");
        int idp = -1;
// jeigu address id lygus null kuriam nauja   
        if (idcs == null) {
            String idps = request.getParameter("id"); //pasima reiksme is editAddress.jsp
            Contact c = null;
            try {
                idp = Integer.parseInt(idps);
            } catch (Exception ex) {
            }
//          surenku i svetaine suvestas reiksmes
            String contact = request.getParameter("contact");
            String type = request.getParameter("type");
// partikrinu ar suvesti duomenys yra ne null ir ar netusti
            if ((contact != null && !"".equals(contact))
                    && (type != null && !"".equals(type))) {
// sukuriam nauja Contacta
                c = new Contact(contact, type);

            }
            DB.addContact(idp, c);
//            EDIT Contact kai ida ners null
        } else {
            int idc = -1;
            try {
//                gaunu ida numeri
                idc = Integer.parseInt(idcs);
            } catch (Exception ex) {
            }
            Contact c = DB.getContactById(idc);
            if(c != null){
//            if (idc <= 0 || idc > DB.getContactById(idc).getNextId()) {
//                idc = -1;
//            }
            // patikrinam ar id gaunu suvestus duomenis 
//            if (idc > 0 && idc <= DB.getContactById(idc).getNextId()) {

                String contact = request.getParameter("contact");
                String type = request.getParameter("type");

                if ((contact != null && !"".equals(contact))
                        && (type != null && !"".equals(type))) {
// priskiriame naujai suvestas reiksaes pagal redaguojamo person ID 
                    DB.getContactById(idc).setContact(contact);
                    DB.getContactById(idc).setType(type);
                }
            }
//        }
        }
        response.sendRedirect("contact.jsp?id=" + idp); //atidirbus servletui ši eilute perleidzia darba index.jsp   
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
