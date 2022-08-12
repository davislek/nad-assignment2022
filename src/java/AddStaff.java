
 import com.connection.*;
import java.io.IOException;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.*;



@WebServlet("/AddStaff")
public class AddStaff extends HttpServlet {
   
    
      public int calculateMid (int num)
    {
        return (int)((2*num)/7);
        
    };
    public int calculateShort (int num)
    {
        return (int)((1*num)/7);
        
    };
    public int calculateLong(int num)
    {
      return (int)((4*num)/7);  
    };
    
    //smallest number in array
    public static int getSmallest(int[] a, int total){  
int temp;  
for (int i = 0; i < total; i++)   
        {  
            for (int j = i + 1; j < total; j++)   
            {  
                if (a[i] > a[j])   
                {  
                    temp = a[i];  
                    a[i] = a[j];  
                    a[j] = temp;  
                }  
            }  
        }  
       return a[0];  
}  
    //ratios
    public int calculateShortRatio (int numShort ,int smallest)
    {
        return (int)(numShort/smallest);
        
    };
    
     public int calculateMidRatio (int numMid ,int smallest)
    {
        return (int)(numMid/smallest);
        
    };
     
      public int calculateLongRatio (int numLong ,int smallest)
    {
        return (int)(numLong/smallest);
        
    };
      
      //percentage
      //for third position
      public int percentLong(int num)
      {
          
          return(int) (0.5*num);
      }
       //for second position
      public int percentMid(int numMid)
      {
          
          return(int) (0.3*numMid);
      }
      
       //for short
      public int percentShort(int numShort)
      {
          
          return(int) (0.1*numShort);
      }
      
    
    

   
   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
                String staffName = request.getParameter("sName");
                String gender = request.getParameter("gender");
                String address = request.getParameter("address");
                String phone = request.getParameter("phone");
                String email = request.getParameter("email");
                String pline = request.getParameter("pline");
                
                 

        //Creating session
        HttpSession session = request.getSession();
                

                
           
                
       
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    //Querying to insert product in the table
                    int i = DatabaseConnection.insertUpdateFromSqlQuery("insert into tblstaff(address,email,gender,name,phone,product_line) values('" + address + "','" + email + "','" + gender+ "','" +staffName + "','" + phone + "','" + pline + "')");
                    //If product inserted sucessfully in the database
                    if (i > 0) {
                        String success = "Staff registered successfully.";
                        //populating the total staff table
                int total_staffs=0;
                total_staffs=total_staffs +1;
                //updating the total staff table
                 if(pline.equals("short_term"))
                {
                //inserting into the total sales table for short_term
                 DatabaseConnection.insertUpdateFromSqlQuery("update tbltotalstaff set total_staff='"+total_staffs+"' where product_line='short_term' ");
                 
                }
                if(pline.equals("long_term"))
                {
                //inserting into the total sales table for long_term
                 DatabaseConnection.insertUpdateFromSqlQuery("update tbltotalstaffset total_staff='"+total_staffs+"' where product_line='long_term' ");
                 
                }
                if(pline.equals("mid_term"))
                {
                //inserting into the total sales table for short_term
                 DatabaseConnection.insertUpdateFromSqlQuery("update tbltotalstaff set total_staff='"+total_staffs+"' where product_line='mid_term' ");
                 
                }
                
                        //Adding method in session.
                        session.setAttribute("message", success);
                        //Response send to the admin-add-product.jsp
                        response.sendRedirect("admin-add-staff.jsp");
                    }
              
                
           
         
    }
      }
