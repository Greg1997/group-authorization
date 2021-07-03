<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;

class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {
        $children = $this->getAuthChildren();

        $companyName = Auth::user()->company->name_company;

        return view('home', compact('children', 'companyName'));
    }

    private function getAuthChildren(){
        $children = [];
        if (count(Auth::user()->children) > 0) {
            $data = [];
            foreach (Auth::user()->children as $child) {
                $data = $this->getChildren($child, []);
                $children[] = [
                    'name' => $child->name,
                    'parentName' => User::find($child->parent_id)->name,
                    'children' => $data
                ];
            }
        }
        return $children;
    }

    private function getChildren(&$child, $data){

        $result = [];
        if (isset($child->children)) {
            if (count($child->children) > 0) {
                foreach ($child->children as $key =>  $ch) {
                    $data['name'] = $ch->name;
                    $data['parentName'] = User::find($ch->parent_id)->name;
                    $data['children'] = $this->getChildren($ch, $data);
                    $result[] = $data;
                }
            }
        }
        return $result;
    }

    public function createUser()
    {
        return view('create-user');
    }

    public function saveUser(Request $request){
        $request->validate([
            'name' => ['required', 'string', 'max:255'],
            'email' => ['required', 'string', 'email', 'max:255', 'unique:users'],
            'password' => ['required', 'string', 'min:8'],
        ]);
        $data = $request->all();
        DB::beginTransaction();
        User::create([
            'name' => $data['name'],
            'email' => $data['email'],
            'parent_id' => Auth::id(),
            'company_id' =>  Auth::user()->company_id,
            'password' => Hash::make($data['password']),
        ]);
        DB::commit();
        return redirect(route('home'));
    }

    public function exportPdf(){
        $pdf = new \TCPDF(PDF_PAGE_ORIENTATION, PDF_UNIT, PDF_PAGE_FORMAT, true, 'UTF-8', false);

        $pdf->SetTitle(Auth::user()->name);
        $pdf->setImageScale(PDF_IMAGE_SCALE_RATIO);
        $pdf->SetFont('dejavu sans', '', 9);
        $pdf->SetTitle(Auth::user()->name.'.pdf');
        $pdf->AddPage();
        $children = $this->getAuthChildren();
        $companyName = Auth::user()->company->name_company;
        $html = view('pdf-export',compact('children', 'companyName'))->render();

        $pdf->writeHTML($html, true, 0, true, 0);

        $pdf->Output(public_path('/documents/'. Auth::user()->name.'.pdf'), 'I');


    }
}
