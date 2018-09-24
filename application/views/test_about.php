 <a href="<?php echo base_url('en'), "/{$page}"; ?>">English</a> || <a href="<?php echo base_url('id'), "/{$page}"; ?>">Indonesia</a>
 <hr />

 <hr />
 <h2><?php echo $this->lang->line('home_menu'); ?></h2>
 <h1><?php echo $this->lang->line('about_menu'); ?></h1>
 <h3><?php echo $this->lang->line('contact_menu') ?></h3>

 <hr />
 
 <?php
 	foreach($article as $row => $value)
 	{
 		echo $value['article_name'] ."<br />";
 	}
 ?>