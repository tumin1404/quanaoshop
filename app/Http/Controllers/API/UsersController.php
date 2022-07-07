<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\users;

class UsersController extends Controller
{
    public function index()
    {
        $db = users::all();
        return json_encode($db);
    }

    public function Get(){
        return users::all();
    }

    public function store(Request $request)
    {
        $db = new users();
        // $db=$request->all();
        $db->id = $request->id;
        $db->full_name = $request->full_name;
        $db->users_name = $request->users_name;
        $db->email = $request->email;
        $db->password = $request->password;
        $db->phone = $request->phone;
        $db->address = $request->address;
        $db->image = $request->image;
        $db->remember_token = $request->remember_token;
        $db->save();
        return $db;
    }

    public function update(request $request,$id){
        $db = users::findorFail($id);
        $db->full_name = $request->full_name;
        $db->users_name = $request->users_name;
        $db->email = $request->email;
        $db->password = $request->password;
        $db->phone = $request->phone;
        $db->address = $request->address;
        $db->image = $request->image;
        $db->remember_token = $request->remember_token;
        $db->save();
        return $db;
    }

    public function destroy($id){
        users::findOrFail($id)->delete();
        return "Đã xóa";
    }

    public function show($id)
    {
        return users::find($id);
    }
}
