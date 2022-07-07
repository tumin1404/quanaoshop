<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\nhanvien;

class NhanvienController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return nhanvien::all();
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $db = new nhanvien();
        $db->ten_nhanvien=$request->ten_nhanvien;
        $db->gioitinh=$request->gioitinh;
        $db->ngaysinh=$request->ngaysinh;
        $db->quequan=$request->quequan;
        $db->sdt=$request->sdt;
        $db->email=$request->email;
        $db->capbac=$request->capbac;
        $db->save();
        return $db;   
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        return nhanvien::findOrFail($id);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $db = nhanvien::findOrFail($id);
        $db->ten_nhanvien=$request->ten_nhanvien;
        $db->gioitinh=$request->gioitinh;
        $db->ngaysinh=$request->ngaysinh;
        $db->quequan=$request->quequan;
        $db->sdt=$request->sdt;
        $db->email=$request->email;
        $db->capbac=$request->capbac;
        $db->save();
        return $db;       
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        nhanvien::findOrFail($id)->delete();
        return "Deleted";
    }
}
