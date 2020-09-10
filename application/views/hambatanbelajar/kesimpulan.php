<div class="box">
    <div class="box-header with-border">
        <h3 class="box-title"><?=$subjudul?></h3>
        <div class="box-tools pull-right">
            <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
            </button>
        </div>
	</div>
    <div class="box-body">
        <?=form_open('hambatanbelajar/generateLo',array('id'=>'bulk'))?>
        <table id="hambatanbelajar" class="w-100 table table-striped table-bordered table-hover">
            <thead>
                <tr>
                    <th>No.</th>
                    <th>Kesimpulan Hambatan Belajar</th>
					<th class="text-center">
						<input type="checkbox" id="select_all">
					</th>
				</tr>
            </thead>
        </table>
		<?=form_close()?>
    </div>
</div>

<script src="<?=base_url()?>assets/dist/js/app/hambatanbelajar/kesimpulan.js"></script>