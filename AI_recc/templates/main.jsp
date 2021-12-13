<!DOCTYPE html>
<html lang="kr">


{%with messages = get_flashed_messages()%}
{%if messages %}
<script type="text/javascript">
  alert("{{messages[-1]}}");

</script>
{%endif%}
{%endwith%}

<script type="text/javascript">


    document.addEventListener("DOMContentLoaded", function(){
    countSales();

    // 판매량 집계
    function countSales(){
        fetch("http://3.36.39.51/pay/all")
          .then((response) => response.json())
          .then((data) => charts(Object.keys(data).length));
        }

    function charts(data){

    // 차트
    var ctx = document.getElementById('orders');


    var myChart = new Chart(ctx, {
		type: 'line',
		data: {
			labels: ['11월','12월', '1월', '2월', '3월','4월','5월'],
			datasets: [{
				label: 'Sales',
				data: [32, data, 0, 0, 0, 0, 0, 0],
				backgroundColor: [
					'rgba(255, 99, 132, 0.2)',
					'rgba(54, 162, 235, 0.2)',
					'rgba(255, 206, 86, 0.2)',
					'rgba(75, 192, 192, 0.2)',
					'rgba(153, 102, 255, 0.2)',
					'rgba(255, 159, 64, 0.2)'
				],
				borderColor: [
					'rgba(255, 99, 132, 1)',
					'rgba(54, 162, 235, 1)',
					'rgba(255, 206, 86, 1)',
					'rgba(75, 192, 192, 1)',
					'rgba(153, 102, 255, 1)',
					'rgba(255, 159, 64, 1)'
				],
				borderWidth: 1
			}]
		},
		options: {
			responsive: false,
			scales: {
				yAxes: [{
					ticks: {
						beginAtZero: true
					}
				}]
			},
		}
	});


    }




        var list_data = ['Add book', 'Delete book', 'Search book', 'Search user' ,'Sales' ,'매출', '책 추가', '책 삭제' , '책 검색', '유저 검색'];


        var total_sales = {{sales}};
        var count_book = {{count_book}};
        var count_user = {{count_user}};

        total_sales = total_sales.toLocaleString();
        $("#sales").text(total_sales+" 원");
        $("#count_book").text(count_book +" 권");
        $("#count_user").text(count_user +" 명");



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
            var word = document.getElementById("searchInput").value;
            for(i in list_data){
                if(list_data[i].includes(word) == true){
                    if(list_data[i] == 'Add book' || list_data[i] == '책 추가'){
                        window.location.href='/mvadd';
                    }else if(list_data[i] == 'Delete book' || list_data[i] == '책 삭제'){
                        window.location.href='/mvdel';
                    }else if(list_data[i] == 'Search book' || list_data[i] == '책 검색'){
                        window.location.href='/mvser';
                    }else if(list_data[i] == 'Search User' || list_data[i] == '유저 검색'){
                        window.location.href='/mvusr';
                    }else{
                        window.location.href='/mvsales';
                    }
                }
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
            <a class="nav-link  active " href="/main">
              <i class="ni ni-tv-2 text-primary"></i> Dashboard
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link " href="/mvadd">
              <i class="ni ni-books text-blue"></i>     Add book
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link " href="/mvdel">
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
  <div class="main-content">
    <!-- Navbar -->
    <nav class="navbar navbar-top navbar-expand-md navbar-dark" id="navbar-main">
      <div class="container-fluid">
        <!-- Brand -->
        <a class="h4 mb-0 text-white text-uppercase d-none d-lg-inline-block" href="/main">Dashboard</a>
        <!-- Form -->
        <form class="navbar-search navbar-search-dark form-inline mr-3 d-none d-md-flex ml-lg-auto">
          <div class="form-group mb-0">
            <div class="input-group input-group-alternative">
              <div class="input-group-prepend">
                <span id="as" class="input-group-text"><i class="fas fa-search"></i></span>
              </div>
              <input id="searchInput" class="form-control" placeholder="Search" type="text">
            </div>
          </div>
        </form>

      </div>
    </nav>
    <!-- End Navbar -->
    <!-- Header -->
    <div class="header bg-gradient-primary pb-8 pt-5 pt-md-8">
      <div class="container-fluid">
        <div class="header-body">
          <!-- Card stats -->
          <div class="row">
            <div class="col-xl-3 col-lg-6">
              <div class="card card-stats mb-4 mb-xl-0">
                <div class="card-body">
                  <div class="row">
                    <div class="col">
                    <a href="/mvsales">
                      <h5 class="card-title text-uppercase text-muted mb-0">매출액</h5>

                      <span class="h2 font-weight-bold mb-0" id="sales"></span>
                    </a>
                    </div>
                    <div class="col-auto">
                      <div class="icon icon-shape bg-danger text-white rounded-circle shadow">
                        <i class="fas fa-chart-bar"></i>
                      </div>
                    </div>
                  </div>
                  <p class="mt-3 mb-0 text-muted text-sm">
                    <span class="text-success mr-2"><i class="fa fa-arrow-up"></i> 3.48%</span>
                    <span class="text-nowrap">Reload</span>
                  </p>
                </div>
              </div>
            </div>
            <div class="col-xl-3 col-lg-6">
              <div class="card card-stats mb-4 mb-xl-0">
                <div class="card-body">
                  <div class="row">
                    <div class="col">
                      <h5 class="card-title text-uppercase text-muted mb-0">보유중인 책</h5>
                      <span class="h2 font-weight-bold mb-0" id="count_book"></span>
                    </div>
                    <div class="col-auto">
                      <div class="icon icon-shape bg-warning text-white rounded-circle shadow">
                        <i class="fas fa-chart-pie"></i>
                      </div>
                    </div>
                  </div>
                  <p class="mt-3 mb-0 text-muted text-sm">
                    <span class="text-danger mr-2"><i class="fas fa-arrow-down"></i> 3.48%</span>
                    <span class="text-nowrap">Reload</span>
                  </p>
                </div>
              </div>
            </div>
            <div class="col-xl-3 col-lg-6">
              <div class="card card-stats mb-4 mb-xl-0">
                <div class="card-body">
                  <div class="row">
                    <div class="col">
                      <h5 class="card-title text-uppercase text-muted mb-0">유저수</h5>
                      <span class="h2 font-weight-bold mb-0" id="count_user"></span>
                    </div>
                    <div class="col-auto">
                      <div class="icon icon-shape bg-yellow text-white rounded-circle shadow">
                        <i class="fas fa-users"></i>
                      </div>
                    </div>
                  </div>
                  <p class="mt-3 mb-0 text-muted text-sm">
                    <span class="text-success mr-2"><i class="fas fa-arrow-up"></i> 84.10%</span>
                    <span class="text-nowrap">Reload</span>
                  </p>
                </div>
              </div>
            </div>
            <div class="col-xl-3 col-lg-6">
              <div class="card card-stats mb-4 mb-xl-0">
                <div class="card-body">
                  <div class="row">
                    <div class="col">
                      <h5 class="card-title text-uppercase text-muted mb-0">증감</h5>
                      <span class="h2 font-weight-bold mb-0">49,65 %</span>
                    </div>
                    <div class="col-auto">
                      <div class="icon icon-shape bg-info text-white rounded-circle shadow">
                        <i class="fas fa-percent"></i>
                      </div>
                    </div>
                  </div>
                  <p class="mt-3 mb-0 text-muted text-sm">
                    <span class="text-success mr-2"><i class="fas fa-arrow-up"></i> 12%</span>
                    <span class="text-nowrap">Reload</span>
                  </p>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <div class="container-fluid mt--7">
      <div class="row">
        <div class="col-xl-8 mb-5 mb-xl-0">
          <div class="card shadow">
            <div class="card-header bg-transparent">
              <div class="row align-items-center">
                <div class="col">
                  <h6 class="text-uppercase text-black ls-1 mb-1">상태 update: 2021.12.02</h6>
                  <h2 class="text-black mb-0">Scikit-learn</h2>
                </div>
              </div>
            </div>
              <img src="{{ url_for('static', filename='assets/img/charts.png') }}" alt="Charts" width:10 style="border-radius: 7px;">
          </div>
        </div>
        <div class="col-xl-4">
          <div class="card shadow">
            <div class="card-header bg-transparent">
              <div class="row align-items-center">
                <div class="col">
                  <h6 class="text-uppercase text-muted ls-1 mb-1">월 판매량</h6>
                  <h2 class="mb-0">Monthly orders</h2>
                </div>
              </div>
            </div>
            <div class="card-body">
              <!-- 차아트 -->
                <canvas id="orders" width="440" height="255"></canvas>

            </div>
          </div>
        </div>
      </div>

      </div>
      </div>

  <!--   Core   -->
  <script src="{{ url_for('static', filename='assets/js/plugins/bootstrap/dist/js/bootstrap.bundle.min.js') }}"></script>
  <!--   차트 JS   -->
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.bundle.min.js"></script>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"></script>
  <!--   Argon JS   -->
  <script src="{{ url_for('static', filename='assets/js/argon-dashboard.min.js') }}"></script>
  <script src="https://cdn.trackjs.com/agent/v3/latest/t.js"></script>
  <script>
    window.TrackJS &&
      TrackJS.install({
        token: "ee6fab19c5a04ac1a32a645abde4613a",
        application: "argon-dashboard-free"
      });
  </script>
</body>

</html>