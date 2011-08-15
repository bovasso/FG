<?php
/*
 * Render a page.
 * Layout areas and page content area are rendered.
 * 
 * Available vars :
 * - dmFrontPageHelper $helper      ( page_helper service )
 * - boolean           $isEditMode  ( whether the user is allowed to edit page )
 */
?>

<!-- apps/front/modules/dmFront/templates/pageSuccess.php -->
<div id="dm_page" class="page_margins" <?php $isEditMode && print ' class="edit"' ?>>
  <div id="wrapper" class="page">
    
    <?php echo $helper->renderArea('layout.top', '#header.clearfix') ?>

    <div id="dm_layout_center">
	
		<div id="content_wrapper">
	      <?php echo $helper->renderArea('layout.content_top', '#content_top.clearfix') ?>
      
	      <?php echo $helper->renderArea('layout.left' , '#col1.clearfix') ?>
      
	      <?php echo $helper->renderArea('page.content' , '#col3.clearfix') ?><!-- IE Column Clearing -->   
      
	      <?php echo $helper->renderArea('layout.right' , '#col2') ?>
				
				<?php echo $helper->renderArea('layout.leadership_content', '#leadership'); ?>
	
				<?php echo $helper->renderArea('layout.services_content','#services'); ?>
				
				<?php echo $helper->renderArea('layout.history_awards_content','#history'); ?>
				
	    </div><!-- end content //-->

	    <?php echo $helper->renderArea('layout.bottom' , '#footer.clearfix') ?>
		</div>

  	</div>
	
</div><!-- end wrapper //-->







 







 
