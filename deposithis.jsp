

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Deposit History</title>
    
    
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Oswald:wght@700&display=swap');
        @import url('https://fonts.googleapis.com/css2?family=Roboto+Mono&display=swap');
        body,html{
            margin:0;
            padding:0;
        }
        .side{
            display:flex;
            
        
        }
        .user{
            padding-left:20px;
            padding-bottom:20px;
            padding-top:10px;
        }
        .user h2{
           
            color:gray;
            text-align: left;

        }
        .py{
            flex: auto;
        }
        .py.pi a,h3{
            text-decoration: none;
            margin-bottom: 20px;
            color:white;
            padding-left: 30px;
            padding-bottom: 5px;
            padding-top: 5px;
            font-size: 20px;
            margin-top: 80px;
            padding-right: 60px;
            font-family: 'Comic Neue', cursive;
           
            
        }
        .py.pi hr{
            width:90%;
        }
        
        
        
        .py.pi{
            background-image:url(images/darkpurple.jpg);
            height:1200px;
        }
        .py.pi a:hover{
            background-color: rgba(255, 255, 255, 0.568);
        }
       .py.pe{
           width:1200px;
       }
       
       .user-sim h1,h2{
           text-align:center;
           color:black;
           
       }
       .user-sim h1{
           font-family: 'Anton', sans-serif;
           padding-bottom:60px;
       }
       
        input{
           border:none;
           border-bottom: 1px solid skyblue;
           padding-bottom:20px;
           padding-top: 20px;
           font-size: 20px;
           width:300px;
           padding-left:10px;
           
       }
       .image img{
           margin-top: 70px;
           margin-left: 870px;
       }
       tr,td{
           text-align: center;
           
       }
       .td{
           font-size: 20px;
           
          background-color: rgba(189, 33, 189, 0.925);
          color:white;
  
       }
       td{
           background-color: darkorange;
           color:white;
       }
       table{
         
           width:100%;
           margin-top: 50px;
            
         
       }    
       
    </style>
    
</head>
<body>
    
    
    <%
        
       String accno = (String)session.getAttribute("accno");
       String pinno = (String)session.getAttribute("pinno");
        try{
            Class.forName("com.mysql.jdbc.Driver");
            String uname = "root";
            String pass="";
            
            String url = "jdbc:mysql://localhost:3306/bank";
            Connection conn = DriverManager.getConnection(url,uname,pass);
            Statement st = conn.createStatement();
            Statement stt = conn.createStatement();
            Statement sstt = conn.createStatement();
            Statement sts = conn.createStatement();
            ResultSet yts = sts.executeQuery("SELECT Account_user_id FROM account_table where pin_no='"+pinno+"'");
            yts.next();
            String accusid = yts.getString("Account_user_id");
            ResultSet rss = stt.executeQuery("SELECT first_name,last_name FROM users_table where Account_user_id='"+accusid+"'");
            ResultSet rrss = sstt.executeQuery("SELECT balance FROM account_table where Account_user_id='"+accusid+"'");
            
          %>  
        
        
       
        
        <div class="side">
            
            <div class="py pi">
                <br>
                <br>
                
                <br>
                <br>
                <%
                Statement y = conn.createStatement();
                ResultSet h = y.executeQuery("Select gender from users_table where Account_user_id='"+accusid+"'");
                h.next();
                String gen = h.getString("gender").toUpperCase();
                String f  = "FEMALE";
                String L = "MALE";
                if(gen.contains(f)){
                    out.print("<style>img{width:180px; margin-left:50px;}</style><img src=' images/undraw_female_avatar_w3jk.svg' >");
                }
                else if(gen.contains(L)){
                    out.print("<style>img{width:180px; margin-left:50px;}</style><img src=' images/undraw_male_avatar_323b.svg' >");
                }
                %>
                <br>
                <h3>
                    <% if(rss.next()){
                out.print(rss.getString("first_name")+" "+rss.getString("last_name"));}
                        %>
                    
                </h3>
                <br>
                <br>
                <hr>
                <br>
                <br>
                <br>
                
                <a href="dash.jsp"> Account Information</a>
               <br>
               <br>
               <br>
               <br>
               <a href="withdraw.jsp">Withdraw</a>
                <br>
                <br>
                <br>
               <br>
               <a href="deposit.jsp">Deposit</a>
                <br>
                <br>
                <br>
               <br>
               <a href="withdrawhis.jsp">Withdraw History</a>
                <br>
                <br>
                <br>
               <br>
               <a href="deposithis.jsp">Deposit History</a>
                <br>
                <br>
                <br>
               <br>
               <a href="transfer.jsp">Transfer Money</a>
                <br>
                <br>
                <br>
               <br>
                <a href="transferhis.jsp">Transfer History</a>
                <br>
                <br>
                <br>
               <br>
            </div>
       
        <div class="py pe">
            <div class="header">
                <div class="user">
                    <h2>User Dashboard</h2>
                    <hr>
                    
                </div>
                <div class="sim">
                    <div class="user-sim">
                        <h1>Deposit History</h1>
                        <h2>Account no: <%
                            out.print(accno);
                        %></h2>
                        <h2>Balance: ₹<%if(rrss.next()){
                            out.print(rrss.getString("balance"));
                        }%></h2>
                    
                    </div>
                        <br>
                        <table>
                                    <tr>
                                        <td class="td">S No.</td>
                                        <td class="td">Account No</td>
                                        <td class="td">Deposit Amount</td>
                                        <td class="td">Account User ID</td>
                                        <td class="td">Balance Due</td>
                                        <td class="td">Month</td>
                                        <td class="td">Date</td>
                                        
                                    </tr>
                                
                                
                                <% 
                                Statement sd = conn.createStatement();
                                ResultSet rh = sd.executeQuery("select * from deposit_table where Account_no ="+accno);
                                int c = 1;
                                while(rh.next())
{
                                %>
                                <tr>
                                    <td><%= c %></td>
                                    <td><%= rh.getString(1) %></td>
                                    <td><%= rh.getString(2) %></td>
                                    <td><%= rh.getString(3) %></td>
                                    <td><%= rh.getString(4) %></td>
                                    <td><%= rh.getString(5) %></td>
                                    <td><%= rh.getString(6) %></td>
                                    
                                    
                                
                                </tr>
                               
                                
                                <%
                                
                                c++;}
                                %>
                 </table>
                        <br>
                        <br>
                        <br>
                        <br>
                        
                      
                         
                </div>
                       
                
           
        </div>
    </div>
        </div>
                       
                       
                    <% } 
                catch(Exception e){
            out.print(e.getMessage());
        }
        %>
</body>
</html>
        

