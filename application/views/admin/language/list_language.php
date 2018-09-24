<div id="page-wrapper">
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header"><?= $title; ?> List</h1> 
        </div>
    </div>
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading text-right"><button onclick="location.href ='<?= base_url('admin/language/add'); ?>'" type="button" class="btn btn-submit">Add <?= $title; ?></button></div>
                <div class="panel-body">
                    <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                        <thead>
                            <tr>
                                <th class="text-center" style="width: 10%;">No</th>
                                <th class="text-center" style="width: 30%;">Language Name</th>
                                <th class="text-center" style="width: 30%;">Lang Name</th>
                                <th class="text-center" style="width: 10%;">Flag</th>
                                <th class="text-center" style="width: 20%;">Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php 
                                foreach($language as $row => $value){ 
                            ?>
                                <tr class="<?= ($value['unique_id'] %2)?'even':'odd'; ?>">
                                    <td class="hidden"><?php echo $row['language_id'] ?></td>
                                    <td><?= $row+1 ?></td>
                                    <td><?= $value['language_name']; ?></td>
                                    <td><?= $value['lang_name']; ?></td>
                                    <td class="text-center"><span class="<?= ($value['flag']==1)?'green-flag':'red-flag'; ?>"></span></td>
                                    <td class="text-center"><button class="btn btn-primary" onclick="location.href='<?= base_url('admin/' .$this->url .'/view/' .$value['language_id']); ?>'">View</button><button class="btn btn-danger confirmation" onclick="deleteItem(<?= $value['language_id']; ?>)">Delete</button></td>
                                </tr>
                            <?php
                                }
                            ?>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
    function deleteItem(id) {

       if(confirm('Are you sure to delete this item?'))
       {
            window.location.href = "<?= base_url(),'admin/' .$this->url .'/delete/' ?>" +id;
       }
       else
       {
        
       }
    }
</script>
<script>
    $(document).ready(function() {
        $('#dataTables-example').DataTable({
            responsive: true
        });
    });
</script>