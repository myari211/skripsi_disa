<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Soal_model extends CI_Model {
    
    public function getDataSoal($id, $guru)
    {
        $this->datatables->select('a.id_soal, a.soal, FROM_UNIXTIME(a.created_on) as created_on, FROM_UNIXTIME(a.updated_on) as updated_on, b.nama_mapel, c.nama_guru, d.lo');
        $this->datatables->from('tb_soal a');
        $this->datatables->join('mapel b', 'b.id_mapel=a.mapel_id');
        $this->datatables->join('guru c', 'c.id_guru=a.guru_id');
        $this->datatables->join('hambatan_belajar d', 'd.id=a.id_hambatan');
        if ($id!==null && $guru===null) {
            $this->datatables->where('a.mapel_id', $id);            
        }else if($id!==null && $guru!==null){
            $this->datatables->where('a.guru_id', $guru);
        }
        return $this->datatables->generate();
    }

    public function getSoalById($id)
    {
        return $this->db->get_where('tb_soal', ['id_soal' => $id])->row();
    }

    public function getMapelGuru($nip)
    {
        $this->db->select('mapel_id, nama_mapel, id_guru, nama_guru');
        $this->db->join('mapel', 'mapel_id=id_mapel');
        $this->db->from('guru')->where('nip', $nip);
        return $this->db->get()->row();
    }

    public function getAllGuru()
    {
        $this->db->select('*');
        $this->db->from('guru a');
        $this->db->join('mapel b', 'a.mapel_id=b.id_mapel');
        return $this->db->get()->result();
    }

    public function getAllHambatanBelajar()
    {
        $this->db->select('*');
        $this->db->from('hambatan_belajar');
        return $this->db->get()->result();
    }    

    public function getHambatanBelajarBySoal($id)
    {
        /*SELECT tb_soal.id_hambatan, hambatan_belajar.lo FROM `tb_soal` JOIN hambatan_belajar ON tb_soal.id_hambatan = hambatan_belajar.id WHERE tb_soal.id_soal = 22*/
        $this->db->select('tb_soal.id_hambatan, hambatan_belajar.lo');
        $this->db->join('hambatan_belajar', 'tb_soal.id_hambatan = hambatan_belajar.id');
        $this->db->from('tb_soal')->where('id_soal', $id);
        return $this->db->get()->row();
    }    
}