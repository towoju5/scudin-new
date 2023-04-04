@extends('layouts.app')

@section('css')
<!-- BEGIN: Page CSS-->
<link rel="stylesheet" type="text/css" href="{{ url('/') }}/app-assets/css/core/menu/menu-types/vertical-menu.min.css">
<link rel="stylesheet" type="text/css" href="{{ url('/') }}/app-assets/css/plugins/forms/form-validation.css">
<link rel="stylesheet" type="text/css" href="{{ url('/') }}/app-assets/css/pages/page-auth.min.css">
<!-- END: Page CSS-->
@endsection

@section('content')
<div class="auth-wrapper auth-v1 px-2">
	<div class="auth-inner py-2">
		<!-- Login v1 -->
		<div class="card mb-0">
			<div class="card-body">
				@php($e_commerce_logo=\App\Model\BusinessSetting::where(['type'=>'company_web_logo'])->first()->value)
				<a href="{{ url('/') }}" class="brand-logo">
					<img src="{{ website_logo() }}" height="50px" alt="">
				</a>

				<h4 class="card-title mb-1 text-center">Forgot your password? 👋</h4>
				<!-- <p class="card-text mb-2">Please sign-in to your account and start the adventure</p> -->
				<div class="center">
					@if(count($errors) > 0 )
					<div class="alert alert-danger alert-dismissible fade show" role="alert">
						<button type="button" class="close" data-dismiss="alert" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<ul class="p-0 m-0" style="list-style: none;">
							@foreach($errors->all() as $error)
							<li>{{$error}}</li>
							@endforeach
						</ul>
					</div>
					@endif
					<!-- </div> -->
				</div>
				<form class="card-body needs-validation" novalidate method="POST" action="{{request('seller.auth.reset-password')}}">
					@csrf
					@honeypot
					<div class="form-group" style="display: none">
						<input type="text" name="reset_token" value="{{$token}}" required>
					</div>

					<div class="form-group">
						<label for="si-password">{{__('New')}} {{__('password')}}</label>
						<div class="password-toggle">
							<input class="form-control" name="password" type="password" id="si-password" required>
							<label class="password-toggle-btn">
								<input class="custom-control-input" type="checkbox"><i class="czi-eye password-toggle-indicator"></i><span class="sr-only">{{__('Show')}} {{__('password')}} </span>
							</label>
							<div class="invalid-feedback">Please provide valid password.</div>
						</div>
					</div>
					<div class="form-group">
						<label for="si-password">{{__('confirm_password')}}</label>
						<div class="password-toggle">
							<input class="form-control" name="confirm_password" type="password" id="si-password" required>
							<label class="password-toggle-btn">
								<input class="custom-control-input" type="checkbox"><i class="czi-eye password-toggle-indicator"></i><span class="sr-only">{{__('Show')}} {{__('password')}} </span>
							</label>
							<div class="invalid-feedback">Please provide valid password.</div>
						</div>
					</div>

					<button class="btn btn-primary" type="submit">Reset password</button>
				</form>
			</div>
		</div>
		<!-- /Login v1 -->
	</div>
</div>
@endsection