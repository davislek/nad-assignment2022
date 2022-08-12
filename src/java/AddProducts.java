

import java.io.IOException;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;



import com.connection.DatabaseConnection;

@WebServlet("/AddProducts")
public class AddProducts extends HttpServlet {

 
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
                
                String productName = request.getParameter("pName");
                String productPrice = request.getParameter("pPrice");
                String descrip = request.getParameter("desc");
                String mrpPrice = request.getParameter("mPrice");
                String status = request.getParameter("status");
                String category = request.getParameter("category");
                int total_staff=0;
                total_staff=total_staff +1;
                //updating the total staff table
                 if(category.equals("short_term"))
                {
                //inserting into the total sales table for short_term
                 DatabaseConnection.insertUpdateFromSqlQuery("update set total_sales='"+total_staff+"' where product_line='short_term' ");
                 
                }
                if(category.equals("long_term"))
                {
                //inserting into the total sales table for long_term
                 DatabaseConnection.insertUpdateFromSqlQuery("update set total_sales='"+total_staff+"' where product_line='long_term' ");
                 
                }
                if(category.equals("mid_term"))
                {
                //inserting into the total sales table for short_term
                 DatabaseConnection.insertUpdateFromSqlQuery("update set total_sales='"+total_staff+"' where product_line='mid_term' ");
                 
                }
                
                
                
                
                

        //Creating session
        HttpSession session = request.getSession();
                

                
           
                
                try {
                    int id = 0;
                    
                    //Querying to insert product in the table
                    int i = DatabaseConnection.insertUpdateFromSqlQuery("insert into tblproduct(id,active,description,name,price,mrp_price,product_category) values('" + id + "','" + status + "','" + descrip + "','" + productName + "','" + productPrice + "','" + mrpPrice + "','" + category + "')");
                    //If product inserted sucessfully in the database
                    if (i > 0) {
                        String success = "Product added successfully.";
                        //Adding method in session.
                        session.setAttribute("message", success);
                        //Response send to the admin-add-product.jsp
                        response.sendRedirect("admin-add-product.jsp");
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
                
           
         
    }
      }
