<!DOCTYPE html>
<html lang="en" style="overflow-x: hidden">

<head>
  <meta charset="UTF-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />

  <!-- Bootstrap -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous" />
  <!-- font  -->
  <link rel="preconnect" href="https://fonts.googleapis.com" />
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
  <link href="https://fonts.googleapis.com/css2?family=Nunito:ital,wght@0,200;0,300;0,400;0,500;0,700;1,200;1,300;1,400;1,500&display=swap" rel="stylesheet" />
  <style>
    @import url("https://fonts.googleapis.com/css2?family=Nunito:ital,wght@0,200;0,300;0,400;0,500;0,700;1,200;1,300;1,400;1,500&display=swap");
 
    .tox-statusbar__branding{
        display:none;
    }
 </style>

  <link rel="stylesheet" href="{{ asset('new/style.css') }}" />

  <link rel="shortcut icon" type="image/x-icon" href="https://scudin.com/storage/app/public/company/1659752973_119.png">
  <title>@yield('title') </title>
  @stack('css')
</head>
@include('layout.head')
<div class="content">
  @yield('content')
</div>
@include('layout.footer')