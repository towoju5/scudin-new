@extends('layout.master')
@section('title', 'Ethos Accounts')


@section('content')
    <section class="plan p-1">
        <div class="container mt-5">
            <h1 class="text-center">Ethos Plan Subscription</h1>
            <div class="row my-5 g-5">
                {{-- <h1>Current Plan: {{ $curr_plan->plan_name }}</h1> --}}
                @php $activePlanPrice = \App\Subscription::find(auth('customer')->user()->plan_id)->plan_price @endphp
                @forelse($plans as $k => $plan)
                    <div class="col-lg-4 col-sm-12">
                        <div class="card ms-lg-auto">
                            <div class="card-header">
                                <h4>{{ $plan->plan_name }}</h4>
                            </div>
                            <ul class="list-group-flush p-4">
                                <li class="list-group-item mt-3">
                                    <div class="plan-price mt-2 pb-2">
                                        <sup class="font-medium-1 font-weight-bold text-primary"
                                            style="font-size: 20px; font-weight: bold">$</sup>
                                        <span
                                            class="pricing-basic-value font-weight-bolder text-primary h3">{{ number_format($plan->plan_price, 2) }}</span>
                                        <sub class="pricing-duration text-body font-medium-1 font-weight-bold">/
                                            @if ($plan->plan_duration == 30)
                                                {{ __('Monthly') }}
                                            @elseif($plan->plan_duration == 7)
                                                {{ __('Weekly') }}
                                            @elseif($plan->plan_duration == 365 || $plan->plan_duration == 366)
                                                {{ __('Annualy') }}
                                            @elseif($plan->plan_duration == 0)
                                                {{ __('Free for life') }}
                                            @else
                                                {{ $plan->plan_duration }}
                                            @endif
                                        </sub>
                                    </div>
                                </li>

                                <li class="list-group-item my-5">
                                    <ul class="list-group list-group-circle text-left">
                                        <li class="list-group-item">
                                            @if ($plan->allowed_products > 0)
                                                {{ $plan->allowed_products }} Maximum Product(s)
                                            @elseif($plan->allowed_products == -1)
                                                {{ __('Unlimited Products') }}
                                            @endif
                                        </li>
                                        <li class="list-group-item equal">
                                            @if (!empty($plan->description))
                                                {!! $plan->description !!}
                                            @endif
                                        </li>
                                    </ul>
                                </li>
                                <li class="list-group-item mb-5">
                                    For 35 or more units of items sold + additional selling fees
                                </li>
                            </ul>
                            @if (auth('customer')->user()->plan_id == $plan->id)
                                <button class="btn btn-scudin mt-2" disabled>Your current plan</button>
                            @elseif($plan->plan_price < $activePlanPrice)
                                <a href="{{ route('plans.buy', $plan->id) }}">
                                    <button class="btn btn-scudin mt-2 w-100">Downgrade plan</button>
                                </a>
                            @else
                                <a href="{{ route('plans.buy', $plan->id) }}">
                                    <button class="btn btn-scudin mt-2 w-100">Upgrade plan</button>
                                </a>
                            @endif
                        </div>
                    </div>
                @endforeach
            </div>
        </div>
        <div class="mb-5 row"></div>
    </section>
@stop
@push('js')
    <script>
        $("#header2").remove();
        $("#footer-menu").remove();
        $(".brand").remove();
    </script>
@endpush
