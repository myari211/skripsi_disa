<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Freq_missed_lo_model extends CI_Model {

	public function getCorrectAnswer($id)
    {
        $this->db->select('correct_answer');
        $this->db->from('freq_missed_lo');
        $this->db->where('soal_id', $id);
        return $this->db->get()->row()->correct_answer;
    }

    public function insertOrUpdate($data, $id_soal)
    {
        $this->db->where('soal_id',$id_soal);
        $query = $this->db->get('freq_missed_lo');
        if ($query->num_rows() > 0){
            $array = array(
                'correct_answer' => $data->correct_answer
            );
            $insert= $this->db->update('freq_missed_lo', $array, "soal_id = $id_soal");
        }
        else{
            $insert= $this->db->insert('freq_missed_lo', $data);
        }
        return $insert;
    }

    public function update($table, $data, $pk, $id = null, $batch = false)
    {
        if($batch === false){
            $insert = $this->db->update($table, $data, array($pk => $id));
        }else{
            $insert = $this->db->update_batch($table, $data, $pk);
        }
        return $insert;
    }
}