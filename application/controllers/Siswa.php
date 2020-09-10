<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Siswa extends CI_Controller
{

	public function __construct()
	{
		parent::__construct();
		if (!$this->ion_auth->logged_in()) {
			redirect('auth');
		} else if (!$this->ion_auth->is_admin()) {
			show_error('Hanya Administrator yang diberi hak untuk mengakses halaman ini, <a href="' . base_url('dashboard') . '">Kembali ke menu awal</a>', 403, 'Akses Terlarang');
		}
		$this->load->library(['datatables', 'form_validation']); // Load Library Ignited-Datatables
		$this->load->model('Master_model', 'master');
		$this->form_validation->set_error_delimiters('', '');
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
			'judul'	=> 'Siswa',
			'subjudul' => 'Data Siswa'
		];
		$this->load->view('_templates/dashboard/_header.php', $data);
		$this->load->view('master/siswa/data');
		$this->load->view('_templates/dashboard/_footer.php');
	}

	public function data()
	{
		$this->output_json($this->master->getDataSiswa(), false);
	}

	public function add()
	{
		$data = [
			'user' => $this->ion_auth->user()->row(),
			'judul'	=> 'Siswa',
			'subjudul' => 'Tambah Data Siswa'
		];
		$this->load->view('_templates/dashboard/_header.php', $data);
		$this->load->view('master/siswa/add');
		$this->load->view('_templates/dashboard/_footer.php');
	}

	public function edit($id)
	{
		$siswa = $this->master->getSiswaById($id);
		$data = [
			'user' 		=> $this->ion_auth->user()->row(),
			'judul'		=> 'Siswa',
			'subjudul'	=> 'Edit Data Siswa',
			'jurusan'	=> $this->master->getJurusan(),
			'kelas'		=> $this->master->getKelasByJurusan($siswa->jurusan_id),
			'siswa' => $siswa
		];
		$this->load->view('_templates/dashboard/_header.php', $data);
		$this->load->view('master/siswa/edit');
		$this->load->view('_templates/dashboard/_footer.php');
	}

	public function validasi_siswa($method)
	{
		$id_siswa 	= $this->input->post('id_siswa', true);
		$nomor_induk 			= $this->input->post('nomor_induk', true);
		$email 			= $this->input->post('email', true);
		if ($method == 'add') {
			$u_nomor_induk = '|is_unique[siswa.nomor_induk]';
			$u_email = '|is_unique[siswa.email]';
		} else {
			$dbdata 	= $this->master->getSiswaById($id_siswa);
			$u_nomor_induk		= $dbdata->nomor_induk === $nomor_induk ? "" : "|is_unique[siswa.nomor_induk]";
			$u_email	= $dbdata->email === $email ? "" : "|is_unique[siswa.email]";
		}
		$this->form_validation->set_rules('nomor_induk', 'Nomor Induk', 'required|numeric|trim|min_length[8]|max_length[12]' . $u_nomor_induk);
		$this->form_validation->set_rules('nama', 'Nama', 'required|trim|min_length[3]|max_length[50]');
		$this->form_validation->set_rules('email', 'Email', 'required|trim|valid_email' . $u_email);
		$this->form_validation->set_rules('jenis_kelamin', 'Jenis Kelamin', 'required');
		$this->form_validation->set_rules('jurusan', 'Jurusan', 'required');
		$this->form_validation->set_rules('kelas', 'Kelas', 'required');

		$this->form_validation->set_message('required', 'Kolom {field} wajib diisi');
	}

	public function save()
	{
		$method = $this->input->post('method', true);
		$this->validasi_siswa($method);

		if ($this->form_validation->run() == FALSE) {
			$data = [
				'status'	=> false,
				'errors'	=> [
					'nomor_induk' => form_error('nomor_induk'),
					'nama' => form_error('nama'),
					'email' => form_error('email'),
					'jenis_kelamin' => form_error('jenis_kelamin'),
					'jurusan' => form_error('jurusan'),
					'kelas' => form_error('kelas'),
				]
			];
			$this->output_json($data);
		} else {
			$input = [
				'nomor_induk' 	=> $this->input->post('nomor_induk', true),
				'email' 		=> $this->input->post('email', true),
				'nama' 			=> $this->input->post('nama', true),
				'jenis_kelamin' => $this->input->post('jenis_kelamin', true),
				'kelas_id' 		=> $this->input->post('kelas', true),
			];
			if ($method === 'add') {
				$action = $this->master->create('siswa', $input);
			} else if ($method === 'edit') {
				$id = $this->input->post('id_siswa', true);
				$action = $this->master->update('siswa', $input, 'id_siswa', $id);
			}

			if ($action) {
				$this->output_json(['status' => true]);
			} else {
				$this->output_json(['status' => false]);
			}
		}
	}

	public function delete()
	{
		$chk = $this->input->post('checked', true);
		if (!$chk) {
			$this->output_json(['status' => false]);
		} else {
			if ($this->master->delete('siswa', $chk, 'id_siswa')) {
				$this->output_json(['status' => true, 'total' => count($chk)]);
			}
		}
	}

	public function create_user()
	{
		$id = $this->input->get('id', true);
		$data = $this->master->getSiswaById($id);
		$nama = explode(' ', $data->nama);
		$first_name = $nama[0];
		$last_name = end($nama);

		$username = $data->nomor_induk;
		$password = $data->nomor_induk;
		$email = $data->email;
		$additional_data = [
			'first_name'	=> $first_name,
			'last_name'		=> $last_name
		];
		$group = array('3'); // Sets user to siswa.

		if ($this->ion_auth->username_check($username)) {
			$data = [
				'status' => false,
				'msg'	 => 'Username tidak tersedia (sudah digunakan).'
			];
		} else if ($this->ion_auth->email_check($email)) {
			$data = [
				'status' => false,
				'msg'	 => 'Email tidak tersedia (sudah digunakan).'
			];
		} else {
			$this->ion_auth->register($username, $password, $email, $additional_data, $group);
			$data = [
				'status'	=> true,
				'msg'	 => 'User berhasil dibuat. Nomor Induk digunakan sebagai password pada saat login.'
			];
		}
		$this->output_json($data);
	}
}
