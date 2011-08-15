<?php
if($sf_user->hasFlash('job_application_form_valid'))
{
  echo _tag('p.form_valid', __('Thank you, your contact request has been sent.'));
}

// open the form tag with a dm_contact_form css class
echo $form->open();
?>
				<p class="fg_required_p"><img src="/themeFG/img/bul011x010asterisk_red.gif" alt="Bul011x010asterisk_red" height="10" width="11">Required Fields</p>
				<dl>
        	<dd><?php echo $form['job_position_id']->field()->help()->error(); ?></dd>

        	<dt class="fg_required_field"><img src="/themeFG/img/bul011x010asterisk_red.gif" alt="Bul011x010asterisk_red" height="10" width="11">First Name:</dt>
        	<dd>
						<?php echo $form['first_name']->field()->help()->error(); ?>
        	</dd>

        	<dt class="fg_required_field"><img src="/themeFG/img/bul011x010asterisk_red.gif" alt="Bul011x010asterisk_red" height="10" width="11">Last Name:</dt>
        	<dd>
						<?php echo $form['last_name']->field()->help()->error(); ?>
        	</dd>

        	<dt class="fg_required_field">Resume:</dt>
        	<dd>
						<?php echo $form['resume_form'];?>
						<p>Must be in DOC, RTF or PDF format, max size: 5mb</p>
        	</dd>
        
        	<dt class="fg_required_field"><img src="/themeFG/img/bul011x010asterisk_red.gif" alt="Bul011x010asterisk_red" height="10" width="11">Address:</dt>
        	<dd>
						<?php echo $form['address']->field()->help()->error(); ?>
        	</dd>
        
					<dt class="fg_required_field">City:</dt>
        	<dd>
        		<?php echo $form['city']->field()->help()->error(); ?>
        	</dd>

        	<dt class="fg_required_field"><img src="/themeFG/img/bul011x010asterisk_red.gif" alt="Bul011x010asterisk_red" height="10" width="11">State:</dt>
        	<dd class="fg_form_shortfield">
						<?php echo $form['state']->field()->help()->error(); ?>
        	</dd>

        	<dt class="fg_form_shortfield fg_required_field"><img src="/themeFG/img/bul011x010asterisk_red.gif" alt="Bul011x010asterisk_red" height="10" width="11">ZIP:</dt>
        	<dd class="fg_form_shortfield">
						<?php echo $form['zip']->field()->help()->error(); ?>
        	</dd>
     
        	<dt>Phone:</dt>
        	<dd><?php echo $form['phone']->field()->help()->error(); ?></dd>

        	<dt class="fg_required_field"><img src="/themeFG/img/bul011x010asterisk_red.gif" alt="Bul011x010asterisk_red" height="10" width="11">Email:</dt>
        	<dd>
				 		<?php echo $form['email']->field()->help()->error(); ?>
         		<p>e.g. johnsmith@aol.com</p>
        	</dd>

        	<dt>My Website:</dt>
        	<dd>
        		<?php echo $form['website']->field()->help()->error(); ?>
        	</dd>
        
        	<dt>Career Objective:</dt>
        	<dd>
						<?php echo $form['objective']->field()->help()->error(); ?>
          	<p>6000 character limit</p>
        	</dd>
        
        	<dt>URLs of Online Work:</dt>
        	<dd>
						<?php echo $form['links']->field()->help()->error(); ?>
          	<p>6000 character limit</p>
        	</dd>
        
	        <dt>Cover Letter:</dt>
	        <dd>
						<?php echo $form['cover_letter']->field()->help()->error(); ?>
	          <p>6000 character limit</p>
	        </dd>
        
					<dt>&nbsp;</dt>
	        <dd>
	        	<?php
						echo $form->renderHiddenFields();
						// change the submit button text
						echo _tag('div.submit_wrap', $form->submit(__('Sumbit Application')));
						// close the form tag
						?>
	        </dd>
      </dl>

<?php 
	echo $form->close();

