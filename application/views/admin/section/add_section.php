<div id="page-wrapper">
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header"><?= $title;  ?></h1> 
        </div>
        <div class="col-lg-12">
            <form action="<?php echo base_url('admin/' .$this->url .'/add'); ?>" name="sectionForm" method="POST" role="form"  enctype="multipart/form-data">
                <div class="panel panel-default">
                    <div class="panel-heading text-right">
                        <button type="submit" class="btn btn-submit">Submit </button>
                        <button type="button" class="btn btn-warning" onclick="location.href='javascript:window.history.go(-1);'">Cancel</button>
                    </div>
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-lg-8">
                                <h3>PERSONAL INFORMATION</h3><br />
                                <div class="form-group">
                                    <label for="section">Section Name</label>
                                    <input type="text" class="form-control" id="section" name="name_section" />
                                </div>
                                <div class="form-group">
                                    <label for="parent">Parent</label>
                                    <select class="form-control" id="parent" name="parent_section">
                                        <option>-- Select Parent Below It --</option>
                                        <option value="0">[parent]</option>
                                        <?php 
                                            foreach ($sectionCategory as $key => $value) {
                                        ?>
                                                <option value="<?= $value['section_id']; ?> "><?= $value['section_name']; ?></option>
                                        <?php
                                            }
                                        ?>
                                    </select>
                                </div>
                            </div>
                            <div class="col-lg-4">
                                <h3>FLAG</h3><br />
                                <div class='form-group'>
                                    <label for="name_section">Status</label><br />
                                    <input type="radio" class="active-flag" name="flag" value="1" checked="" /><label><span class="green-flag"></span>Active</label><br />
                                    <input type="radio" class="inactive-flag" name="flag" value="2" /><label><span class="red-flag"></span>Inactive</label><br />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>