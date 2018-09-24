<div id="page-wrapper">
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header"><?= $title;  ?></h1> 
        </div>
        <div class="col-lg-12">
            <form action="<?php echo base_url('admin/' .$this->url .'/view'); ?>" name="sectionForm" method="POST" role="form"  enctype="multipart/form-data">
                <div class="panel panel-default">
                    <div class="panel-heading text-right">
                        <button type="submit" class="btn btn-submit">Update</button>
                        <button type="button" class="btn btn-warning" onclick="location.href='javascript:window.history.go(-1);'">Cancel</button>
                    </div>
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-lg-8">
                                <h3>PERSONAL INFORMATION</h3><br />
                                <div class="form-group hidden">
                                    <input type="text" class="form-control" id="id_section" name="id_section" value="<?= $section['section_id']; ?>" />
                                </div>
                                <div class="form-group">
                                    <label for="section">Section Name</label>
                                    <input type="text" class="form-control" id="section" name="name_section" value="<?= $section['section_name']; ?>" />
                                </div>
                                <div class="form-group">
                                    <label for="parent">Parent</label>
                                    <select class="form-control" id="parent" name="parent_section">
                                        <option>-- Select Parent Below It --</option>
                                        <option value="0" <?php echo ($section['section_parent']==0)?'selected':''; ?>>[parent]</option>
                                            <?php 
                                                foreach ($sectionCategory as $key => $value) {
                                            ?>
                                                    <option value="<?= $value['section_id']; ?> " <?php echo ($section['section_parent']==$value['section_id'])?'selected':'' ?>><?= $value['section_name']; ?></option>
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
                                    <input type="radio" class="active-flag" name="flag" value="1" <?php echo($section['flag']==1)?"checked":""; ?> /><label><span class="green-flag"></span>Active</label><br />
                                    <input type="radio" class="inactive-flag" name="flag" value="2" <?php echo($section['flag']==2)?"checked":""; ?> /><label><span class="red-flag"></span>Inactive</label><br />
                                    <input type="radio" class="delete-flag" name="flag" value="3" <?php echo($section['flag']==3)?"checked":""; ?> /><label><span class="black-flag"></span>Delete</label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>