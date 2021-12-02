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
    height: 210px;
    box-sizing: border-box;
    color: white;
    font-family: 'Nanum Gothic';
    background-color: white;
    margin-right: 50px;
    border-style: solid;
    border-width: 1px;
    border-color: grey;
    border-radius: 20px;
}

/* 스크롤바 설정*/
.type1::-webkit-scrollbar{
    width: 6px;
}

.addBook {
  position:absolute;
  width:400px;
  height:540px;
  padding: 30px, 20px;
  background-color:#FFFFFF;
  text-align:center;
  top:40%;
  left:55%;
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


.btn22 {
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

.btn22:hover {
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
                inner +=  "<h5>==================================<h5>";
                inner +=  "<h5>번호 : " + books[idx].item_code +"</h5>";
                inner +=  "<h5>장르 : " + books[idx].item_section +"</h5>";
                inner +=  "<h5>제목 : " + books[idx].item_title +"</h5>";
                inner +=  "<h5>글쓴이 : " + books[idx].item_writer +"</h5>";
                inner +=  "<h5>가격 : " + books[idx].item_price.toLocaleString(); +"</h5>";

            };

            document.getElementById("sc").innerHTML = inner;
        }

    });



</script>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
  <!-- Favicon -->
  <link href="{{ url_for('static', filename='assets/img/11.jpeg') }}" rel="icon" type="image/jpeg">

<head>
    <title>
        DCX_E-Commerce
    </title>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <!-- Favicon -->
  <link href="{{ url_for('static', filename='assets/img/11.jpeg') }}" rel="icon" type="image/jpeg">
  <!-- Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">
  <!-- Icons -->
  <link href="{{ url_for('static', filename='assets/js/plugins/nucleo/css/nucleo.css') }}"rel="stylesheet" />
  <link href="{{ url_for('static', filename='assets/js/plugins/@fortawesome/fontawesome-free/css/all.min.css') }}" rel="stylesheet" />
  <!-- CSS Files -->
  <link href="{{ url_for('static', filename='assets/css/argon-dashboard.css') }}" rel="stylesheet" />
</head>

<body class="">
  <nav class="navbar navbar-vertical fixed-left navbar-expand-md navbar-light bg-white" id="sidenav-main">
    <div class="container-fluid">
      <!-- Toggler -->
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#sidenav-collapse-main" aria-controls="sidenav-main" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <!-- Brand -->
      <a class="navbar-brand pt-0" href="/main">
        <img src="{{ url_for('static', filename='assets/img/11.jpeg') }}" class="navbar-brand-img" alt="...">
      </a>

      <!-- Collapse -->
      <div class="collapse navbar-collapse" id="sidenav-collapse-main">
        <!-- Collapse header -->
        <div class="navbar-collapse-header d-md-none">
          <div class="row">
            <div class="col-6 collapse-brand">
              <a href="/main">
                <img src="{{ url_for('static', filename='assets/img/11.jpeg') }}">
              </a>
            </div>
            <div class="col-6 collapse-close">
              <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#sidenav-collapse-main" aria-controls="sidenav-main" aria-expanded="false" aria-label="Toggle sidenav">
                <span></span>
                <span></span>
              </button>
            </div>
          </div>
        </div>
        <!-- Navigation -->
        <ul class="navbar-nav">
          <li class="nav-item  active ">
            <a class="nav-link  " href="/main">
              <i class="ni ni-tv-2 text-primary"></i> Dashboard
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link " href="/mvadd">
              <i class="ni ni-books text-blue"></i>     Add book
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link active" href="/mvdel">
              <i class="ni ni-books text-red"></i>     Delete book
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link " href="/mvser">
              <i class="ni ni-books text-info"></i> Search book
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link " href="/mvusr">
              <i class="ni ni-single-02 text-yellow"></i> Search user
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link " href="/mvsales">
              <i class="ni ni-money-coins text-green"></i> Sales
            </a>
          </li>
        </ul>
        <!-- Divider -->
        <hr class="my-3">
        <!-- Heading -->
        <h6 class="navbar-heading text-muted">Developer</h6>
        <!-- Navigation -->
        <ul class="navbar-nav mb-md-3">
          <li class="nav-item">
            <a class="nav-link" href="https://github.com/Kimbeomchul/">
              <i class="ni ni-spaceship"></i> 김범철
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="https://github.com/joohwan812">
              <i class="ni ni-spaceship"></i> 전주환
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="https://github.com/jennkimm">
              <i class="ni ni-spaceship"></i> 김서현
            </a>
          </li>
        </ul>
      </div>
    </div>
  </nav>
   <form action="delete" method="POST" class="addBook shadow" onsubmit="DoJoinForm__submit(this); return false;">
       <h2>책 조회</h2>
      <div id="sc" class="scroll type1">

      </div>
      <h2>책 삭제</h2>
      <div class="textForm">
        <input name="item_code" type="text" class="item_code" placeholder="책 코드" required>
        </input>
       </div>
      <input type="submit" class="btn22" value="등록"/>
    </form>

</body>
</html>
