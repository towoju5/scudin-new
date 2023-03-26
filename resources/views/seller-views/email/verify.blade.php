<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <!-- Bootstrap -->
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
      crossorigin="anonymous"
    />
    <!-- font  -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Nunito:ital,wght@0,200;0,300;0,400;0,500;0,700;1,200;1,300;1,400;1,500&display=swap"
      rel="stylesheet"
    />
    <style>
      @import url("https://fonts.googleapis.com/css2?family=Nunito:ital,wght@0,200;0,300;0,400;0,500;0,700;1,200;1,300;1,400;1,500&display=swap");
    </style>

    <link rel="stylesheet" href="{{ asset('new/style.css') }}" />

    <link
      rel="shortcut icon"
      href="./Asset/client3 2.png"
      type="image/x-icon"
    />
    <title>Seller Signup Email Confirmation Redirect Page</title>
  </head>

  <body>
    <section class="plan p-1">
        <div class="container mt-5">
            <h1 class="text-center">How to Sell on Scudin</h1>
            <div class="row my-5 g-5">
                <div class="col-lg-4 col-sm-12">
                    <div class="card ms-lg-auto" style="width: 20rem">
                        <div class="card-header">
                            <h4>Sell with Basic Plan</h4>
                        </div>
                        <ul class="list-group-flush p-4">
                            <li class="list-group-item mt-3">
                                $0.00 / (always), a monthly free plan to get started
                            </li>

                            <li class="list-group-item my-5">Unlimited Products / Month</li>
                            <li class="list-group-item mb-5">
                                For 35 or more units of items sold + additional selling fees
                            </li>
                        </ul>
                        <button class="btn btn1 px-5 m-4">Sell On Scudin</button>
                    </div>
                </div>

                <div class="col-lg-4 col-sm-12">
                    <div class="card mx-lg-auto" style="width: 20rem">
                        <div class="card-header">
                            <h4>Sell with Business Plan</h4>
                        </div>
                        <ul class="list-group-flush p-4">
                            <li class="list-group-item mt-3">
                                $29.99 / Month <br />
                                <span>(Recommended)</span>
                            </li>

                            <li class="list-group-item my-5">Unlimited Products / Month</li>
                            <li class="list-group-item mb-5">
                                For 35 or more units of items sold + additional selling fees
                            </li>
                        </ul>
                        <button class="btn btn1 px-5 m-4">Sell On Scudin</button>
                    </div>
                </div>

                <div class="col-lg-4 col-sm-12">
                    <div class="card me-lg-auto" style="width: 20rem">
                        <div class="card-header">
                            <h4>Sell with Ethos Premium</h4>
                        </div>
                        <ul class="list-group-flush p-4">
                            <li class="list-group-item mt-3">
                                $4,599.99 / Month <br />
                                <span> (for Enterprise)</span>
                            </li>

                            <li class="list-group-item my-5">Unlimited Products / Month</li>
                            <li class="list-group-item">
                                We will handle all the shipping and returns for items weighing
                                20lbs (9.07kg) or less, while you focus on managing your
                                business.
                            </li>
                        </ul>
                        <button class="btn btn1 px-5 m-4">Sell On Scudin</button>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="pick-hub">
        <div class="container">
            <div class="row">
                <h4>Select Product Category</h4>
                <div class="col-lg-6 col-sm-12 text-center">
                    <div class="hub-item">
                        <select name="plan-category" id="select-category" class="form-control form-control-lg">
                            <option selected disabled>Select a Category...</option>
                            @foreach($cats as $cat)
                            <option value="{{ $cat->id }}">{{ $cat->name }}</option>
                            @endforeach
                        </select>
                    </div>
                </div>
            </div>

            <div class="row my-5">
                <div class="col-6 mx-auto">
                    <button class="btn btn1 btn3 my-4">
                        Proceed to Checkout
                    </button>
                </div>
            </div>
        </div>
    </section>