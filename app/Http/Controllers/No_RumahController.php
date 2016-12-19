<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Requests;
use App\Http\Requests\No_RumahRequest;
use App\No_Rumah;
use Session;

class No_RumahController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $No_Rumah_list = No_Rumah::all();
        return view('No_Rumah/index', compact('No_Rumah_list'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('No_Rumah.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(No_RumahRequest $request)
    {
        No_Rumah::create($request->all());
        Session::flash('flash_message', 'Data No_Rumah berhasil disimpan.');
        return redirect('No_Rumah');
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit(No_Rumah $No_Rumah)
    {
        return view('No_Rumah.edit', compact('No_Rumah'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(No_Rumah $No_Rumah, No_RumahRequest $request)
    {
        $No_Rumah->update($request->all());
        Session::flash('flash_message', 'Data No_Rumah berhasil diupdate.');
        return redirect('No_Rumah');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(No_Rumah $No_Rumah)
    {
        $No_Rumah->delete();
        Session::flash('flash_message', 'Data No_Rumah berhasil dihapus.');
        Session::flash('penting', true);
        return redirect('No_Rumah');
    }
}
