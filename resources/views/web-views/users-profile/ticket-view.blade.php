@extends('layout.master')
@section('title', 'Ticket Details')

<style>
  .speech-wrapper {
    padding: 30px 40px;
  }

  .speech-wrapper .bubble {
    /* width: 240px; */
    height: auto;
    display: block;
    background: #f5f5f5;
    border-radius: 4px;
    box-shadow: 2px 8px 5px #000;
    position: relative;
    margin: 0 0 20px 15px;
    margin-bottom: 10px;
  }

  .speech-wrapper .bubble.alt {
    margin: 0 0px 20px 20px;
  }

  .speech-wrapper .bubble .txt {
    padding: 8px 55px 8px 14px;
  }

  .speech-wrapper .bubble .txt .name {
    font-weight: 600;
    font-size: 12px;
    margin: 0 0 4px;
    color: #3498db;
  }

  .speech-wrapper .bubble .txt .name span {
    font-weight: normal;
    color: #b3b3b3;
  }

  .speech-wrapper .bubble .txt .name.alt {
    color: #2ecc71;
  }

  .speech-wrapper .bubble .txt .message {
    font-size: 12px;
    margin: 0;
    color: #2b2b2b;
  }

  .speech-wrapper .bubble .txt .timestamp {
    font-size: 11px;
    position: absolute;
    bottom: 8px;
    right: 10px;
    text-transform: uppercase;
    color: #999;
  }

  .speech-wrapper .bubble .bubble-arrow {
    position: absolute;
    width: 0;
    bottom: 42px;
    left: -16px;
    height: 0;
  }

  .speech-wrapper .bubble .bubble-arrow.alt {
    right: -2px;
    bottom: 40px;
    left: auto;
  }

  .speech-wrapper .bubble .bubble-arrow:after {
    content: "";
    position: absolute;
    border: 0 solid transparent;
    border-top: 9px solid #f5f5f5;
    border-radius: 0 20px 0;
    width: 15px;
    height: 30px;
    transform: rotate(145deg);
  }

  .speech-wrapper .bubble .bubble-arrow.alt:after {
    transform: rotate(45deg) scaleY(-1);
  }
</style>

@section('content')
<div class="container-fluid bg-white" style="padding: 0px 60px;">
  @php $location = userLocation() @endphp
  <div class="row">
    <div class="container d-flex justify-content-between">
      <div class="page-title">
        <h6 class="mt-3">Find what you need here...</h6>
      </div>
      <div class="user-name-info h6 mt-3">
        Your shopping location is: {{ $location['cityName'] }}, {{ $location['regionName'] }}, {{ $location['countryName'] }}
      </div>
    </div>
  </div>
