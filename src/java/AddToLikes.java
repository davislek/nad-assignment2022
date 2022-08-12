
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.connection.DatabaseConnection;

@WebServlet("/AddToLikes")
public class AddToLikes extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = 0;

        //Getting all the parameters from the user
        
        String price = request.getParameter("price");
        String mrp_price = request.getParameter("mrp_price");
        String description = request.getParameter("description");
        String name = request.getParameter("mrp_price");
        String product_category= request.getParameter("category");
        
        
        try {
            //If user session is null user have to re-login
          
                
                //Querying to the database.
                int addToCart = DatabaseConnection.insertUpdateFromSqlQuery("insert into tbllikes values('" + id + "','" + description + "','" + name + "','" + price + "','" + mrp_price + "','"+product_category+"')");
                if (addToCart > 0) {
                    HttpSession likes = request.getSession();
                    
                    response.sendRedirect("index.jsp");
                
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
