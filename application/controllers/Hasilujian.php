<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class HasilUjian extends CI_Controller {

	public function __construct(){
		parent::__construct();
		if (!$this->ion_auth->logged_in()){
			redirect('auth');
		}
		
		$this->load->library(['datatables']);// Load Library Ignited-Datatables
		$this->load->model('Master_model', 'master');
		$this->load->model('Ujian_model', 'ujian');
		
		$this->user = $this->ion_auth->user()->row();
	}

	public function output_json($data, $encode = true)
	{
		if($encode) $data = json_encode($data);
		$this->output->set_content_type('application/json')->set_output($data);
	}

	public function data()
	{
		$nip_guru = null;
		
		if( $this->ion_auth->in_group('guru') ) {
			$nip_guru = $this->user->username;
		}

		$this->output_json($this->ujian->getHasilUjian($nip_guru), false);
	}

	public function NilaiSiswa($id)
	{
		$this->output_json($this->ujian->HslUjianById($id, true), false);
	}

	public function index()
	{
		$data = [
			'user' => $this->user,
			'judul'	=> 'Ujian',
			'subjudul'=> 'Hasil Ujian',
		];
		$this->load->view('_templates/dashboard/_header.php', $data);
		$this->load->view('ujian/hasil');
		$this->load->view('_templates/dashboard/_footer.php');
	}
	
	public function detail($id)
	{	

		$ujian = $this->ujian->getUjianById($id);
		$nilai = $this->ujian->bandingNilai($id);

		$correct_answer=[];
		$temporari=[];
		$list_jawaban = $this->ujian->getAllHasilById($id);
		
		$id_soal=[];
		$temporari=[
			["id_soal"=>"", "value"=>0]
		];
		foreach ($list_jawaban as $key) {
			array_push($correct_answer, $key->correct_answer);
			array_push($id_soal, $key->list_soal);
		}

		for ($i=0; $i < count($id_soal); $i++) { 
			$soal_id = $id_soal[$i];
			$soal_id = explode(",",$soal_id);
		}

		for ($i=0; $i < count($soal_id); $i++) { 
			$temporari[$i]['id_soal']=$soal_id[$i];
			$temporari[$i]['value']=0;

		}
		
		//print_r($correct_answer);
		//echo "<br>";
		$jmlCorrect = count($correct_answer);
		for ($i=0; $i < $jmlCorrect; $i++) { 
			$temp=$correct_answer[$i];
			$temp = explode(",", $temp);
			for ($j=0; $j < count($temp); $j++) { 
				for ($x=0; $x < count($temporari); $x++) { 
					$cek = $temporari[$x]['value'];
					if ($temporari[$x]['id_soal'] == $temp[$j]) {
						$cek++;
						$temporari[$x]['value'] = $cek;
					}
				}	
			}
		}
		$setjumak = count($list_jawaban) * (50/100);
		$most_obstacle=[];
		
		$jmlTemporari = [];

		for ($i=0; $i < count($temporari); $i++) { 
			if ($temporari[$i]['value'] < $setjumak) {
				$id_hambatan =  $this->ujian->getIdHambatan($temporari[$i]['id_soal']);
				foreach ($id_hambatan as $key ) {
				array_push($most_obstacle, $key->id_hambatan);
				$jmlSiswa = (count($list_jawaban) - $temporari[$i]['value']);
				array_push($jmlTemporari, $jmlSiswa);
				}
			}
		}
		// foreach ($most_obstacle as $key => $value) {
		// 	echo $key['id_hambatan']."<br>";
		// }
		$most_obstacle = implode(",", $most_obstacle);
		//print_r($most_obstacle);
		//foreach ($temporari as $key => $value) {
		//	echo "<br>ID soal : ".$value['id_soal']." yang menjawab Benar :".$value['value'];
		//}

		$d_update = [
			'most_obstacle' => $most_obstacle
		];

		$this->master->update('h_ujian', $d_update, 'ujian_id', $id);

		$obstacle = explode(",",$most_obstacle);
		//echo "<br>";
		//print_r($obstacle);

		$hambatan;
		foreach ($obstacle as $key) {
			$hambatan[] = $this->ujian->getHambatanByMostObstacle($key);
		}
		//echo "<pre>";
		//print_r($hambatan);
		//echo "</pre>";

		//print_r($most_obstacle);

		$data = [
			'user' => $this->user,
			'judul'	=> 'Ujian',
			'subjudul'=> 'Detail Hasil Ujian',
			'ujian'	=> $ujian,
			'nilai'	=> $nilai,
			'hambatan' => $hambatan,
			'jmlTemporari' => $jmlTemporari,
		];

		$this->load->view('_templates/dashboard/_header.php', $data);
		$this->load->view('ujian/detail_hasil');
		$this->load->view('_templates/dashboard/_footer.php');
	}

	public function cetak($id)
	{
		$this->load->library('Pdf');

		$siswa 	= $this->ujian->getIdSiswa($this->user->username);
		$hasil 	= $this->ujian->HslUjian($id, $siswa->id_siswa)->row();
		$ujian 	= $this->ujian->getUjianById($id);
		$lookup_hambatan = $this->ujian->getAllHambatan();
		$most_obstacle = $this->ujian->getMostObstacle($id);

		$obstacle = explode(",",$hasil->most_obstacle);
		$hambatan;
		foreach ($obstacle as $key) {
			$hambatan[] = $this->ujian->getHambatanByMostObstacle($key);
		}

		//$hambatan_siswa = explode(",", $hasil->hambatan_siswa);
		$link_hambatan = [];
		$deskripsi_hambatan = [];
		foreach($obstacle as $value) {
			foreach($lookup_hambatan as $lookup_val) {
				if ((int)$value == $lookup_val->id) {
					array_push($deskripsi_hambatan, $lookup_val->lo);
					array_push($link_hambatan, $lookup_val->link_media);
				}
			}
		}
		
		$data = [
			'ujian' => $ujian,
			'hasil' => $hasil,
			'siswa'	=> $siswa,
			'obstacle'	=> $obstacle,
			'link_hambatan'	=> $link_hambatan,
			'deskripsi_hambatan'	=> $deskripsi_hambatan,
		];
		
		$this->load->view('ujian/cetak', $data);
	}

	public function cetak_detail($id)
	{
		$this->load->library('Pdf');

		$ujian = $this->ujian->getUjianById($id);
		$nilai = $this->ujian->bandingNilai($id);
		$hasil = $this->ujian->HslUjianById($id)->result();

		$data = [
			'ujian'	=> $ujian,
			'nilai'	=> $nilai,
			'hasil'	=> $hasil
		];

		$this->load->view('ujian/cetak_detail', $data);
	}
	
}