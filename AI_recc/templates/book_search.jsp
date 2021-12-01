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
    background-color: white;
    margin-right: 50px;
}

/* 스크롤바 설정*/
.type1::-webkit-scrollbar{
    width: 6px;
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

  <!-- Favicon -->
  <link href="{{ url_for('static', filename='assets/img/11.jpeg') }}" rel="icon" type="image/jpeg">
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
    <title>
        DCX_E-Commerce
    </title>
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
                        inner +=  "<h5>====================================================================================================================</h5>";
                        inner +=  "<img src='" + books[idx].item_image +"' width='180' height='190' style='float:left';>";
                        inner +=  "<h5 style='text-align: left;'> </h5>";
                        inner +=  "<h5 style='text-align: left; text-indent:10px;'>  번호 : " + books[idx].item_code +"</h5>";
                        inner +=  "<h5 style='text-align: left; text-indent:10px;'>  장르 : " + books[idx].item_section +"</h5>";
                        inner +=  "<h5 style='text-align: left; text-indent:10px;'>  제목 : " + books[idx].item_title +"</h5>";
                        inner +=  "<h5 style='text-align: left; text-indent:10px;'>  글쓴이 : " + books[idx].item_writer +"</h5>";
                        inner +=  "<h5 style='text-align: left; text-indent:10px;'>  가격 : " + books[idx].item_price +"</h5>";
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
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">


<head>
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
      <!-- User -->
      <ul class="nav align-items-center d-md-none">
        <li class="nav-item dropdown">
          <a class="nav-link nav-link-icon" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <i class="ni ni-bell-55"></i>
          </a>
          <div class="dropdown-menu dropdown-menu-arrow dropdown-menu-right" aria-labelledby="navbar-default_dropdown_1">
            <a class="dropdown-item" href="#">Action</a>
            <a class="dropdown-item" href="#">Another action</a>
            <div class="dropdown-divider"></div>
            <a class="dropdown-item" href="#">Something else here</a>
          </div>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <div class="media align-items-center">
              <span class="avatar avatar-sm rounded-circle">
                <img alt="Image placeholder" src="{{ url_for('static', filename='assets/img/theme/team-1-800x800.jpg') }}">
">
              </span>
            </div>
          </a>

        </li>
      </ul>
      <!-- Collapse -->
      <div class="collapse navbar-collapse" id="sidenav-collapse-main">
        <!-- Collapse header -->
        <div class="navbar-collapse-header d-md-none">
          <div class="row">
            <div class="col-6 collapse-brand">
              <a href="/main">
                <img src="{{ url_for('static', filename='assets/img/brand/blue.png') }}">
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
            <a class="nav-link   " href="/main">
              <i class="ni ni-tv-2 text-primary"></i> Dashboard
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link " href="/mvadd">
              <i class="ni ni-planet text-blue"></i>     Add book
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link " href="/mvdel">
              <i class="ni ni-planet text-red"></i>     Delete book
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link active" href="/mvser">
              <i class="ni ni-planet text-green"></i> Search book
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link " href="{{ url_for('static', filename='examples/profile.html') }}">
              <i class="ni ni-single-02 text-yellow"></i> Search user
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
    <div class="mx-auto mt-5 search-bar input-group mb-3" style="position: absolute; top:5%; left:35%;">
      <input id="searchInput" name="search" type="text" class="rounded-pill" placeholder="책 검색" style="width:540px; text-indent:10px;">
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
