<!DOCTYPE html>
<html>
<style>
.flex{
  display:flex;
}

.scroll{
    width: 400px;
    padding: 0px 13px 0px 13px;
    overflow-y: scroll;
    height: 200px;
    box-sizing: border-box;
    color: white;
    font-family: 'Nanum Gothic';
    background-color: rgba(0,0,0,0.8);
    margin-right: 50px;
}

/* 스크롤바 설정*/
.type1::-webkit-scrollbar{
    width: 6px;
}


* {
  margin: 0px;
  padding: 0px;
  text-decoration: none;
  font-family:sans-serif;

}

body {
  background-image: grey;
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


.item_code{
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

<script type="text/javascript">
    document.addEventListener("DOMContentLoaded", function(){
        var books = {{data}};
        var inner = "";

        if(books != ""){
            for(idx in books){
                inner +=  "==================================";
                inner +=  "<h5>번호 : " + books[idx].item_code +"</h5>";
                inner +=  "<h5>장르 : " + books[idx].item_section +"</h5>";
                inner +=  "<h5>제목 : " + books[idx].item_title +"</h5>";
                inner +=  "<h5>글쓴이 : " + books[idx].item_writer +"</h5>";
                inner +=  "<h5>가격 : " + books[idx].item_price +"</h5>";

            };

            document.getElementById("sc").innerHTML = inner;
        }

    });



</script>

<head>
    <meta charset="UTF-8">
    <title>
        Flask #2
    </title>
</head>
<body>
   <form action="delete" method="POST" class="addBook" onsubmit="DoJoinForm__submit(this); return false;">
       <h2>책 조회</h2>
      <div id="sc" class="scroll type1">

      </div>
      <h2>책 삭제</h2>
      <div class="textForm">
        <input name="item_code" type="text" class="item_code" placeholder="책 코드" required>
        </input>
       </div>
      <input type="submit" class="btn" value="등록"/>
    </form>

</body>
</html>
