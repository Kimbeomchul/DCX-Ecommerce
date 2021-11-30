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


.item_title {
  width: 100%;
  border:none;
  outline:none;
  color: #636e72;
  font-size:16px;
  height:25px;
  background: none;
}

.item_section {
  width: 100%;
  border:none;
  outline:none;
  color: #636e72;
  font-size:16px;
  height:25px;
  background: none;
}

.item_image {
  width: 100%;
  border:none;
  outline:none;
  color: #636e72;
  font-size:16px;
  height:25px;
  background: none;
}

.item_content {
  width: 100%;
  border:none;
  outline:none;
  color: #636e72;
  font-size:16px;
  height:25px;
  background: none;
}

.item_writer {
  width: 100%;
  border:none;
  outline:none;
  color: #636e72;
  font-size:16px;
  height:25px;
  background: none;
}

.item_price {
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
    <title>
        Flask #2
    </title>
</head>
<body>
   <form action="add" method="POST" class="addBook" onsubmit="DoJoinForm__submit(this); return false;">

      <h2>책 등록</h2>
      <div class="textForm">
        <input name="item_title" type="text" class="item_title" placeholder="제목" required>
        </input>
      </div>
      <div class="textForm">
                <select name="item_section" id ="section" required>
                    <option value="소설">소설</option>
                    <option value="과학">과학</option>
                    <option value="만화">만화</option>
                    <option value="미술">미술</option>
                </select>
      </div>
      <div class="textForm">
        <input name="item_image" type="file" class="item_image" placeholder="이미지" required>
      </div>
       <div class="textForm">
        <input name="item_content" type="text" class="item_content" placeholder="내용" required>
      </div>
      <div class="textForm">
        <input name="item_writer" type="text" class="item_writer" placeholder="글쓴이" required>
      </div>
      <div class="textForm">
        <input name="item_price" type="text" class="item_price" placeholder="가격" required>
      </div>
      <input type="submit" class="btn" value="등록"/>
      <input id="currentDatetime" name="item_date" type="hidden" class="item_date" placeholder="등록일자" required>
    </form>

<script>
  document.getElementById('currentDatetime').value= new Date().toISOString().slice(0, -1);
</script>
</body>
</html>
