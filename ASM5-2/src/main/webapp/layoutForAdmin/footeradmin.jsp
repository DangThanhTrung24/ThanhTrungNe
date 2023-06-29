<!-- <footer class="main-footer">
    <strong>Copyright &copy; 2023<a href="https://facebook.com/dangthanhtrung.official">PS23794 Dang Thanh Trung</a>.</strong>
    All rights reserved.
    <div class="float-right d-none d-sm-inline-block">
      <b>Version</b> 3.2.0
    </div>
  </footer> -->

  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Control sidebar content goes here -->
  </aside>
  <!-- /.control-sidebar -->
</div>
<!-- ./wrapper -->












<!-- jQuery -->
<script src="<c:url value='/template/admin/plugins/jquery/jquery.min.js'/>"></script>

<!-- AdminLTE App -->
<script src="<c:url value='/template/admin/dist/js/adminlte.min.js'/>"></script>


<script>
  $(function () {
    $("#example1").DataTable({
      "responsive": true, "lengthChange": false, "autoWidth": false,
      "buttons": ["copy", "csv", "excel", "pdf", "print", "colvis"]
    }).buttons().container().appendTo('#example1_wrapper .col-md-6:eq(0)');
    $('#example2').DataTable({
      "paging": true,
      "lengthChange": false,
      "searching": false,
      "ordering": true,
      "info": true,
      "autoWidth": false,
      "responsive": true,
    });
  });
  
 
  });
</script>