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
import static lt.bit.db.DB.getAllAddresses;

/**
 *
 * @author Sars
 */
@WebServlet(name = "AddressSaveServlet", urlPatterns = {"/AddressSaveServlet"})
public class AddressSaveServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

// jeigu address id lygus null kuriam nauja
// reikia paimti person id "listo numeri"
// tada jam priskirti nauja adresa
        String idas = request.getParameter("ida");
// jeigu addressId lygus null kuriam nauja
        int idp = -1;
        if (idas == null) {
//            paimame personId is editAddress
            String idps = request.getParameter("id");
            Address a = null;

            try {
                idp = new Integer(idps);
            } catch (Exception ex) {
            }
//          surenku i svetaine suvestas reiksmes
            String address = request.getParameter("address");
            String city = request.getParameter("city");
            String postcode = request.getParameter("postcode");
// partikrinu ar suvesti duomenys yra ne null ir ar netusti
            if ((address != null && !"".equals(address))
                    && (city != null && !"".equals(city))
                    && (postcode != null && !"".equals(postcode))) {
                a = new Address(address, city, postcode);
            }
            DB.addAddress(idp, a);

//        EDIT Address kai idas nera null
        } else {
            int ida = -1;
            try {
//                gaunu ida numeri
                ida = Integer.parseInt(idas);
            } catch (Exception ex) {
            }
            if (ida <= 0 || ida > DB.getAddressById(ida).getNextId()) {
                ida = -1;
            }
            // patikrinam ar id gaunu suvestus duomenis 
            Address a = DB.getAddressById(ida);
            if (a != null) {

                String address = request.getParameter("address");
                String city = request.getParameter("city");
                String postcode = request.getParameter("postcode");

                if ((address != null && !"".equals(address))
                        && (city != null && !"".equals(city))
                        && (postcode != null && !"".equals(postcode))) {
//// priskiriame naujai suvestas reiksaes pagal redaguojamo person ID 
//DB.updateAddress(a).setAddress(address);
//DB.updateAddress(a).setCity(city);
//DB.updateAddress(a).setPostcode(postcode);
//                    DB.getAddressById(ida).setAddress(address);
//                    DB.getAddressById(ida).setCity(city);
//                    DB.getAddressById(ida).setPostcode(postcode);
                a.setAddress(address);
                a.setCity(city);
                a.setPostcode(postcode);
                }
            }
        }
        response.sendRedirect("index.jsp"); //atidirbus servletui ši eilute perleidzia darba index.jsp  
    }

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
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
