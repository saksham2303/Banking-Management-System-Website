<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Log in | Create Account</title>
    <script>
        function validate(){
        var accno = document.myform.accno.value;
        
        
        if(accno===""){
            alert("Please enter the Account no");
            document.myform.accno.focus;
            return false;
        }
        else if(accno.length>9 || accno.length<8){
            alert("The Account no must consist of length 8 or under  9");
            document.myform.accno.focus;
            return false;
        }
        var accusid = document.myform.pinno.value;
        if(accusid===""){
            alert("Account user id not entered");
            document.myform.pinno.focus;
            return false;
        }
        else if(accusid.length!==4){
            alert("The Account user of must be of length 4");
            document.myform.pinno.focus;
            return false;
        }
        
    }
    </script>
    <style>
     @import url('https://fonts.googleapis.com/css2?family=Oswald:wght@700&display=swap');
     @import url('https://fonts.googleapis.com/css2?family=Roboto+Mono&display=swap');
       body{
    background-image: url(images/gridgap.jpg);
    
}
html,body{
  margin:0;
  padding:0;
  
}


.in-header{
    display:flex;
    padding-left:180px;
    padding-right:100px;
    padding-top:80px;
    
   
}
.phase{
   
    flex:auto;
}
.phase h1{
    text-align: center;
}
.phase.coco{
  background-image: url(images/bankofspain.jpg);
  background-size: 690px 620px;
  }

.phase.coco h1{
  color:red;
  opacity:0.7;
  margin-right:120px;
  padding-left:100px;
}
.phase.coco p{
  color:white;
  text-align: center;
  
}
.login-container{
    display: flex;
    align-items: center;
    text-align:center;
   
  }
  form{
    width:360px;
    color:#333;
    
  }
  .fixing-it{
    display:grid;
    grid-template-columns: 7% 93%;
    margin:25px 0;
    padding:5px 0;
    border-bottom: 2px solid rgb(88, 88, 238);
  }
  form h2{
    
    font-size: 2.9rem;
    text-transform: uppercase;
    margin: 15px 0;
    font-family: 'Roboto Mono', monospace;
  }
  .i{
    display:flex;
    justify-content: center;
    align-items: center;
    
    justify-content: center;
    align-items:center;
  }
  .i i{
    color:#d9d9d9;
    
  }
  .fixing-it > div{
    position:relative;
    height:45px;
  }
  .fixing-it > div h5{
    position: absolute;
    left:10px;
    top:50%;
    transform: translateY(-90%);
    color:#999;
    font-size:18px;
    transition: 0.3s;
  }
  .input{
    position:absolute;
    width:100%;
    height:100%;
    top:0;
    left:0;
   
    border: none;
    background: none;
    outline: none;
  }
  .fixing-it.one{
    margin-top:0;
  
  }
  input{
     margin-left: -13px;
  }
  .fixing-it .i i{
    color:blue;
  }
  
  .fixing-it.two{
    margin-bottom: 4px;
  }
  .a a{
    display: block;
    text-align: right;
    text-decoration: none;
    font-size: 0.9rem;
    transition: 0.3s;
    color:gray;
  }
  .a a:hover{
    color:blue;
  }
  .btn{
    display:block;
    width:100%;
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
  
  }
  .btnn{
    display:block;
    width:100%;
    height:45px;
    border-radius: 25px;
    margin:1rem 0;
    font-size: 1.2rem;
    outline:none;
    border:none;
    background-image: linear-gradient(to right, rgb(65, 65, 221),rgb(30, 30, 194),blue );
    
    cursor:pointer;
    transition: 0.5s;
    text-align: center;
    color:white;
    font-weight: bolder;
  
  }
 
  .btn:hover{
    background-position: right;
  }
  
  .fixing-it.focus div h5{
      top:5px;
      font-size: 15px;
  }
form{
   margin-left: 100px;
}  
form img{
    width:15%;
}
input{
    color:black;
}
.phase{
  background-color: white;
}
.phase.cool form{
  margin-right:-200px;
}
    </style>
    
</head>
<body>
    <div class = "header">
            <div class="in-header">
                <div class="phase coco">
                    <br>
                    <br>
                    <br>
                    <br>
                    <br>
                    <br>
                    <br>
                    <br><br>
                    <br>
                    <br>
                    <br>
                    <h1>Royal Mint</h1>
                    
                    
                </div>
                <div class="phase cool">
                   <br></br>
                    <div class="login-container">
                        <form action="loginit.jsp" method="post" name="myform">
                            <img src="images/undraw_profile_pic_ic5t.svg" class="avatar">
                            <h2>Welcome</h2>
                      <div class="fixing-it one focus">
                            <div class="i">
                                <i class="fa fa-user"></i>
                            </div>
                            <div>

                              <input type="text" name="accno" class="input" placeholder="Account no" >
                          </div>
                      </div>
                      <div class="fixing-it two focus">
                          <div class="i">
                              <i class="fa fa-lock"></i>
                          </div>
                          <div>
                              <input type="password"  name="pinno" class="input" placeholder="Account Pin no">
                        </div>
                      </div>
                      <div class="a">
                          <a href="forgot.jsp" class="forgot">Forgot password?</a>
                    </div>
                      <br>
                      <br>
                      <br>
                      <input  type="submit" name ="act" value="Login" onclick="return validate()" class="btn"  >
                        <p>or</p>
                      <input type="submit" name = "act" value="Create Account" class="btn">


                <br></br>
                  </form>
                      </div>
                </div>
            </div>
        </div>
</body>
</html>

