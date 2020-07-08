

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>layoyt</title>
    
    <script>
        function validate() {
        
        var uname = document.myform.firstname.value;
         if(uname===""){
            alert("Please Enter a Username");
            document.myform.uname.focus;
            return false;
        }
        else if(uname.length<3 || uname.length>10){
            alert("The username must consist of letters of length between 5 to 15");
            document.myform.uname.focus;
            return false;
        }
        var lname = documnet.myform.lastname.value;
        if(lname===""){
            alert("Please Enter your lastname");
            document.myform.lname.focus;
            return false;
        }
        var email = document.myform.email.value;
        if(email===""){
            alert("Please Enter your email");
            document.myform.email.focus;
            return false;
        }
        var phoneno = document.myform.phoneno.value;
        
        var dob = document.myform.dob.value;
        if(dob===""){
            alert("Please Enter your Date of birth");
            document.myform.dob.focus;
            return false;
        }
        var state = documnt.myform.statecity.value;
         if(state==="" || state.length<3){
            alert("Please Correct State and City");
            document.myform.state.focus;
            return false;
        }
        var pincode = document.myform.pincode.value;
        if(pincode==="" || pincode.length<6){
            alert("Please Correct State and City");
            document.myform.pincode.focus;
            return false;
        }
         
        var phoneno = document.myform.phoneno.value;
        
        var pinno = document.myform.pinno.value;
        
        if(pinno==="" || pinno.length<6){
            alert("Please Correct Pin no it should 6 numbers long");
            document.myform.pinno.focus;
            return false;
        } 
        var balance = documnt.myform.balance.value;
        
        var branchname = document.myform.branchname.value;
        if(branchname===""){
            alert("Please Correct branchname");
            document.myform.branchname.focus;
            return false;
        } 
        var phoneno = document.myform.phoneno.value;
        if(phoneno==="" || phoneno.length<10){
            alert("Please Correct Phone number");
            document.myform.phoneno.focus;
            return false;
        }
        var houseno = documnt.myform.houseno.value;
        if(houseno===""){
            alert("Please Correct house no");
            document.myform.houseno.focus;
            return false;
        }
        var streetname = document.myform.streetname.value;
        
        
       
        
        
        
       
         
         
         if(balance===""){
            echo "alert("Please Correct balance details");";
            document.myform.balance.focus;
            return false;
        }
         
         if(streetname===""){
            alert("Please Correct State and City");
            document.myform.streetname.focus;
            return false;
        }
        
        } 
    
    </script>
    <style>
       
        @import url('https://fonts.googleapis.com/css2?family=Oswald:wght@700&display=swap');
        .account h1{
            font-weight: bolder;
            font-size: 40px;
            font-family: 'Oswald', sans-serif;
            
        }
        .account p{
            margin-top: -20px;
        }
        .account h2{
            font-size: 30px;
            color: gray;
            font-family: 'Oswald', sans-serif;
        }
        .omg, .accno{
            border-radius: 25px;
            height: 30px;
            padding-left: 15px;
            text-align: left;
            border: 5px solid whitesmoke;
            
        }
        
        .account{
            text-align: center;
        }
        .account p {
            color:gray;
        }
        .form select{
            width:435px;
            height:40px;
            border: 5px solid whitesmoke;
            border-radius: 25px;
            padding-left: 10px;
        }
        .form #dob{
            width:410px;
        }
        
        .forms input{
            height:30px;
        }
    .ins  {
  display:block;
    width:40%;
    height:45px;
    border-radius: 25px;
    margin:1rem 0;
    font-size: 1.2rem;
    outline:none;
    border:none;
    background-image: linear-gradient(to right, rgb(65, 65, 221),rgb(30, 30, 194),blue );
    
    cursor:pointer;
    transition: 0.5s;
    margin-left:175px;
    color:white;
    font-weight: bolder;
  
  }
  .ins:hover {
    background-position: right;
  }
  
  
    </style>
  
</head>
<body>

        <div class="account">
            <h1>Account Registration</h1>
            <p>Fill the form carefully to create an account</p>
            <h2>Personal Information</h2>
<%
       
    
        
        Random rand = new Random();
        int num = rand.nextInt(899999999) + 10000000;
        int number = rand.nextInt(8999999) + 1000000;
        
        
    
   
    %>  

            <form class="form" action="insertdata.jsp" target="_blank" name="myform">
                
                <input type="text" class="accno" title="Account user id" size="60px" name="accountuserid" value="<%=number%>" placeholder="Account user id"><br>
                <br><input type="text"  class="omg" size="60px" name="firstname" placeholder="First Name"><br>
                <br><input type="text" class="omg" size="60px" name="lastname" placeholder="Last Name"><br>
                <br><input type="text" class="omg" size="60px"  name="email" placeholder="Email"><br>
                <br><input type="text" class="omg" size="60px"  name="phoneno" placeholder="Mobile No."><br>
                <br><select name="gender">
                    <option  selected="selected">Gender</option>
                    <option>Male</option>
                    <option>Female</option>
                </select><br>
                <br><select>
                    <option selected="selected">Martial Status</option>
                    <option>Single</option>
                    <option>Married</option>
                </select><br>
                
                <br><input type="date" class="omg" name="dob" id ="dob" placeholder="Date of birth"><br>
                <br><input type="text" class="omg" name="statecity"  size="60px" placeholder="State/City"><br>
                <br><input type="text" class="omg" name="houseno" size="60px" placeholder="House no."><br>
                <br><input type="text" class="omg" name="streetname" size="60px" placeholder="Street name"><br>
                <br><input type="text" class="omg" name="pincode" size="60px" placeholder="Pincode"><br>
                <br>
                <br>
                <h2>Account Information</h2>
                 
    <input type="text" class="omg" size="60px" title="Account no" name="accountno" value="<%=num%>" placeholder="Account no"><br>
                <br><input type="text" class="omg" size="60px" name="pinno" placeholder="Pin no"><br>
                <br><input type="text" class="omg" size="60px" name="balance" placeholder="Balance"><br>
                <br><input type="text" class="omg" size="60px" name="branchname" placeholder="Branch name"><br>
                <br><select name="accounttype" >
                    <option selected="selected">Account type</option>
                    <option>Saving</option>
                    <option>Current</option>
                </select><br>
                <br><select name="security" >
                    <option selected="selected">Security Question</option>
                    <option>What is your nick name</option>
                    <option>What is your favorite animal</option>
                    <option>What is your favorite food</option>
                </select><br>
                    <br><input type="text" class="omg" name = "ans" size="59px" placeholder="Answer"><br>
                    
                <br> 
                <input type="submit" name="action" onclick="return validate()" value="Create Account" class="ins"> 
                <br>
                <br>
                <br>
                   

                
            </form>
        </div>
        

        
    
</body>

</html>
