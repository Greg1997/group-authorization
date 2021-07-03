<tr>
    <td>{{$child['name']}}</td>
    <td>{{$child['parentName']}}</td>
</tr>

@each('children', $child['children'], 'child')
