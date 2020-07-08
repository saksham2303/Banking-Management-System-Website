
<%@ page import="java.sql.*"%>
<%@ page language="java" session="true"%>
<%
    String action = request.getParameter("action");
    if(action.equals("Create Account")){
        String firstname = request.getParameter("firstname");
        String lastname = request.getParameter("lastname");
        String phoneno = request.getParameter("phoneno");
        String accountuserid = request.getParameter("accountuserid");
        session.setAttribute("accountuserid", accountuserid);
        String email = request.getParameter("email");
        String streetname = request.getParameter("streetname");
        String houseno = request.getParameter("houseno");
        String dob = request.getParameter("dob");
        String statecity= request.getParameter("statecity");
        String pincode = request.getParameter("pincode");
        String gender = request.getParameter("gender");
        
        
        
        String accountno = request.getParameter("accountno");
        session.setAttribute("accountno", accountno);
        String accounttype= request.getParameter("accounttype");
        String security = request.getParameter("security");
        String balance = request.getParameter("balance");
        String ans = request.getParameter("ans");
        String branchname = request.getParameter("branchname");
        String pinno = request.getParameter("pinno");
        try{
            Class.forName("com.mysql.jdbc.Driver");
            String uname = "root";
            String pass = "";
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bank",uname,pass);
            Statement st = con.createStatement();
           ResultSet rs = st.executeQuery("SELECT * FROM account_table WHERE Account_no='"+accountno+"' AND pin_no='"+pinno+"'");
           if(rs.next()){
               %>
            <script type="text/javascript">
            alert("Account already exists please login");
            window.location.href = "index.jsp";
            </script>
            <%
                
           }
           else{
            String qry= "INSERT INTO `users_table` (`Account_user_id`, `first_name`, `last_name`, `house_no`, `street_name`, `city_state`, `pincode`, `email`, `phone_no`, `dob`, `gender`) VALUES ('"+accountuserid+"', '"+firstname+"', '"+lastname+"', '"+houseno+"', '"+streetname+"', '"+statecity+"', '"+pincode+"', '"+email+"', '"+phoneno+"', '"+dob+"', '"+gender+"')";
            String qrry= "INSERT INTO `account_table` (`Account_user_id`, `balance`, `Account_type`, `Account_no`, `pin_no`, `Branch_name`, `security_question`, `answers`) VALUES ('"+accountuserid+"', '"+balance+"', '"+accounttype+"', '"+accountno+"', '"+pinno+"', '"+branchname+"', '"+security+ "', '" +ans+"')";
            st.executeUpdate(qry);
            st.executeUpdate(qrry);
             %>
            <script type="text/javascript">
            alert("Account Successfuly created");
            window.location.href = "index.jsp";
            </script>
            <%
           }
        }
        catch(Exception e){
        out.println(e.getMessage());
    }
}
    else {
        response.sendRedirect("index.jsp");
    }
%>