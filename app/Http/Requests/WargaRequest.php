<?php

namespace App\Http\Requests;

use App\Http\Requests\Request;

class WargaRequest extends Request
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        // return false;
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        // Cek apakah CREATE atau UPDATE
        if ($this->method() == 'PATCH') {
            $No_KTP_rules    = 'required|string|size:4|unique:Warga,No_KTP,' . $this->get('id');
            $telepon_rules = 'sometimes|numeric|digits_between:10,15|unique:telepon,nomor_telepon,' . $this->get('id') . ',id_Warga';
        } else {
            $No_KTP_rules    = 'required|string|size:4|unique:Warga,No_KTP';
            $telepon_rules = 'sometimes|numeric|digits_between:10,15|unique:telepon,nomor_telepon';
        }

        return [
            'No_KTP'          => $No_KTP_rules,
            'nama_Warga'    => 'required|string|max:30',
            'tanggal_lahir' => 'required|date',
            'jenis_kelamin' => 'required|in:L,P',
            'nomor_telepon' => $telepon_rules,
            'id_No_Rumah'      => 'required',
            'foto'          => 'sometimes|image|max:500|mimes:jpeg,jpg,bmp,png',
        ];
    }
}
