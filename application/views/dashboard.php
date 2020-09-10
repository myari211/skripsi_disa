<?php if( $this->ion_auth->is_admin() ) : ?>
<div class="row">
    <?php foreach($info_box as $info) : ?>
    <div class="col-lg-3 col-xs-6">
        <div class="small-box bg-<?=$info->box?>">
        <div class="inner">
            <h3><?=$info->total;?></h3>
            <p><?=$info->title;?></p>
        </div>
        <div class="icon">
            <i class="fa fa-<?=$info->icon?>"></i>
        </div>
        <a href="<?=base_url().strtolower($info->title);?>" class="small-box-footer">
            More info <i class="fa fa-arrow-circle-right"></i>
        </a>
        </div>
    </div>
    <?php endforeach; ?>
</div>

<?php elseif( $this->ion_auth->in_group('guru') ) : ?>

<div class="row">
    <div class="col-sm-4">
        <div class="box box-default">
            <div class="box-header with-border">
                <h3 class="box-title">Informasi Akun</h3>
            </div>
            <table class="table table-hover">
                <tr>
                    <th>Nama</th>
                    <td><?=$guru->nama_guru?></td>
                </tr>
                <tr>
                    <th>NIP</th>
                    <td><?=$guru->nip?></td>
                </tr>
                <tr>
                    <th>Email</th>
                    <td><?=$guru->email?></td>
                </tr>
                <tr>
                    <th>Mata Pelajaran</th>
                    <td><?=$guru->nama_mapel?></td>
                </tr>
                <tr>
                    <th>Daftar Kelas</th>
                    <td>
                        <ol class="pl-4">
                        <?php foreach ($kelas as $k) : ?>
                            <li><?=$k->nama_kelas?></li>
                        <?php endforeach;?>
                        </ol>
                    </td>
                </tr>
            </table>
        </div>
    </div>
    <div class="col-sm-8">
        <div class="box box-solid">
            <div class="box-header bg-purple">
                <h3 class="box-title">Pemberitahuan</h3>
            </div>
            <div class="box-body">
                <p>Selamat Datang di <b>Learning Obstacle Test!</b></p>
                <p><b>Belum Ada Pemberitahuan</b></p>
            </div>
        </div>
    </div>
</div>

<?php else : ?>

<div class="row">
    <div class="col-sm-4">
        <div class="box box-default">
            <div class="box-header with-border">
                <h3 class="box-title">Informasi Akun</h3>
            </div>
            <table class="table table-hover">
                <tr>
                    <th>Nomor Induk</th>
                    <td><?=$siswa->nomor_induk?></td>
                </tr>
                <tr>
                    <th>Nama</th>
                    <td><?=$siswa->nama?></td>
                </tr>
                <tr>
                    <th>Jenis Kelamin</th>
                    <td><?=$siswa->jenis_kelamin === 'L' ? "Laki-laki" : "Perempuan" ;?></td>
                </tr>
                <tr>
                    <th>Email</th>
                    <td><?=$siswa->email?></td>
                </tr>
                <tr>
                    <th>Jurusan</th>
                    <td><?=$siswa->nama_jurusan?></td>
                </tr>
                <tr>
                    <th>Kelas</th>
                    <td><?=$siswa->nama_kelas?></td>
                </tr>
            </table>
        </div>
    </div>
    <div class="col-sm-8">
        <div class="box box-solid">
            <div class="box-header bg-purple">
                <h3 class="box-title">Pemberitahuan</h3>
            </div>
            <div class="box-body">
                <p>Selamat Datang di <b>Learning Obstacle Test!</b></p>
                <p>Yang harus Anda lakukan adalah :<br>
                    1. Silahkan pilih menu <b>Ujian</b>, pilih ujian <b>Pretest Materi Percabangan</b> lalu klik tombol <b>Cetak Hasil</b>.<br>
                    2. Pada lembar <b>Cetak Hasil</b>, lihatlah bagian <b>Hambatan Belajar</b>.<br>
                    3. Klik satu persatu <b>link</b> yang sudah disediakan.<br>
                    4. Apabila sudah selesai mengerjakan link yang sudah disediakan, lalu pilih menu <b>Ujian</b>, lalu pilih ujian <b>Postest Materi Percabangan</b> lalu mintalah token ujian kepada Guru Anda.
                </p>
                <p>Selamat Mengerjakan!</p>
                <p><b>Catatan : </b><br>
                <b>1. Hambatan Belajar</b> (Learning Obstacle) adalah Materi Pembelajaran yang belum Anda kuasai baik itu dikarenakan <b>"Lupa", "Berbeda Dengan Materi Yang Sudah Dipelajari", bahkan "Belum/Tidak Pernah Dipelajari"</b>, sehingga menghambat/mengganggu Anda dalam memahami suatu Materi Pembelajaran.<br>
                <b>2.</b> Perhatikan <b>Peraturan Ujian</b> sebelum memulai <b>Ujian</b>.<br></p>
            </div>
        </div>
    </div>
</div>

<?php endif; ?>