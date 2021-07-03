@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header">{{ __('Company')}} <b>{{$companyName}}</b></div>

                <div class="card-body">
                    @if (session('status'))
                        <div class="alert alert-success" role="alert">
                            {{ session('status') }}
                        </div>
                    @endif

                    <table class="table">
                        <thead>
                            <tr>
                                <th>Name</th>
                                <th>Parent</th>
                            </tr>
                        </thead>
                        <tbody>
                        @foreach($children as $child)
                            <tr>
                                <td>{{$child['name']}}</td>
                                <td>{{$child['parentName']}}</td>
                            </tr>
                            @each('children', $child['children'], 'child')
                        @endforeach
                        </tbody>
                    </table>

                </div>
            </div>
        </div>
    </div>
</div>
@endsection
