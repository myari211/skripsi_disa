<?php 
// Extend the TCPDF class to create custom Header and Footer
class MYPDF extends TCPDF {
    
    public function Header() {
        $this->SetFont('helvetica', 'B', 18);
        $this->SetY(13);
        $this->Cell(0, 15, 'Hasil Learning Obstacle Test', 0, false, 'C', 0, '', 0, false, 'M', 'M');
    }

    public function Footer() {
        $this->SetY(-15);
        $this->SetFont('helvetica', 'I', 8);
        $this->Cell(0, 10, 'Page '.$this->getAliasNumPage().'/'.$this->getAliasNbPages(), 0, false, 'R', 0, '', 0, false, 'T', 'M');
    }
}

// create new PDF document
$pdf = new MYPDF(PDF_PAGE_ORIENTATION, PDF_UNIT, PDF_PAGE_FORMAT, true, 'UTF-8', false);

// set document information
$pdf->SetCreator(PDF_CREATOR);
$pdf->SetAuthor('Faradissa Nurul');
$pdf->SetTitle('Hasil Learning Obstacle Test');

// set default header data
$pdf->SetHeaderData(PDF_HEADER_LOGO, PDF_HEADER_LOGO_WIDTH, PDF_HEADER_TITLE, PDF_HEADER_STRING);

// set header and footer fonts
$pdf->setHeaderFont(Array(PDF_FONT_NAME_MAIN, '', PDF_FONT_SIZE_MAIN));
$pdf->setFooterFont(Array(PDF_FONT_NAME_DATA, '', PDF_FONT_SIZE_DATA));

// set default monospaced font
$pdf->SetDefaultMonospacedFont(PDF_FONT_MONOSPACED);

// set margins
$pdf->SetMargins(PDF_MARGIN_LEFT, PDF_MARGIN_TOP, PDF_MARGIN_RIGHT);
$pdf->SetHeaderMargin(PDF_MARGIN_HEADER);
$pdf->SetFooterMargin(PDF_MARGIN_FOOTER);

// set auto page breaks
$pdf->SetAutoPageBreak(TRUE, PDF_MARGIN_BOTTOM);

// set image scale factor
$pdf->setImageScale(PDF_IMAGE_SCALE_RATIO);

// set some language-dependent strings (optional)
if (@file_exists(dirname(__FILE__).'/lang/eng.php')) {
    require_once(dirname(__FILE__).'/lang/eng.php');
    $pdf->setLanguageArray($l);
}

// ---------------------------------------------------------

// set font
$pdf->SetFont('helvetica', '', 10);

// add a page
$pdf->AddPage();

print_r($deskripsi_hambatan);

$jmlHam = 1;

foreach ($deskripsi_hambatan as $lo) {
$no[] =$jmlHam;
$row[] = $lo;

$jmlHam++;
}

foreach ($link_hambatan as $link) {
    if (!empty($link)) {
    $links[] = $link;   
    }
}

if (empty($link_hambatan)) {
    $media = "Tidak ada media pembelajaran";
    $userG = "Tidak ada user guide";
} else {
    $media = implode('<br><br>', $links);
    $userG = "http://bit.ly/HaroldAdventureUserGuide";
}

$numb = implode('<br><br>', $no);
$imp = implode('<br><br>', $row);

ob_end_clean();

// create some HTML content
$html = <<<EOD
<p>
Berikut merupakan hasil rekap dari ujian yang telah dilakukan:
</p>
<h2>Data Peserta</h2>
<table id="data-peserta">
    <tr>
        <th>Nomor Induk</th>
        <td>{$siswa->nomor_induk}</td>
    </tr>
    <tr>
        <th>Nama</th>
        <td>{$siswa->nama}</td>
    </tr>
    <tr>
        <th>Kelas</th>
        <td>{$siswa->nama_kelas}</td>
    </tr>
    <tr>
        <th>Jurusan</th>
        <td>{$siswa->nama_jurusan}</td>
    </tr>
</table>
<h2>Data Ujian</h2>
<table id="data-hasil">
    <tr>
        <th>Mata Pelajaran</th>
        <td>{$ujian->nama_mapel}</td>
    </tr>
    <tr>
        <th>Nama Ujian</th>
        <td>{$ujian->nama_ujian}</td>
    </tr>
    <tr>
        <th>Jumlah Soal</th>
        <td>{$ujian->jumlah_soal}</td>
    </tr>
</table>
<h2>Hasil Ujian</h2>
<table>
    <tr>
        <th>Jawab Benar</th>
        <td>{$hasil->jml_benar}</td>
    </tr>
    <tr>
        <th>Jawab Salah</th>
        <td>{$hasil->jml_salah}</td>
    </tr>
    <tr>
        <th>Nilai</th>
        <td>{$hasil->nilai}</td>
    </tr>
</table>
<h2>Media Pembelajaran</h2>
<table>
    <tr>
    <td><a>{$media}</a></td>
    </tr>
    <br>
    <tr><td>User Guide : <a>{$userG}</a></td></tr>
</table>
<h4>Catatan :</h4>
<h5>
Setelah menyelesaikan link yang telah diberikan di atas, silahkan menuju menu <b>Ujian</b> lalu pilih ujian <b>Postest Materi Percabangan</b> lalu kerjakan ujian tersebut.
</h5>
EOD;
// output the HTML content
$pdf->writeHTML($html, true, 0, true, 0);
// reset pointer to the last page
$pdf->lastPage();
// ---------------------------------------------------------

//Close and output PDF document
$pdf->Output($ujian->nama_ujian.'_'.$siswa->nomor_induk.'.pdf', 'I');
