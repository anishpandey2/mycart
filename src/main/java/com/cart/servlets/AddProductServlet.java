package com.cart.servlets;

import com.cart.FactoryProvider;
import com.cart.dao.CategoryDao;
import com.cart.dao.ProductDao;
import com.cart.entities.Category;
import com.cart.entities.Product;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;

@WebServlet(name = "AddProductServlet", urlPatterns = {"/AddProductServlet"})
@MultipartConfig
public class AddProductServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            //add category
            //fetching the category data
            String pName = request.getParameter("pName");
            String pDesc = request.getParameter("pDesc");
            int pPrice=Integer.parseInt(request.getParameter("pPrice"));
            int pDiscount=Integer.parseInt(request.getParameter("pDiscount"));
            int pQuantity=Integer.parseInt(request.getParameter("pQuantity"));
            int catId=Integer.parseInt(request.getParameter("catId"));
            Part part=request.getPart("pPic");
            
            Product p = new Product();
            p.setpName(pName);
            p.setpDesc(pDesc);
            p.setpPrice(pPrice);
            p.setpDiscount(pDiscount);
            p.setpQuantity(pQuantity);
            p.setpPhoto(part.getSubmittedFileName());
            
            
            
            //get category by id
            CategoryDao cdao= new CategoryDao(FactoryProvider.getFactory());
            Category category=cdao.getCategoryById(catId);
            
            p.setCategory(category);
            
            
            //product save
            ProductDao pdao=new ProductDao(FactoryProvider.getFactory());
            pdao.saveProduct(p);
            
            //pic upload
            //find out the path to upload photo
            
            String path=request.getServletContext().getRealPath("img")+File.separator+"products"+File.separator+part.getSubmittedFileName();
            System.out.println(path);
            
            //Uploading code
            try {
                
            
            FileOutputStream fos=new FileOutputStream(path);
            InputStream is = part.getInputStream();
            
            //reading the data
            
            byte []data=new byte[is.available()];
            
            is.read(data);
            
            //writing the data
            
            fos.write(data);
            
            fos.close();
            } catch (Exception e) {
                System.out.println(e);
            }
            
            HttpSession httpSession = request.getSession();
                
           httpSession.setAttribute("message","Product added successfully");
           response.sendRedirect("admin.jsp");
            
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
