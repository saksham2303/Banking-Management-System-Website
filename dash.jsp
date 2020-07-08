

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import= "com.google.gson.Gson"%>
<%@ page import= "com.google.gson.JsonObject"%>
<%@ page import= "java.util.ArrayList"%>
<%@ page import= "java.util.List"%>
<%@ page import= "java.util.Map"%>
<%@ page import= "java.util.HashMap"%>
<%@ page import= "java.util.Calendar"%>
<%@ page import= "java.util.Date"%>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Dashboard</title>
    <%
        Gson gsonObj = new Gson();
        Gson gsonObj2 = new Gson();
        Map<Object,Object> map = null;
        List<Map<Object,Object>> list = new ArrayList<Map<Object,Object>>();
        List<Map<Object,Object>> lists = new ArrayList<Map<Object,Object>>();
        String dataPoints = null;
        String dataPoints2 = null;
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
            Statement stat = conn.createStatement();
            Statement sts = conn.createStatement();
            ResultSet yts = sts.executeQuery("SELECT Account_user_id FROM account_table where pin_no='"+pinno+"'");
            yts.next();
            String accusid = yts.getString("Account_user_id");
             ResultSet res = st.executeQuery("SELECT balance FROM account_table where Account_user_id='"+accusid+"'");
             
            ResultSet rs = st.executeQuery("SELECT balance FROM account_table where Account_user_id='"+accusid+"'");
            ResultSet rss = stt.executeQuery("SELECT first_name,last_name FROM users_table where Account_user_id='"+accusid+"'");
            ResultSet rrss = sstt.executeQuery("SELECT Account_type,Account_no,Branch_name FROM account_table where Account_user_id='"+accusid+"'");
            ResultSet rh =null;
            Statement statement = conn.createStatement();
	String xVal, yVal;
	Statement sdtt = conn.createStatement();
	ResultSet resultSet = statement.executeQuery("select * from deposit_table where Account_no = "+accno+" ORDER BY Date asc limit 7");
        ResultSet result = sdtt.executeQuery("select * from withdraw_table where Account_no = "+accno+" ORDER BY Date asc limit 7");
        Date d=new Date();  
         Date today = new Date(); 
         Calendar cal = Calendar.getInstance();
         cal.setTime(today); 
         String[] monthNames = {"January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"};
    
        
         
         int month = cal.get(Calendar.MONTH); // 5
         String monthsnames =  monthNames[month];


	
	while(resultSet.next()){
		
		yVal = resultSet.getString("deposit_amount");
		map = new HashMap<Object,Object>(); map.put("label",resultSet.getString("Date")); 
                map.put("y", Double.parseDouble(yVal)); list.add(map);
		dataPoints = gsonObj.toJson(list);
               
	}
        
        while(result.next()){
            xVal = result.getString("withdraw_amount");
             map = new HashMap<Object,Object>(); map.put("label",result.getString("Date")); 
             map.put("y", Double.parseDouble(xVal)); lists.add(map);
             dataPoints2 = gsonObj2.toJson(lists);
               
             
        }
        
          %>  
        
    
          
          <script type="text/javascript">
window.onload = function() { 
 
<% if(dataPoints != null) { %>
         
var chart = new CanvasJS.Chart("chartContainer", {
	theme: "light2",
	title: {
		text: "Deposit Updates Over The Recent Months"
	},
	subtitles: [{
		text: "Months"
	}],
	axisY: {
                
		title: "Balance",
		
	},
	data: [{
		type: "bar",
		indexLabel: "{yVal}",
		indexLabelFontColor: "#444",
		indexLabelPlacement: "inside",
		dataPoints: <%out.print(dataPoints);%>
	}]
});
chart.render();

<% } %> 


<% if(dataPoints2 != null) { %>
         
var chart = new CanvasJS.Chart("chartContainers", {
	theme: "light2",
	title: {
		text: "Withdraw Updates Over The Recent Months"
	},
	subtitles: [{
		text: "Months"
	}],
	axisY: {
                
		title: "Balance",
		
	},
	data: [{
		type: "bar",
		indexLabel: "{xVal}",
		indexLabelFontColor: "#444",
		indexLabelPlacement: "inside",
		dataPoints: <%out.print(dataPoints2);%>
	}]
});
chart.render();

<% } %> 
 
}
</script>


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

        }
        .py{
            flex: auto;
        }
        .py.pi a,h2{
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
        .sim{
            background-image:url(images/linear-green-gradient-1920x1080-c2-20b2aa-8fbc8f-a-135-f-14.svg);

        }
        #chartContainer,#chartContainers{
            margin-left: 50px;
            
        }
        .user-sim{
            color:white;
        }
        .user-sim.sim{
            display:inline-block;
            margin-left:580px;
        }
        .user-sim.sim a{
            text-decoration: none;
            background-color: white;
            padding:10px 10px 10px 10px;
            margin-left:10px;
            
        }
        .sim{
            display: flex;
           
            padding-left:60px;
            padding-top:30px;
            padding-bottom:20px;
            
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
       
       
       
       .infos{
           display:flex;
           padding-top:50px;
           padding-bottom:100px;
          
           
       }
       .infos p{
           flex:auto;
            border:1px solid black;
           padding-top:50px;
           padding-bottom:50px;
          border:none;
           font-size:25px;
            text-align: center;
            color:white;
            font-family: 'Lemonada', cursive;
       }
       .ppp{
           background-image: url(images/yellowish.jpg);
       }
       .pp{
           background-image: url(images/pinkish.jpg);
       }
       .p{
           background-image: url(images/bluish.jpg);
       }
       
      
       .combine{
           display:flex;
       }
    </style>
    
</head>
<body>
    
    
    
        
       
        
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
                <h2>
                    <% if(rss.next()){
                out.print(rss.getString("first_name")+" "+rss.getString("last_name"));}
                        %>
                    
                </h2>
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
               <a href="transfer.jsp">Transfer</a>
               <br>
                <br>
                <br>
               <br>
               <a href="transferhis.jsp">Transfer History</a>
                <br>
                <br>
                <br>
               <br>
               <a href="index.jsp">Log out</a>
                <br>
                <br>
                <br>
               <br>
            </div>
       
        <div class="py pe">
            <div class="header">
                <div class="user">
                    <h2>User Dashboard</h2>
                    
                </div>
                <div class="sim">
                    <div class="user-sim">
                        <h1>Balance: ₹
                            <%
                    if(rs.next()){
                out.print(rs.getString("balance"));}
                        %>
                        </h1>
                    
                    </div>
                    <div class="user-sim sim">
                        <a href="withdraw.jsp">Withdraw</a>
                        <a href="deposit.jsp">Deposit</a>
                    </div>
                </div>
                        <br>
                        <br>
                        
                        <div class="info">
                            
                                <%
                                    if(rrss.next()){
                                        out.println("<div class="+
                                                "infos >"+"<p class"
                                                + "=p >Account type <br><br>"+
                                                rrss.getString("Account_type")+
                                                "</p>"+"<p class"
                                                + "=ppp > Account no <br><br>"+rrss.getString("Account_no")+
                                                "</p>"+"<p class"
                                                + "=pp >Branch name <br><br>"+rrss.getString("Branch_name")+
                                                "</p> </div>");
                                    }
                                %>
                            
                        </div>
                                <div class="combine">
                                <div id="chartContainer" style="height: 370px; width: 45%;"></div>
                                <br>
                                <div id="chartContainers" style="height: 370px; width: 45%;"></div>
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
        <script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
</body>
</html>
        

