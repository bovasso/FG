<?php
// Contact : Form
// Vars : $form
echo _open('div#fg_contact_form');

if($sf_user->hasFlash('contact_form_valid'))
{
  echo _tag('p.form_valid', __('Thank you, your contact request has been sent.'));
}

// open the form tag with a dm_contact_form css class
echo $form->open();
?>

<dl>
        <dt class="fg_required_field"><img src="http://www.funnygarbage.com/images/bul011x010asterisk_red.gif" alt="" width="11" height="10"> About:</dt>
        <dd>
		  <?php echo $form['email_category']->field()->help()->error(); ?>
        </dd>
        
        <dt class="fg_required_field"><img src="http://www.funnygarbage.com/images/bul011x010asterisk_red.gif" alt="" width="11" height="10"> Name:</dt>
        <dd>
		<?php echo $form['name']->field()->help()->error(); ?>	
        </dd>
        
        <dt class="fg_required_field"><img src="http://www.funnygarbage.com/images/bul011x010asterisk_red.gif" alt="" width="11" height="10"> Email:</dt>
        <dd>
		  <?php echo $form['email']->field()->help()->error(); ?>
          <p>e.g. johnsmith@aol.com</p>
          <p>We will not share your email address with anyone.</p>
        </dd>

        <dt class="fg_required_field"><img src="http://www.funnygarbage.com/images/bul011x010asterisk_red.gif" alt="" width="11" height="10"> Phone:</dt>
        <dd>
		<?php echo $form['phone']->field()->help()->error(); ?>
        </dd>

		<dt class="fg_required_field"><img src="http://www.funnygarbage.com/images/bul011x010asterisk_red.gif" alt="" width="11" height="10"> Email Subject:</dt>
        <dd>
		<?php echo $form['email_subject']->field()->help()->error(); ?>
        </dd>
        
        <dt class="fg_required_field"><img src="http://www.funnygarbage.com/images/bul011x010asterisk_red.gif" alt="" width="11" height="10"> Message:</dt>
        <dd>
		 <?php echo $form['body']->field()->error(); ?>
          <p>6000 character limit</p>
        </dd>
        
      <!--<dt>&nbsp;</dt>
        <dd><input name="" type="checkbox" value="" /> Please add me to the Funny Garbage Mailing List</dd>-->
        
        <dt>&nbsp;</dt>
        <dd>
		<?php
		// render captcha if enabled
		if($form->isCaptchaEnabled())
		{
		  echo $form['captcha']->label('Captcha', 'for=false')->field()->error();
		}

		echo $form->renderHiddenFields();

		// change the submit button text
		echo _tag('div.submit_wrap', $form->submit(__('Send Message')));

		// close the form tag

		?>
        </dd>
      </dl>
<?php 
echo $form->close();  
echo _close('div#fg_contact_form');
?>


<div id="fg_contact_info">
      <strong>Other ways to reach us:</strong>
      <ul>
        <li>
          <p class="fg_address_blue"><strong>FUNNY GARBAGE</strong> New York Office<br>
          112 Madison Avenue<br>
          4th Floor<br>
          New York, NY 10016<br>
          v: 212.343.2534 &nbsp; f: 212.343.3645</p>
          <a href="http://maps.google.com/maps?f=q&amp;hl=en&amp;q=112+Madison+Avenue,+New+York,+NY+10016&amp;ie=UTF8&amp;z=15&amp;ll=40.745339,-73.985023&amp;spn=0.016387,0.038795&amp;om=1&amp;iwloc=addr" target="_blank"><img src="http://www.funnygarbage.com/images/map355x243fgny.gif" alt="Funny Garbage New York" width="355" height="243" border="0" title="112 Madison Avenue, New York, NY 10016"></a>        </li>
       </ul>
   </div>