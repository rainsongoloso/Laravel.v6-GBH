@extends('admin.app')

@section('content')

<div class="container">
	<form action="" method=""> 
		<div class="input-group mb-3">
		  <div class="input-group-prepend">
		    <label class="input-group-text" for="inputGroupSelect01">Options</label>
		  </div>
		  <select class="custom-select" id="inputGroupSelect01">
		    <option selected>Choose...</option>
		    <option value="1">One</option>
		    <option value="2">Two</option>
		    <option value="3">Three</option>
		  </select>
		</div>
	</form>	
</div>

@endsection