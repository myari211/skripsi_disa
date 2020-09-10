<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class HambatanBelajar_model extends CI_Model {

    public function create($table, $data, $batch = false)
    {
        if($batch === false){
            $insert = $this->db->insert($table, $data);
        }else{
            $insert = $this->db->insert_batch($table, $data);
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

    public function delete($table, $data, $pk)
    {
        $this->db->where_in($pk, $data);
        return $this->db->delete($table);
    }

    /**
     * Data Hambatan Belajar
     */

    public function getDataHambatanBelajar()
    {
        $this->datatables->select('id, lo');
        $this->datatables->from('hambatan_belajar');
        $this->datatables->add_column('bulk_select', '<div class="text-center"><input type="checkbox" class="check" name="checked[]" value="$1"/></div>', 'id, lo');
        return $this->datatables->generate();
    }

    public function getHambatanBelajarById($id)
    {
        $this->db->where_in('id', $id);
        $this->db->order_by('lo');
        $query = $this->db->get('hambatan_belajar')->result();
        return $query;
    }

    public function getHambatanBelajar()
    {
        $this->db->select('id, lo');
        $this->db->from('tb_soal');
        $this->db->join('hambatan_belajar', 'id_hambatan=id');
        $this->db->order_by('lo', 'ASC');
        $this->db->group_by('id');
        $query = $this->db->get();
        return $query->result();
    }

    public function getAllHambatanBelajar($id = null)
    {
        if($id === null){
            $this->db->order_by('lo', 'ASC');
            return $this->db->get('hambatan_belajar')->result();    
        }else{
            $this->db->select('id_hambatan');
            $this->db->from('tb_soal');
            $this->db->where('id_soal', $id);
            $hambatanbelajar = $this->db->get()->result();
            $id = [];
            foreach ($lo as $l) {
                $id[] = $l->id;
            }
            if($id === []){
                $id = null;
            }
            
            $this->db->select('*');
            $this->db->from('hambatan_belajar');
            $this->db->where_not_in('id', $id);
            $learningObstacle = $this->db->get()->result();
            return $learningObstacle;
        }
    }
}