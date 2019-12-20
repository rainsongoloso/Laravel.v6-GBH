
@extends('admin.app')

@section('content')
<div class="row ">
  <div class="col-md-2 m-auto">
    <a href="#" class="btn btn-primary btn-block add-data-btn" data-toggle="modal" data-target="#addUserModal">
      <i class="fa fa-user-plus"></i> Add Occupant
    </a>
  </div>
</div>

<div class="modal fade" id="assignClientModal">
  <div class="modal-dialog modal-sm">
      <div class="modal-content">
          <div class="modal-header bg-primary text-white">
            <h5 class="modal-title">Add Occupant</h5>
            <button class="close" data-dismiss="modal"><i class="fa fa-close"></i></button>
          </div>
          <div class="modal-body">
          </div> 
      </div>
  </div>
</div>

<div class="modal fade" id="changeRoomModal">
  <div class="modal-dialog modal-sm">
      <div class="modal-content">
          <div class="modal-header bg-success text-white">
            <h5 class="modal-title">Change Room</h5>
            <button class="close" data-dismiss="modal"><i class="fa fa-close"></i></button>
          </div>
          <div class="modal-body">
          </div> 
      </div>
  </div>
</div>

<div class="modal fade" id="availAmenity">
  <div class="modal-dialog modal-sm">
      <div class="modal-content">
          <div class="modal-header bg-primary text-white">
            <h5 class="modal-title">Avail Amenity</h5>
            <button class="close" data-dismiss="modal"><i class="fa fa-close"></i></button>
          </div>
          <div class="modal-body">
          </div> 
      </div>
  </div>
</div>

<div class="modal fade" id="editavailAmenity">
  <div class="modal-dialog modal-sm"> 
      <div class="modal-content">
          <div class="modal-header bg-warning text-white">
            <h5 class="modal-title">Edit Amenity</h5>
            <button class="close" data-dismiss="modal"><i class="fa fa-close"></i></button>
          </div>
          <div class="modal-body">
          </div> 
      </div>
  </div>
</div>

</div>

<!-- Datatable -->
<div class="container-fluid">
  <div class="row">
  <div class="col-md-1"></div>
	<div class="col-md-10 mt-4">
	<h2 class="mb-5">Occupants</h2>         
	    <div class="table-responsive"> 
	        <table class="table table-striped table-bordered" id="occupantsDatatable">
	          <thead class="thead-light">
	            <tr>
	              <th>Id</th>
	              <th>Name</th>
	              <th>Room No.</th>
                <th>Room type</th>
                <th>Amenity Availed</th> 
                <th>Start date</th> 
                <th>End date</th>  
	              <th>Actions</th>
	            </tr>
	          </thead>
	        </table>
	    </div>
	  </div>
    <div class="col-md-1"></div>
</div>
</div>
<hr>
@endsection

@section('scripts')
<script type="text/javascript">
$(function(){
    $('#occupantsDatatable').DataTable({
        bProcessing: true,
        bServerSide: true,
        sServerMethod: "GET",
        ajax:{
            "url":'/admin/occupantsDatatable',
            "type": "GET"
        },
        columns: [
            {data: 'id',      name: 'id'},
            {data: 'name',    name: 'name'},
            {data: 'room_no', name: 'room_no'},
            {data: 'roomType', name: 'roomType'},
            {data: 'amenity', name: 'amenity'},
            {data: 'started', name: 'started'},
            {data: 'end_date', name: 'end_date'},  
            {data: 'action' , name: 'action', orderable: false, searchable: false}
        ]
    });

//call add button
$(document).off('click','.add-data-btn').on('click','.add-data-btn', function(e){
          e.preventDefault();
          var that = this;  
          $("#assignClientModal").modal();            
          $("#assignClientModal .modal-body").load('/admin/assignClient');
        });
//Change room Button
$(document).off('click','.edit-data-btn').on('click','.edit-data-btn', function(e){
          e.preventDefault();
          var that = this;  
            $("#changeRoomModal").modal();            
          $("#changeRoomModal .modal-body").load('/admin/'+that.dataset.id+'/changeRoom', function(res){
          });
        });
//Avail amenity
$(document).off('click','.avail-data-btn').on('click','.avail-data-btn', function(e){
          e.preventDefault();
          var that = this;  
            $("#availAmenity").modal();            
          $("#availAmenity .modal-body").load('/admin/'+that.dataset.id+'/availAmenity', function(res){
          });
        });
//Edit amenities
$(document).off('click','.edita-data-btn').on('click','.edita-data-btn', function(e){
          e.preventDefault();
          var that = this;  
            $("#editavailAmenity").modal();            
          $("#editavailAmenity .modal-body").load('/admin/'+that.dataset.id+'/editAvailAmenity', function(res){
          });
        });

//call Delete Button 
$(document).off('click','.delete-data-btn').on('click','.delete-data-btn', function(e){
          e.preventDefault();
          var that = this; 
                bootbox.confirm({
                  title: "Confirm Delete Data?",
                  className: "del-bootbox",
                  message: "Are you sure you want to leave tenant?",
                  buttons: {
                      confirm: {
                          label: 'Yes',
                          className: 'btn-success'
                      },
                      cancel: {
                          label: 'No',
                          className: 'btn-danger'
                      }
                  },
                  callback: function (result) {
                     if(result){
                      var token = '{{csrf_token()}}'; 
                      $.ajax({
                      url:'/admin/'+that.dataset.id+'/leaveTenant',
                      type: 'post',
                      data: {_method: 'delete', _token :token},
                      success:function(result){
                        $("#occupantsDatatable").DataTable().ajax.url( '/admin/occupantsDatatable' ).load();
                        if(result.success){
                        swal({
                            title: result.msg,
                            icon: "success"
                          });
                        }else{
                        swal({
                            title: result.msg,
                            icon: "error"
                          });
                        }
                      }
                      }); 
                     }
                  }
              });
        });

//Leave Tenant
$(document).off('click','.leave-data-btn').on('click','.leave-data-btn', function(e){
      e.preventDefault();
      var id = $(this).attr('id');
      var that = this; 
            bootbox.confirm({
              title: "Confirm Leave Tenant?",
              className: "del-bootbox",
              message: "Are you sure you want to leave this Tenant?",
              buttons: {
                  confirm: {
                      label: 'Yes',
                      className: 'btn-success'
                  },
                  cancel: {
                      label: 'No',
                      className: 'btn-danger'
                  }
              },
              callback: function (result) {
                 if(result){
                  var token = '{{csrf_token()}}';
                  $.ajax({
                  url:'/admin/'+that.dataset.id+'/leaveTenant',
                  type: 'post',
                  data:{flag: 0, _token : token},
                  success:function(result){
                    $("#occupantsDatatable").DataTable().ajax.url( '/admin/occupantsDatatable').load();
                    if(result.success){
                    swal({
                        title: result.msg,
                        icon: "success"
                      });
                    }else{
                    swal({
                        title: result.msg,
                        icon: "error"
                      });
                    }
                  }
                  }); 
                 }
              }
          });
    });
});


function showTime() {
  var date = new Date(),
      utc = new Date(Date(
        date.getFullYear(),
        date.getMonth(),
        date.getDate(),
        date.getHours(),
        date.getMinutes(),
        date.getSeconds()
      ));

  document.getElementById('time').innerHTML = utc.toLocaleTimeString("en-US", {timeZone: "Asia/Singapore"});
}
setInterval(showTime, 1000);
</script>
@endsection