</div>
<section class="main-container mt-5">
  <div class="main container">
    <div class="row">
      @if(count($errors) > 0 )
                  <div class="alert alert-danger alert-dismissible fade show" role="alert">
                     <button type="button" class="close btn btn-scudin" data-dismiss="alert" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                     </button>
                     <ul class="p-0 m-0" style="list-style: none;">
                        @foreach($errors->all() as $error)
                        <li>{{$error}}</li>
                        @endforeach
                     </ul>
                  </div>
                  @endif
      <section class="col-sm-9 col-xs-12">
        <div class="my-account">

          <!--page-title-->
          <!-- BEGIN DASHBOARD-->
          <div class="dashboard p-3 speech-wrapper">
            <div class="row">
              <div class="col-md-3 bg-white pt-2">
                <div class="text-left">
                  <div class="font-size-ms px-3">
                    <div class="font-weight-medium">{{ __('Date Submitted')}}</div>
                    <div class="opacity-60">{{Carbon\Carbon::createFromFormat('Y-m-d H:i:s',$ticket['created_at'])->format('Y-m-d')}}</div>
                  </div>
                  <hr>
                  <div class="font-size-ms px-3">
                    <div class="font-weight-medium">{{ __('Last Updated')}}</div>
                    <div class="opacity-60">{{Carbon\Carbon::createFromFormat('Y-m-d H:i:s',$ticket['updated_at'])->format('Y-m-d')}}</div>
                  </div>
                  <hr>
                  <div class="font-size-ms px-3">
                    <div class="font-weight-medium">{{ __('Type')}}:
                      <span class="opacity-60">{{$ticket['type']}}</span>
                    </div>
                  </div>
                  <hr>
                  <div class="font-size-ms px-3">
                    <div class="font-weight-medium" style="color:black">{{ __('Priority')}}:
                      <span class="badge badge-secondary">{{$ticket['priority']}}</span>
                    </div>
                  </div>
                  <hr>
                  <div class="font-size-ms px-3">
                    <div class="font-weight-medium" style="color: black">{{ __('Status')}}:
                      @if($ticket['status'] == 0)
                      <span class="badge badge-primary">{{ __('open') }}</span>
                      @else
                      <span class="badge badge-secondary">{{$ticket['status']}}</span>
                      @endif
                    </div>
                  </div>
                  <hr>
                </div>
              </div>

              <div class="col-md-9 p-3">
                
                <div class="bubble alt">
                  <div class="txt">
                    <p class="name alt">{{ auth('customer')->user()->phone }}<span> ~ {{ auth('customer')->user()->f_name }}</span></p>
                    <p class="message">{!! $ticket['description'] !!}</p>
                    <span class="timestamp">{{ Carbon\Carbon::createFromTimeStamp(strtotime($ticket['created_at']))->diffForHumans() }}</span>
                  </div>
                  <div class="bubble-arrow alt"></div>
                </div>

                @foreach($ticket->conversations as $conversation)
                {{-- {{dd($conversation)}}--}}
                @if($conversation['customer_message'] == null )
                <div class="bubble">
                    @php($admin=\App\Model\Admin::where('id',$conversation['admin_id'])->first())
                  <div class="txt">
                    <p class="name">{{ $admin->name ?? "N/A"}}</p>
                    <p class="message"><?= $conversation['admin_message'] ?></p>
                    <span class="timestamp">{{ Carbon\Carbon::createFromTimeStamp(strtotime($conversation['updated_at']))->diffForHumans() }}</span>
                  </div>
                  <div class="bubble-arrow"></div>
                </div>
                @endif


                @if($conversation['admin_message'] == null)
                <div class="bubble alt">
                  <div class="txt">
                    <p class="name alt">{{ auth('customer')->user()->phone }}<span> ~ {{ auth('customer')->user()->f_name }}</span></p>
                    <p class="message"><?= $conversation['customer_message'] ?></p>
                    <span class="timestamp">{{ Carbon\Carbon::createFromTimeStamp(strtotime($conversation['created_at']))->diffForHumans() }}</span>
                  </div>
                  <div class="bubble-arrow alt"></div>
                </div>
                @endif
                @endforeach
              </div>
            </div>
          </div>
        </div>
        <div class="panel panel-body" style="padding: 10px;">
          <!-- Leave message-->
          <div class="col-sm-12">
            <h3 class="h5 mt-2 pt-4 pb-2">{{ __('Leave a Message')}}</h3>
            <form class="needs-validation" href="{{route('support-ticket.comment',[$ticket['id']])}}" method="post" novalidate>
              @csrf
              <div class="form-group">
                <textarea class="form-control form-control-lg" name="comment" rows="8" placeholder="Write your message here..." required></textarea>
                <div class="invalid-tooltip">{{ __('Please write the message')}}!</div>
              </div>
              <div class="mt-2 text-end">
                  <button class="btn btn-scudin my-2" type="submit">{{ __('Submit message')}}</button>
              </div>
            </form>
          </div>
        </div>
      </section>
      <!--col-main col-sm-9 wow bounceInUp animated-->
      <aside class="col-right sidebar col-sm-3 col-xs-12 wow bounceInUp animated animated" style="visibility: visible;">
        @include('web-views.users-profile.partials._sidebar')
      </aside>
      <!--col-right sidebar col-sm-3 wow bounceInUp animated-->
    </div>
    <!--row-->
  </div>
  <!--main container-->
</section>
@stop
