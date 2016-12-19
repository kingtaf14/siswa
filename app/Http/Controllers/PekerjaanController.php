<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Requests;
use App\Http\Requests\PekerjaanRequest;
use App\Pekerjaan;
use Session;

class PekerjaanController extends Controller
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
        $Pekerjaan_list = Pekerjaan::all();
        return view('Pekerjaan.index', compact('Pekerjaan_list'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('Pekerjaan.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(PekerjaanRequest $request)
    {
        Pekerjaan::create($request->all());
        Session::flash('flash_message', 'Data Pekerjaan berhasil disimpan.');
        return redirect('Pekerjaan');
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit(Pekerjaan $Pekerjaan)
    {
        return view('Pekerjaan.edit', compact('Pekerjaan'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Pekerjaan $Pekerjaan, PekerjaanRequest $request)
    {
        $hobi->update($request->all());
        Session::flash('flash_message', 'Data Pekerjaan berhasil diupdate.');
        return redirect('Pekerjaan');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(Pekerjaan $Pekerjaan)
    {
        $Pekerjaan->delete();
        Session::flash('flash_message', 'Data Pekerjaan berhasil dihapus.');
        Session::flash('penting', true);
        return redirect('Pekerjaan');
    }
}
