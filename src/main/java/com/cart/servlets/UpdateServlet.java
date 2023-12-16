
package com.cart.servlets;

import com.cart.FactoryProvider;
import com.cart.entities.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;


@WebServlet(name = "UpdateServlet", urlPatterns = {"/UpdateServlet"})
public class UpdateServlet extends HttpServlet {

  
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            System.out.println("Hello world");
            
            try{
                String userName=request.getParameter("user_name");
                String userEmail=request.getParameter("user_email");
                String userPassword=request.getParameter("user_password");
                String userPhone=request.getParameter("user_phone");
                String userAddress=request.getParameter("user_address");
                String id=request.getParameter("userId");
                int UserId=Integer.parseInt(id);
                System.out.println(userName);
                if(userName.isEmpty()){
                    out.print("Name is blank");
                    return;
                }
                
                
                Session session = FactoryProvider.getFactory().openSession();
                Transaction tx=session.beginTransaction();
                String q="FROM User WHERE userId =:id";
                Query query=session.createQuery(q);
                query.setParameter("id",UserId );
                User user=(User)query.uniqueResult();
                
                user.setUserId(UserId);
                user.setUserName(userName);
                user.setUserEmail(userEmail);
                user.setUserPassword(userPassword);
                user.setUserPhone(userPhone);
                user.setUserAddress(userAddress);
                
                session.save(user);
                
                tx.commit();
                session.close();
                
                HttpSession httpSession=request.getSession();
                httpSession.setAttribute("message", "Details updated successfully !! Login again ");
                httpSession.removeAttribute("current-user");
                response.sendRedirect("login.jsp");
            }
            catch(Exception e){
                System.out.println(e);
            }
        }
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
