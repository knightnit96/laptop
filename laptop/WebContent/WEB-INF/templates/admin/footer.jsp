<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<footer class="main-footer">
    <div class="pull-right hidden-xs">
      <b>Designed by</b> Nguyễn Hoàng Thuận
    </div>
    <strong>Copyright &copy; 2017-2018 <a href="http://almsaeedstudio.com">Almsaeed Studio</a>.</strong> All rights
    reserved.
  </footer>

  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Create the tabs -->
    <!-- Tab panes -->
    <div class="tab-content">
      <!-- Home tab content -->
      <div id="control-sidebar-home-tab">
      </div>
      <!-- /.tab-pane -->
    </div>
  </aside>
  <!-- /.control-sidebar -->
  <!-- Add the sidebar's background. This div must be placed
       immediately after the control sidebar -->
  
</div>
<!-- ./wrapper -->


<!-- jQuery UI 1.11.4 -->
<script src="${defines.URL_ADMIN}/jquery-ui.min.js"></script>
<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
<script>
  $.widget.bridge('uibutton', $.ui.button);
</script>
<!-- Bootstrap 3.3.6 -->
<script src="${defines.URL_ADMIN}/bootstrap/js/bootstrap.min.js"></script>
<!-- Chartjs -->
<script src="${defines.URL_ADMIN}/plugins/chartjs/Chart.min.js"></script>
<!-- Morris.js charts -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
<script src="${defines.URL_ADMIN}/plugins/morris/morris.min.js"></script>
<!-- Sparkline -->
<script src="${defines.URL_ADMIN}/plugins/sparkline/jquery.sparkline.min.js"></script>
<!-- jQuery Knob Chart -->
<script src="${defines.URL_ADMIN}/plugins/knob/jquery.knob.js"></script>
<!-- daterangepicker -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.11.2/moment.min.js"></script>
<script src="${defines.URL_ADMIN}/plugins/daterangepicker/daterangepicker.js"></script>
<!-- datepicker -->
<script src="${defines.URL_ADMIN}/plugins/datepicker/bootstrap-datepicker.js"></script>
<!-- Bootstrap WYSIHTML5 -->
<script src="${defines.URL_ADMIN}/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
<!-- Slimscroll -->
<script src="${defines.URL_ADMIN}/plugins/slimScroll/jquery.slimscroll.min.js"></script>
<!-- FastClick -->
<script src="${defines.URL_ADMIN}/plugins/fastclick/fastclick.js"></script>
<!-- DataTables -->
<script src="${defines.URL_ADMIN}/plugins/datatables/jquery.dataTables.min.js"></script>
<script src="${defines.URL_ADMIN}/plugins/datatables/dataTables.bootstrap.min.js"></script>
<!-- AdminLTE App -->
<script src="${defines.URL_ADMIN}/dist/js/app.min.js"></script>
<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
<script src="${defines.URL_ADMIN}/dist/js/pages/dashboard.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="${defines.URL_ADMIN}/dist/js/demo3.js"></script>
<script src="${defines.URL_ADMIN}/script.js"></script>
</body>
</html>
