<%@ page import="java.sql.*"%>
<%@ page language="java" session="true"%>
<%
    String act = request.getParameter("action");
    if(act.equals("Verify")){
        String accusid = request.getParameter("accountuserid");
        String secure = request.getParameter("security");
        String answer = request.getParameter("ans");
        
        try{
            Class.forName("com.mysql.jdbc.Driver");
            String uname = "root";
            String pass = "";
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bank",uname,pass);
            Statement st = con.createStatement();
            Statement stt = con.createStatement();
           ResultSet rss = stt.executeQuery("SELECT pin_no FROM account_table WHERE Account_user_id='"+accusid+"'");
            ResultSet rs = st.executeQuery("SELECT security_question,answers FROM account_table WHERE Account_user_id='"+accusid+"'");
            if(rs.next()){ 
               String security = rs.getString("security_question");
               String ans = rs.getString("answers");
               if(ans.equals(answer) && security.equals(secure)){
                   rss.next();
                    String z = rss.getString("pin_no");
                    String mn = "index.jsp";
                 %>
            <script type="text/javascript">
            alert("Your pin is: <%=z%> ");
            window.location.href = "index.jsp";
            </script>
            <%
               }
                
            }
            else{
                String z = "forgot.jsp";
                out.println("<style>h1{color:gray;font-size:100px;}"
                        + "a{text-decoration:none;"
                        + "padding:15px 20px 15px 20px;"
                        + "color:white;"
                        + "font-size:25px;"
                        + "background-color:blue;"
                        + "border-radius:25px;}"
                        + "</style>"
                        + "<center><br><br><br><br><br><br>"
                        + "<h1>Wrong details entered</h1><br>"
                        + "<a href =" +z+" >Try again</a></center>");  
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