<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        Dashboard
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Dashboard</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
      <!-- Small boxes (Stat box) -->
      <div class="row">
        <div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-aqua">
            <div class="inner">
            <fmt:formatDate value="${OrderNewest.date }" pattern="HH:mm" var="fmtTimeOrder"/>
            <fmt:formatDate value="${OrderNewest.date }" pattern="dd/MM/yyyy" var="fmtDateOrder"/>
            <fmt:formatDate value="${OrderNewest.date }" pattern="HH:mm:ss dd/MM/yyyy" var="fmtTimeDateOrder"/>
              <h3>${fmtTimeOrder }<sup style="font-size: 20px">${fmtDateOrder }</sup></h3>
              <p>Newest Order</p>
            </div>
            <div class="icon">
              <i class="ion ion-ios-list-outline"></i>
            </div>
            <a href="" class="small-box-footer" data-toggle="modal" data-target="#modal1">More info <i class="fa fa-arrow-circle-right"></i></a>
          </div>
        </div>
         <!-- Modal Order-->
		  <div class="modal fade" id="modal1" role="dialog">
		    <div class="modal-dialog">
		      <!-- Modal content-->
		      <div class="modal-content">
		        <div class="modal-header">
		          <button type="button" class="close" data-dismiss="modal">&times;</button>
		          <h4 class="modal-title" style="display: inline-block; float: left;">Newest Order</h4>
		          <p style="display: inline-block; float: right;">Date: ${fmtTimeDateOrder} &nbsp;&nbsp;</p>
		        </div>
		        <div class="modal-body">
		          <input type="text" class="form-control" value="Name: ${OrderNewest.name }" readonly style="margin-bottom: 10px"/>
		          <input type="text" class="form-control" value="Email: ${OrderNewest.email }" readonly style="margin-bottom: 10px"/>
		          <input type="text" class="form-control" value="Phone: ${OrderNewest.phone }" readonly style="margin-bottom: 10px"/>
		          <input type="text" class="form-control" value="Address: ${OrderNewest.address }" readonly style="margin-bottom: 10px"/>
		          <textarea style="max-width: 570px; max-height: 200px" rows="7" class="form-control" readonly>Message: ${OrderNewest.message }</textarea>
		        </div>
		        <div class="modal-footer">
		           <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
		        </div>
		      </div>
		    </div>
		  </div>
        <!-- ./col -->
        <div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-green">
            <div class="inner">
            <fmt:formatDate value="${CommentNewest.date }" pattern="HH:mm" var="fmtTimeComment"/>
            <fmt:formatDate value="${CommentNewest.date }" pattern="dd/MM/yyyy" var="fmtDateComment"/>
            <fmt:formatDate value="${CommentNewest.date }" pattern="HH:mm:ss dd/MM/yyyy" var="fmtTimeDateComment"/>
              <h3>${fmtTimeComment}<sup style="font-size: 20px">${fmtDateComment}</sup></h3>
              <p>Newest Comment</p>
            </div>
            <div class="icon">
              <i class="ion ion-chatbubbles"></i>
            </div>
            <a href="" class="small-box-footer" data-toggle="modal" data-target="#modal2">More info <i class="fa fa-arrow-circle-right"></i></a>
          </div>
        </div>
        <!-- Modal Comment-->
		  <div class="modal fade" id="modal2" role="dialog">
		    <div class="modal-dialog">
		      <!-- Modal content-->
		      <div class="modal-content">
		        <div class="modal-header">
		          <button type="button" class="close" data-dismiss="modal">&times;</button>
		          <h4 class="modal-title" style="display: inline-block; float: left;">Newest Comment</h4>
		          <p style="display: inline-block; float: right;">Date: ${fmtTimeDateComment} &nbsp;&nbsp;</p>
		        </div>
		        <div class="modal-body">
		          <input type="text" class="form-control" value="Name: ${CommentNewest.name }" readonly style="margin-bottom: 10px"/>
		          <input type="text" class="form-control" value="Email: ${CommentNewest.email }" readonly style="margin-bottom: 10px"/>
		          <textarea style="max-width: 570px; max-height: 200px" rows="7" class="form-control" readonly>Message: ${CommentNewest.message }</textarea>
		        </div>
		        <div class="modal-footer">
		           <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
		        </div>
		      </div>
		    </div>
		  </div>
        <!-- ./col -->
        <div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-yellow">
            <div class="inner">
            <fmt:formatDate value="${ContactNewest.date }" pattern="HH:mm" var="fmtTimeContact"/>
            <fmt:formatDate value="${ContactNewest.date }" pattern="dd/MM/yyyy" var="fmtDateContact"/>
            <fmt:formatDate value="${ContactNewest.date }" pattern="HH:mm:ss dd/MM/yyyy" var="fmtTimeDateContact"/>
              <h3>${fmtTimeContact}<sup style="font-size: 20px">${fmtDateContact}</sup></h3>
              <p>Newest Contact</p>
            </div>
            <div class="icon">
              <i class="ion ion-ios-email"></i>
            </div>
            <a href="" class="small-box-footer" data-toggle="modal" data-target="#modal3">More info <i class="fa fa-arrow-circle-right"></i></a>
          </div>
        </div>
        <!-- Modal Order-->
		  <div class="modal fade" id="modal3" role="dialog">
		    <div class="modal-dialog">
		      <!-- Modal content-->
		      <div class="modal-content">
		        <div class="modal-header">
		          <button type="button" class="close" data-dismiss="modal">&times;</button>
		          <h4 class="modal-title" style="display: inline-block; float: left;">Newest Contact</h4>
		          <p style="display: inline-block; float: right;">Date: ${fmtTimeDateContact} &nbsp;&nbsp;</p>
		        </div>
		        <div class="modal-body">
		          <input type="text" class="form-control" value="Name: ${ContactNewest.name }" readonly style="margin-bottom: 10px"/>
		          <input type="text" class="form-control" value="Email: ${ContactNewest.email }" readonly style="margin-bottom: 10px"/>
		          <input type="text" class="form-control" value="Phone: ${ContactNewest.subject }" readonly style="margin-bottom: 10px"/>
		          <textarea style="max-width: 570px; max-height: 200px" rows="7" class="form-control" readonly>Message: ${ContactNewest.message }</textarea>
		        </div>
		        <div class="modal-footer">
		           <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
		        </div>
		      </div>
		    </div>
		  </div>
        <!-- ./col -->
        <div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-red">
            <div class="inner">
              <h3>${LaptopNewest.name }</h3>

              <p>Newest Laptop</p>
            </div>
            <div class="icon">
              <i class="ion ion-laptop"></i>
            </div>
            <a href="" class="small-box-footer" data-toggle="modal" data-target="#modal4">More info <i class="fa fa-arrow-circle-right"></i></a>
          </div>
        </div>
        <!-- Modal Order-->
		  <div class="modal fade" id="modal4" role="dialog">
		    <div class="modal-dialog">
		      <!-- Modal content-->
		      <div class="modal-content">
		        <div class="modal-header">
		          <button type="button" class="close" data-dismiss="modal">&times;</button>
		          <h4 class="modal-title" style="display: inline-block; float: left;">Newest Laptop</h4>
		        </div>
		        <div class="modal-body">
		          <input type="text" class="form-control" value="Name: ${LaptopNewest.name }" readonly style="margin-bottom: 10px"/>
		          <input type="text" class="form-control" value="Cpu: ${LaptopNewest.cpu }" readonly style="margin-bottom: 10px"/>
		          <input type="text" class="form-control" value="Ram: ${LaptopNewest.ram }" readonly style="margin-bottom: 10px"/>
		          <input type="text" class="form-control" value="Display: ${LaptopNewest.display }" readonly style="margin-bottom: 10px"/>
		          <input type="text" class="form-control" value="Hdd: ${LaptopNewest.hdd }" readonly style="margin-bottom: 10px"/>
		          <input type="text" class="form-control" value="Graphic: ${LaptopNewest.graphic }" readonly style="margin-bottom: 10px"/>
		          <input type="text" class="form-control" value="Os: ${LaptopNewest.os }" readonly style="margin-bottom: 10px"/>
		          <input type="text" class="form-control" value="Battery: ${LaptopNewest.battery }" readonly style="margin-bottom: 10px"/>
		          <input type="text" class="form-control" value="Weight: ${LaptopNewest.weight }" readonly style="margin-bottom: 10px"/>
		        </div>
		        <div class="modal-footer">
		           <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
		        </div>
		      </div>
		    </div>
		  </div>
        <!-- ./col -->
        <!-- DONUT CHART -->
      </div>
      <div class="row">
        <div class="col-md-6">
          <div class="box box-danger col-lg-6">
            <div class="box-header with-border">
              <h3 class="box-title">Laptop Chart</h3>
				 <input type="hidden" id="dell" value="${laptopDell }"/>
				 <input type="hidden" id="asus" value="${laptopAsus }"/>
				 <input type="hidden" id="hp" value="${laptopHp }"/>
				 <input type="hidden" id="acer" value="${laptopAcer }"/>
				 <input type="hidden" id="lenovo" value="${laptopLenovo }"/>
				 <input type="hidden" id="msi" value="${laptopMsi }"/>
				 <input type="hidden" id="others" value="${laptopOthers }"/>
              <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                </button>
                <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
              </div>
            </div>
            <div class="box-body">
              <canvas id="laptopChart" style="height:250px"></canvas>
            </div>
            <!-- /.box-body -->
          </div>
         </div>
         <div class="col-md-6">
          <div class="box box-danger col-lg-6">
            <div class="box-header with-border">
              <h3 class="box-title">Accessories Chart</h3>
				 <input type="hidden" id="mouse" value="${accessoriesMouse }"/>
				 <input type="hidden" id="keyboard" value="${accessoriesKeyboard }"/>
				 <input type="hidden" id="headphone" value="${accessoriesHeadphone }"/>
				 <input type="hidden" id="others" value="${accessoriesOthers }"/>
              <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                </button>
                <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
              </div>
            </div>
            <div class="box-body">
              <canvas id="accessoriesChart" style="height:250px"></canvas>
            </div>
            <!-- /.box-body -->
          </div>
         </div>
       </div>
      <!-- /.row -->
    </section>
    <!-- /.content -->
