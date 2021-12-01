<!DOCTYPE html>
<html>
<style>
* {
  margin: 0px;
  padding: 0px;
  text-decoration: none;
  font-family:sans-serif;

}

body {
  background-image:#34495e;
}

.addBook {
  position:absolute;
  width:400px;
  height:400px;
  padding: 30px, 20px;
  background-color:#FFFFFF;
  text-align:center;
  top:40%;
  left:50%;
  transform: translate(-50%,-50%);
  border-radius: 15px;
}

.addBook h2 {
  text-align: center;
  margin: 30px;
}

.textForm {
  border-bottom: 2px solid #adadad;
  margin: 30px;
  padding: 10px 10px;
}


.id {
  width: 100%;
  border:none;
  outline:none;
  color: #636e72;
  font-size:16px;
  height:25px;
  background: none;
}

.pw {
  width: 100%;
  border:none;
  outline:none;
  color: #636e72;
  font-size:16px;
  height:25px;
  background: none;
}


.btn {
  position:relative;
  left:40%;
  transform: translateX(-50%);
  margin-bottom: 40px;
  width:80%;
  height:40px;
  background: linear-gradient(125deg,#81ecec,#6c5ce7,#81ecec);
  background-position: left;
  background-size: 200%;
  color:white;
  font-weight: bold;
  border:none;
  cursor:pointer;
  transition: 0.4s;
  display:inline;
}

.btn:hover {
  background-position: right;
}
</style>


{%with messages = get_flashed_messages()%}
{%if messages %}
<script type="text/javascript">
  alert("{{messages[-1]}}");
</script>
{%endif%}
{%endwith%}



<head>
    <meta charset="UTF-8">
      <!-- Favicon -->
  <link href="{{ url_for('static', filename='assets/img/11.jpeg') }}" rel="icon" type="image/jpeg">
    <title>
        DCX_E-Commerce
    </title>
</head>
<body>
   <form action="login" method="POST" class="addBook" onsubmit="DoJoinForm__submit(this); return false;">
      <h2>로그인</h2>
      <div class="textForm">
        <input name="id" type="text" class="id" placeholder="아이디" required>
      </div>
      <div class="textForm">
        <input name="pw" type="password" class="pw" placeholder="패스워드" required>
      </div>
      <input type="submit" class="btn" value="로그인"/>
    </form>

</body>
</html>
