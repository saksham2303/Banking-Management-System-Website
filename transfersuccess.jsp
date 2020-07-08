
<%@ page import="java.sql.*"%>
<%@ page language="java" session="true"%>
<%@ page import= "java.util.Calendar"%>
<%@ page import= "java.util.Date"%>
<%
    String transfer = request.getParameter("transamount");
    String accno = (String)session.getAttribute("accno");
    String recaccno = request.getParameter("recaccno");
    String pinno = (String)session.getAttribute("pinno");
    String dipth = request.getParameter("dipth");
    
    Date d=new Date();  
            Date today = new Date(); 
         Calendar cal = Calendar.getInstance();
         cal.setTime(today); 
         String[] monthNames = {"January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"};
 int month = cal.get(Calendar.MONTH); 
         String monthsnames =  monthNames[month];
    if(dipth.equals("Transfer")){
        try{
            Class.forName("com.mysql.jdbc.Driver");
            String uname = "root";
            int bal_due=0;
            int balance_due=0;
            String pass = "";
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bank",uname,pass);
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("Select balance from account_table where Account_no = "+recaccno);
            Statement stt = con.createStatement();
            ResultSet rss = stt.executeQuery("Select balance from account_table where Account_no = "+accno);
            Statement sst = con.createStatement();
            ResultSet rrss = sst.executeQuery("Select * from account_table where Account_no = "+recaccno);
            rs.next();
            String balance = rs.getString("balance");
            int w = Integer.parseInt(transfer);
            int s = Integer.parseInt(balance);
            bal_due= s+w;
            rss.next();
            String bal = rss.getString("balance");
            int n = Integer.parseInt(bal);
            balance_due= n-w;
            if(rrss.next()){
            String recaccusid = rrss.getString("Account_user_id");
            String qry= "INSERT INTO `deposit_table` (`Account_no`, `deposit_amount`,`Account_user_id`,`balance_due`,`Month`,`Date`) VALUES ('"+recaccno+"', '"+transfer+"', '"+recaccusid+"', '"+bal_due+"','"+monthsnames+"','"+java.time.LocalDate.now()+"')";
            String qrry= "UPDATE account_table SET balance="+bal_due+" WHERE Account_no = '"+recaccno+"' ;";
            String query= "UPDATE account_table SET balance="+balance_due+" WHERE Account_no = '"+accno+"' ;";
            Statement sts = con.createStatement();
            ResultSet yts = sts.executeQuery("SELECT Account_user_id FROM account_table where pin_no='"+pinno+"'");
            yts.next();
            String accusid = yts.getString("Account_user_id");
            String qryy= "INSERT INTO `withdraw_table` (`Account_no`, `withdraw_amount`,`Account_user_id`,`balance_due`,`Month`,`Date`) VALUES ('"+accno+"', '"+transfer+"', '"+accusid+"', '"+balance_due+"','"+monthsnames+"','"+java.time.LocalDate.now()+"')";
            String qqry= "INSERT INTO `transfer_table` (`Account_no`, `receiver_account_no`,`amount`,`Account_user_id`,`Month`,`Date`) VALUES ('"+accno+"','"+recaccno+"', '"+transfer+"', '"+recaccusid+"','"+monthsnames+"','"+java.time.LocalDate.now()+"')";
            
            st.executeUpdate(qry);
           
             stt.executeUpdate(query);
              st.executeUpdate(qrry);
            st.executeUpdate(qryy);
            sst.executeUpdate(qqry);
             %>
            <script type="text/javascript">
            alert("Tranfer Successfull");
            window.location.href = "dash.jsp";
            </script>
            <%  
    }
            else{
                 %>
            <script type="text/javascript">
            alert("Account no. doesn't exist");
            window.location.href = "transfer.jsp";
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