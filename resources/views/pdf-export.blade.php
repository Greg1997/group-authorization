<h2>User "{{\Illuminate\Support\Facades\Auth::user()->name}}",  Company <b color="#FF0000">"{{$companyName}}"</b></h2>
<table border="1" cellspacing="3" cellpadding="4">
    <tr bgcolor="#FF0000">
        <th>Name</th>
        <th>Parent</th>
    </tr>
    @foreach($children as $child)
        <tr>
            <td>{{$child['name']}}</td>
            <td>{{$child['parentName']}}</td>
        </tr>
        @each('children', $child['children'], 'child')
    @endforeach
</table>