<script type="text/javascript">
$(document).ready(function() {
    //-------------
    //- PIE CHART -
    //-------------
    // Get context with jQuery - using jQuery's .get() method.
    var dell = $('#dell').val();
    var asus = $('#asus').val();
    var hp = $('#hp').val();
    var acer = $('#acer').val();
    var lenovo = $('#lenovo').val();
    var msi = $('#msi').val();
    var others = $('#others').val();
    var pieChartCanvas = $("#laptopChart").get(0).getContext("2d");
    var pieChart = new Chart(pieChartCanvas);
    var PieData = [
      {
        value: dell,
        color: "#f56954",
        highlight: "#f56954",
        label: "Dell"
      },
      {
        value: asus,
        color: "#00a65a",
        highlight: "#00a65a",
        label: "Asus"
      },
      {
        value: hp,
        color: "#f39c12",
        highlight: "#f39c12",
        label: "HP"
      },
      {
        value: acer,
        color: "#00c0ef",
        highlight: "#00c0ef",
        label: "Acer"
      },
      {
        value: lenovo,
        color: "#3c8dbc",
        highlight: "#3c8dbc",
        label: "Lenovo"
      },
      {
        value: msi,
        color: "#d2d6de",
        highlight: "#d2d6de",
        label: "MSI"
      },
      {
        value: others,
        color: "#bdff24",
        highlight: "#bdff24",
        label: "Orthers"
        }
    ];
    var pieOptions = {
      //Boolean - Whether we should show a stroke on each segment
      segmentShowStroke: true,
      //String - The colour of each segment stroke
      segmentStrokeColor: "#fff",
      //Number - The width of each segment stroke
      segmentStrokeWidth: 2,
      //Number - The percentage of the chart that we cut out of the middle
      percentageInnerCutout: 50, // This is 0 for Pie charts
      //Number - Amount of animation steps
      animationSteps: 100,
      //String - Animation easing effect
      animationEasing: "easeOutBounce",
      //Boolean - Whether we animate the rotation of the Doughnut
      animateRotate: true,
      //Boolean - Whether we animate scaling the Doughnut from the centre
      animateScale: false,
      //Boolean - whether to make the chart responsive to window resizing
      responsive: true,
      // Boolean - whether to maintain the starting aspect ratio or not when responsive, if set to false, will take up entire container
      maintainAspectRatio: true,
    };
    //Create pie or douhnut chart
    // You can switch between pie and douhnut using the method below.
    pieChart.Doughnut(PieData, pieOptions);
  });
