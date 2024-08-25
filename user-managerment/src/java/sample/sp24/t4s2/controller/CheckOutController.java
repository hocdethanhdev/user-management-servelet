/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.sp24.t4s2.controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import sample.sp24.t4s2.product.ProductDAO;
import sample.sp24.t4s2.shopping.Cart;
import sample.sp24.t4s2.shopping.Weapon;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "CheckOutController", urlPatterns = {"/CheckOutController"})
public class CheckOutController extends HttpServlet {

    private static final String ERROR = "viewCart.jsp";
    private static final String SUCCESS = "viewCart.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            HttpSession session = request.getSession();
            Cart cart = (Cart) session.getAttribute("CART");
            if (cart != null && cart.getCart().size()!=0) {
                ProductDAO dao = new ProductDAO();
                boolean checkQuantityTotal = false;
                boolean checkUpdateQuantity = false;
                boolean checkCreateNewOrder = false;
                boolean checkCreateNewDetail = false;
                String notEnoughQuantity = "";
                int newOrderID = 0;

                for (Weapon weapon : cart.getCart().values()) {
                    String id = weapon.getId();
                    int quantity = weapon.getQuantity();
                    boolean checkQuantity = dao.checkQuantity(id, quantity);
                    if (!checkQuantity) {
                        checkQuantityTotal = true;
                        notEnoughQuantity += "The quantity of " + weapon.getName() + " you choose is larger than the quantity in our stock.</br>";
                    }

                }
                if (checkQuantityTotal) {
                    request.setAttribute("CART_MESSAGE", notEnoughQuantity);
                } else {
                    newOrderID = dao.getNewOrderID() + 1;
                    Double total = Double.parseDouble(request.getParameter("total"));
                    String userID = request.getParameter("userID");
                    checkCreateNewOrder = dao.createNewOrder(total, userID);
                    if (!checkCreateNewOrder) {
                        request.setAttribute("CART_MESSAGE", "Fail to create new order!");
                    } else {
                        newOrderID=dao.getNewOrderID();
                        for (Weapon weapon : cart.getCart().values()) {
                            String id = weapon.getId();
                            int quantity = weapon.getQuantity();
                            double tmpTotal = weapon.getPrice() * quantity;
                            checkCreateNewDetail = dao.createNewDetail(tmpTotal, quantity, newOrderID, id);
                            if (!checkCreateNewDetail) {
                                request.setAttribute("CART_MESSAGE", "Fail to create new OrderDetail!");
                                break;
                            }
                        }
                    }
                    for (Weapon weapon : cart.getCart().values()) {
                        String id = weapon.getId();
                        int quantity = weapon.getQuantity();
                        checkUpdateQuantity = dao.updateQuantity(id, quantity);
                        if (!checkUpdateQuantity) {
                            request.setAttribute("CARTO_MESSAGE", "Fail to update DB quantity");
                            break;
                        }
                    }

                    
                    if (checkUpdateQuantity && checkCreateNewOrder && checkCreateNewDetail) {
                        request.setAttribute("CART_MESSAGE", "Ordered successfull! Your Order number is : " + newOrderID);
                        session.removeAttribute("CART");
                    }
                    url = SUCCESS;
                }

            } else {
                request.setAttribute("CART_MESSAGE", "Cart Empty");
            }

        } catch (Exception e) {
            log("Error at CheckOutController: " + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
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
