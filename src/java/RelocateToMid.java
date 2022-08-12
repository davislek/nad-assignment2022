
 import com.connection.*;
import java.io.IOException;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.*;



@WebServlet("/RelocateToMid")
public class RelocateToMid extends HttpServlet {
   
    
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
                String pline = request.getParameter("productLine");
                
                 

        //Creating session
        HttpSession session = request.getSession();
                

                
           
               
         try{         
         ResultSet rs;
         rs = DatabaseConnection.getResultFromSqlQuery("select  sum (total_staff)  from tbltotalstaff ");
         int num=rs.getInt(1);
                
        
        int numLong= calculateLong(num);
        int numShort= calculateShort(num);
        int numMid= calculateMid(num);
        int array[]={numShort,numMid,numLong};
        int smallest=getSmallest(array,3);
        int shortRatio=calculateShortRatio(numShort,smallest);
        int midRatio=calculateMidRatio(numMid,smallest);
        int longRatio=calculateShortRatio(numLong,smallest);
                
        //when shortRati is the largest
         
        if(shortRatio>= longRatio&& shortRatio>=midRatio)
        {
            if(numMid>1)
            {
                numMid=numMid-(percentMid(numMid));
                numShort=numShort+(percentMid(numMid));
                DatabaseConnection.insertUpdateFromSqlQuery("update set total_mid='"+numMid+"',total_short='"+numShort+"' where id=1 ");
                
            }
            
            if(numLong>1)
            {
                numLong=numLong-(percentLong(numLong));
                numShort=numShort+(percentLong(numLong));
                DatabaseConnection.insertUpdateFromSqlQuery("update set total_long='"+numLong+"',total_short='"+numShort+"' where id=1 ");
            }
            
        }
        
        //when the midRatio is the largest
         if(midRatio>= longRatio && midRatio>=shortRatio)
        {
            if(numShort>1)
            {
                numShort=numShort-(percentShort(numShort));
                numMid=numMid+ percentShort(numShort);
                DatabaseConnection.insertUpdateFromSqlQuery("update set total_mid='"+numMid+"',total_short='"+numShort+"' where id=1 ");
            }
            
            if(numLong>1)
            {
                numLong=numLong-percentLong(numLong);
                numMid=numMid+percentLong(numLong);
                DatabaseConnection.insertUpdateFromSqlQuery("update set total_mid='"+numMid+"',total_long='"+numLong+"' where id=1 ");
            }
            
        }
         //if longRatio is largest
         
          if(longRatio>= shortRatio && longRatio>=midRatio)
        {
            if(numShort>1)
            {
                numShort=numShort-percentShort(numShort);
                numLong=numLong+percentShort(numShort);
                DatabaseConnection.insertUpdateFromSqlQuery("update set total_short='"+numShort+"',total_longt='"+numLong+"' where id=1 ");
            }
            
            if(numMid>1)
            {
                numMid=numMid-percentMid(numMid);
                numLong=numLong + percentMid(numMid);
                 DatabaseConnection.insertUpdateFromSqlQuery("update set total_mid='"+numMid+"',total_short='"+numShort+"' where id=1 ");
            }
            
        }
             
         }
         catch (Exception e)
         {
             e.getMessage();
         }
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                 
                
           
         
    }
      }
