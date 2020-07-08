
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Forgot Password</title>
        <style>
            select{
               width:475px;
            }
            input,select{
               font-size:15px;
               height:30px;
               border-radius: 5px;
               
            }
            h1{
                color: whitesmoke;
            }
            form{
                border:1px solid black;
                width:560px;
                background-color: white;
            }
            center{
                padding-top: 130px;
            }
            body{
                background-image: url(images/unnamed.jpg);
            }
            input{
                padding-left: 10px;
            }
             .btn{
    width:120px;
    height:45px;
    border-radius: 25px;
    margin:1rem 0;
    font-size: 1.2rem;
    outline:none;
    border:none;
    background-image: linear-gradient(to right, rgb(65, 65, 221),rgb(30, 30, 194),blue );
    background-size: 200%;
    cursor:pointer;
    transition: 0.5s;
    text-align: center;
    color:white;
    font-weight: bolder;
   background-position: right;
  }
          </style>
    </head>
    <body>
    <center>
        
        <h1>Forgot Password? Don't worry enter some details below to get password.</h1> 
        <br>
        <br>
        <br>
        <form action="analysis.jsp" method="post">
            <br>
        <br>
        <br>
        <input type="text" size="60px" name="accountuserid" placeholder="Account user id"><br>
        <br><select name="security" >
                    <option selected="selected">Security Question</option>
                    <option>What is your nick name</option>
                    <option>What is your favorite animal</option>
                    <option>What is your favorite food</option>
                </select><br>
                    <br><input type="text" name = "ans" size="59px" placeholder="Answer"><br>
                    <br><input type="submit" class="btn" name = "action" value="Verify"<br>
        <br>
        <br>
        <br> 
        </form>
                    </center>
    </body>
</html>
