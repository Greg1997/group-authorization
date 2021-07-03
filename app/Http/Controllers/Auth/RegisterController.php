<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Models\Companies;
use App\Providers\RouteServiceProvider;
use App\Models\User;
use Illuminate\Foundation\Auth\RegistersUsers;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;

class RegisterController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Register Controller
    |--------------------------------------------------------------------------
    |
    | This controller handles the registration of new users as well as their
    | validation and creation. By default this controller uses a trait to
    | provide this functionality without requiring any additional code.
    |
    */

    use RegistersUsers;

    /**
     * Where to redirect users after registration.
     *
     * @var string
     */
    protected $redirectTo = RouteServiceProvider::HOME;

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('guest');
    }

    /**
     * Get a validator for an incoming registration request.
     *
     * @param  array  $data
     * @return \Illuminate\Contracts\Validation\Validator
     */
    protected function validator(array $data)
    {
        return Validator::make($data, [
            'name' => ['required', 'string', 'max:255'],
            'email' => ['required', 'string', 'email', 'max:255', 'unique:users'],
            'password' => ['required', 'string', 'min:8', 'confirmed'],
            'company_name' => ['required']
        ]);
    }

    /**
     * Create a new user instance after a valid registration.
     *
     * @param  array  $data
     * @return \App\Models\User
     */
    protected function create(array $data)
    {

        DB::beginTransaction();

        $companyId = $this->getCompanyId($data);
        $parentData = $this->getParentData($data);

        $userModel = User::create([
            'name' => $data['name'],
            'email' => $data['email'],
            'parent_id' => isset($parentData['parent_id']) ? $parentData['parent_id'] : 0,
            'company_id' => isset($parentData['company_id']) ? $parentData['company_id'] : $companyId,
            'password' => Hash::make($data['password']),
        ]);

        DB::commit();

        return  $userModel;
    }

    private function getCompanyId($data){
        $companyId = null;
        if(isset($data['company_name']) && !empty($data['company_name'])){
            $companyModel = Companies::select('id')->where('name_company', $data['company_name'])->first();
            if(!empty($companyModel)){
                $companyId = $companyModel->id;
            }else{
                $newCompanyModel = Companies::create([
                    'name_company' => $data['company_name'],
                ]);
                $companyId = $newCompanyModel->id;
            }
        }
        return $companyId;
    }

    private function getParentData($data){
        $parentData = [];
        if(isset($data['parent_email']) && !empty($data['parent_email'])){
            $user = User::select('id', 'company_id')->where('email', $data['parent_email'])->first();
            if(!empty($user)){
                $parentData['parent_id'] = $user->id;
                $parentData['company_id'] = $user->company_id;
            }
        }
        return $parentData;
    }
}