$(document).ready(function() {
    //-------------
    //- PIE CHART -
    //-------------
    // Get context with jQuery - using jQuery's .get() method.
    var mouse = $('#mouse').val();
    var keyboard = $('#keyboard').val();
    var headphone = $('#headphone').val();
    var others = $('#others').val();
    var pieChartCanvas = $("#accessoriesChart").get(0).getContext("2d");
    var pieChart = new Chart(pieChartCanvas);
    var PieData = [
      {
        value: mouse,
        color: "#f56954",
        highlight: "#f56954",
        label: "Mouse"
      },
      {
        value: keyboard,
        color: "#00a65a",
        highlight: "#00a65a",
        label: "Keyboard"
      },
      {
        value: headphone,
        color: "#f39c12",
        highlight: "#f39c12",
        label: "Headphone"
      },
      {
        value: others,
        color: "#bdff24",
        highlight: "#bdff24",
        label: "Orthers"
        }
    ];
    var pieOptions = {
      //Boolean - Whether we should show a stroke on each segment
      segmentShowStroke: true,
      //String - The colour of each segment stroke
      segmentStrokeColor: "#fff",
      //Number - The width of each segment stroke
      segmentStrokeWidth: 2,
      //Number - The percentage of the chart that we cut out of the middle
      percentageInnerCutout: 50, // This is 0 for Pie charts
      //Number - Amount of animation steps
      animationSteps: 100,
      //String - Animation easing effect
      animationEasing: "easeOutBounce",
      //Boolean - Whether we animate the rotation of the Doughnut
      animateRotate: true,
      //Boolean - Whether we animate scaling the Doughnut from the centre
      animateScale: false,
      //Boolean - whether to make the chart responsive to window resizing
      responsive: true,
      // Boolean - whether to maintain the starting aspect ratio or not when responsive, if set to false, will take up entire container
      maintainAspectRatio: true,
    };
    //Create pie or douhnut chart
    // You can switch between pie and douhnut using the method below.
    pieChart.Doughnut(PieData, pieOptions);
  });
</script>