<!DOCTYPE html>
<html>
<head>

<style>
.flex{
  display:flex;
}

.scroll{
    width: 1000px;
    padding: 0px 13px 0px 13px;
    overflow-y: scroll;
    height: 600px;
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
  left:35%;
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


  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
    <style>
    .search-bar {
      width: 500px;
    }
  </style>
    <meta charset="UTF-8">
    <script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

</head>


<script type="text/javascript">
    var books = {{data}};
    var list_data = [];
    document.addEventListener("DOMContentLoaded", function(){
        if(books != ""){
            for(idx in books){
                list_data[idx] = books[idx].item_title.trim();
            }
        }
        console.log(list_data);

        $("#searchInput").autocomplete({
            source : list_data,
            select : function(event, ui) {
                console.log(ui.item);
            },
            focus : function(event, ui) {
                return false;
            },
            minLength: 1,
            autoFocus: true,
            classes: {
                "ui-autocomplete": "highlight"
            },
            delay: 100,
//            disabled: true,
            position: { my : "right top", at: "right bottom" },
            close : function(event){
                console.log(event);
            }
        });


        $("#as").on("click",function(){
            var temp_list = []
            var inner = '';
            var j = 0;
            var word = document.getElementById("searchInput").value;
            for(i in list_data){
                if(list_data[i].includes(word) == true){
                    temp_list[j] = list_data[i];
                    j++;
                }
            }
            if(temp_list.length != 0){
                for(idx in books){
                    if(temp_list.includes(books[idx].item_title)){
                        inner +=  "==================================================";
                        inner +=  "<h6>번호 : " + books[idx].item_code +"</h6>";
                        inner +=  "<h6>장르 : " + books[idx].item_section +"</h6>";
                        inner +=  "<h6>제목 : " + books[idx].item_title +"</h6>";
                        inner +=  "<h6>글쓴이 : " + books[idx].item_writer +"</h6>";
                        inner +=  "<h6>가격 : " + books[idx].item_price +"</h6>";
                    }
                }
            document.getElementById("sc").innerHTML = inner;
            }
        });


        $("#searchInput").keyup(function(event) {
            if (window.event.keyCode == 13) {
                $("#as").click();
            }
        });

    });



</script>

<body>
    <div class="mx-auto mt-5 search-bar input-group mb-3">
      <input id="searchInput" name="search" type="text" class="form-control rounded-pill" placeholder="책 검색">
      <button type="button" id="as" >
        <i class ="fas fa-search fa-2x"></i></button>
      <div class="input-group-append">
      </div>
    </div>


    <form action="#" class="addBook" >
      <div id="sc" class="scroll type1">

      </div>
    </form>

</body>
</html>
