
<%@ page import="java.sql.*"%>
<%@ page language="java" session="true"%>
<%@ page import= "java.util.Calendar"%>
<%@ page import= "java.util.Date"%>
<%
    Date d=new Date();  
            Date today = new Date(); 
         Calendar cal = Calendar.getInstance();
         cal.setTime(today); 
         String[] monthNames = {"January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"};
    
        
         
         int month = cal.get(Calendar.MONTH); // 5
         String monthsnames =  monthNames[month];
    String withdraw = request.getParameter("withamount");
    String accno = (String)session.getAttribute("accno");
    String pinno = (String)session.getAttribute("pinno");
    String with = request.getParameter("with");
    
    if(with.equals("Withdraw")){
        try{
            Class.forName("com.mysql.jdbc.Driver");
            String uname = "root";
            int bal_due=0;
            String pass = "";
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bank",uname,pass);
            Statement st = con.createStatement();
            Statement sts = con.createStatement();
            ResultSet yts = sts.executeQuery("SELECT Account_user_id FROM account_table where pin_no='"+pinno+"'");
            yts.next();
            String accusid = yts.getString("Account_user_id");
            ResultSet rs = st.executeQuery("Select balance from account_table where Account_user_id = "+accusid);
            rs.next();
            String balance = rs.getString("balance");
            int w = Integer.parseInt(withdraw);
            int s = Integer.parseInt(balance);
            if(s<w){
                
                 
                  %>
            <script type="text/javascript">
            alert("Not enough money");
            window.location.href = "withdraw.jsp";
            </script>
            <%
            }
            else{
            bal_due= s-w;
            String qry= "INSERT INTO `withdraw_table` (`Account_no`, `withdraw_amount`,`Account_user_id`,`balance_due`,`Month`,`Date`) VALUES ('"+accno+"', '"+withdraw+"', '"+accusid+"', '"+bal_due+"','"+monthsnames+"','"+java.time.LocalDate.now()+"')";
            String qrry= "UPDATE account_table SET balance="+ bal_due+" WHERE Account_no = '"+accno+"' ;";
            st.executeUpdate(qry);
            st.executeUpdate(qrry);
             %>
            <script type="text/javascript">
            alert("Withdrawal Successfull");
            window.location.href = "dash.jsp";
            </script>
            <%
            }
    }
            catch(Exception e){
            out.println(e.getMessage());
        }
    }
    else{
        out.print("withdraw cancel");
    }
%>