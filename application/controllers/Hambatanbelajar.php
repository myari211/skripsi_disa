<?php
defined('BASEPATH') or exit('No direct script access allowed');

use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;
use PhpOffice\PhpSpreadsheet\Writer\Xls;
use PhpOffice\PhpSpreadsheet\Writer\Csv;

class HambatanBelajar extends CI_Controller
{
	public function __construct(){
		parent::__construct();
		if (!$this->ion_auth->logged_in()){
			redirect('auth');
		}else if ( !$this->ion_auth->is_admin() && !$this->ion_auth->in_group('guru') ){
			show_error('Hanya Administrator dan guru yang diberi hak untuk mengakses halaman ini, <a href="'.base_url('dashboard').'">Kembali ke menu awal</a>', 403, 'Akses Terlarang');
		}
		$this->load->library(['datatables', 'form_validation']);// Load Library Ignited-Datatables
		$this->load->helper('my');// Load Library Ignited-Datatables
		$this->load->model('Hambatanbelajar_model', 'lo');
		$this->load->model('Ujian_model', 'ujian');
		$this->form_validation->set_error_delimiters('','');
	}

	public function output_json($data, $encode = true)
	{
		if ($encode) $data = json_encode($data);
		$this->output->set_content_type('application/json')->set_output($data);
	}

	public function index()
	{
		$data = [
			'user' => $this->ion_auth->user()->row(),
			'judul'	=> 'Hambatan Belajar',
			'subjudul' => 'Data Hambatan Belajar'
		];
		$this->load->view('_templates/dashboard/_header', $data);
		$this->load->view('hambatanbelajar/data');
		$this->load->view('_templates/dashboard/_footer');
	}

	public function add()
	{
		$data = [
			'user' 		=> $this->ion_auth->user()->row(),
			'judul'		=> 'Tambah Hambatan Belajar',
			'subjudul'	=> 'Tambah Data Hambatan Belajar',
			'banyak'	=> $this->input->post('banyak', true)
		];
		$this->load->view('_templates/dashboard/_header', $data);
		$this->load->view('hambatanbelajar/add');
		$this->load->view('_templates/dashboard/_footer');
	}

	public function data()
	{
		$this->output_json($this->lo->getDataHambatanBelajar(), false);
	}

	public function edit()
	{
		$chk = $this->input->post('checked', true);
		if (!$chk) {
			redirect('hambatanbelajar');
		} else {
			$learningObstacle = $this->lo->getHambatanBelajarById($chk);
			$data = [
				'user' 		=> $this->ion_auth->user()->row(),
				'judul'		=> 'Edit Hambatan Belajar',
				'subjudul'	=> 'Edit Data Hambatan Belajar',
				'hambatan_belajar'	=> $learningObstacle
			];
			$this->load->view('_templates/dashboard/_header', $data);
			$this->load->view('hambatanbelajar/edit');
			$this->load->view('_templates/dashboard/_footer');
		}
	}

	public function save()
	{
		$rows = count($this->input->post('lo', true));
		$mode = $this->input->post('mode', true);
		for ($i = 1; $i <= $rows; $i++) {
			$lo = 'lo[' . $i . ']';
			$this->form_validation->set_rules($lo, 'Hambatan Belajar', 'required');
			$this->form_validation->set_message('required', '{field} Wajib diisi');

			if ($this->form_validation->run() === FALSE) {
				$error[] = [
					$lo => form_error($lo)
				];
				$status = FALSE;
			} else {
				if ($mode == 'add') {
					$insert[] = [
						'lo' => $this->input->post($lo, true)
					];
				} else if ($mode == 'edit') {
					$update[] = array(
						'id'	=> $this->input->post('id[' . $i . ']', true),
						'lo' 	=> $this->input->post($lo, true)
					);
				}
				$status = TRUE;
			}
		}
		if ($status) {
			if ($mode == 'add') {
				$this->lo->create('hambatan_belajar', $insert, true);
				$data['insert']	= $insert;
			} else if ($mode == 'edit') {
				$this->lo->update('hambatan_belajar', $update, 'id', null, true);
				$data['update'] = $update;
			}
		} else {
			if (isset($error)) {
				$data['errors'] = $error;
			}
		}
		$data['status'] = $status;
		$this->output_json($data);
	}

	public function delete()
	{
		$chk = $this->input->post('checked', true);
		if (!$chk) {
			$this->output_json(['status' => false]);
		} else {
			if ($this->lo->delete('hambatan_belajar', $chk, 'id')) {
				$this->output_json(['status' => true, 'total' => count($chk)]);
			}
		}
	}

	public function load_hambatanbelajar()
	{
		$data = $this->lo->getHambatanBelajar();
		$this->output_json($data);
	}
}