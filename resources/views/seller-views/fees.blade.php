@extends('layout.master')

@section('title', 'Sell on Scudin')

@section('content')
    @php $location = userLocation() @endphp
    <div class="pb-5" style="background-color: #f2f2f2">
        <section class="fees">
            <div class="container mt-4">
                <div class="fees-top mt-3 py-3 px-5">
                    <h4>Fees and Pricing</h4>
                    <p>Your location is: {{ $location['cityName'] }}, {{ $location['regionName'] }}, {{ $location['countryName'] }}</p>
                </div>
                <div class="fees-summary p-3 mt-3">
                    <p>Summary and descriptions goes here...</p>
                </div>
    
                <h4 class="fees-explanation mt-3 p-3">
                    Explanation of Category Referral Fees
                </h4>
    
                <table class="fees-table table">
                    <thead>
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">Category</th>
                            <th scope="col">
                                Referral fee % (combination of min + max value)
                            </th>
                            <th scope="col">Referral fee minimum</th>
                        </tr>
                    </thead>
                    <tbody>
                        @php($i = 1)
                        @foreach($cats ?? [] as $cat)
                        <tr>
                            <td scope="row">{{ $i }}</td>
                            <td>{{ $cat->name }}</td>
                            <td>
                                @if($cat->percentage > 0)
                                    {{ $cat->percentage }}%
                                    @if($cat->flat > 0)
                                        {{ " + $". $cat->flat }}
                                    @endif
                                @endif
                            </td>
                            <td>$0.00</td>
                        </tr>
                        @php($i++)
                        @endforeach
                    </tbody>
                </table>
    
                <div class="fees-summary p-3 mt-3">
                    <p>New section of summary and descriptions goes here...</p>
                </div>
    
                <div class="fees-summary p-3 mt-3">
                    <p>New section of summary and descriptions goes here...</p>
                </div>
    
                <div class="fees-summary fees-calculator p-3 mt-3">
                    <p>Insert calculator here</p>
                </div>
            </div>
        </section>
    </div>
@endsection

@push('js')
    <script>
        $(document).ready(function() {
            $('.card .card-body').matchHeight();
        })
    </script>
@endpush
