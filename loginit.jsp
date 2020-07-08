
<%@ page import="java.sql.*"%>
<%@ page language="java" session="true"%>
<%
    String act = request.getParameter("act");
    if(act.equals("Login")){
        String accno = request.getParameter("accno");
        session.setAttribute("accno", accno);
        String pinno = request.getParameter("pinno");
        session.setAttribute("pinno", pinno);
        try{
            Class.forName("com.mysql.jdbc.Driver");
            String uname = "root";
            String pass = "";
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bank",uname,pass);
            Statement st = con.createStatement();
            Statement sts = con.createStatement();
            ResultSet yts = sts.executeQuery("SELECT Account_user_id FROM account_table where pin_no='"+pinno+"'");
            yts.next();
            String accusid = yts.getString("Account_user_id");
            ResultSet rs = st.executeQuery("SELECT * FROM account_table WHERE Account_no='"+accno+"' AND Account_user_id='"+accusid+"'");
            if(rs.next()){ 
               
               response.sendRedirect("dash.jsp");
                
            }
            else{
                 %>
            <script type="text/javascript">
            alert("Account does not exists please create and try again");
            window.location.href = "index.jsp";
            </script>
            <%
            }
        }
        catch(Exception e){
        out.println(e);
    }
}
    else if(act.equals("Create Account")) {
        response.sendRedirect("createacc.jsp");
    }
%>