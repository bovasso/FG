<?php

/**
 * JobApplication form base class.
 *
 * @method JobApplication getObject() Returns the current form's model object
 *
 * @package    Funny Garbgage
 * @subpackage form
 * @author     Anthony Bovasso
 * @version    SVN: $Id$
 */
abstract class BaseJobApplicationForm extends BaseFormDoctrine
{
  public function setup()
  {
    $this->setWidgets(array(
      'id'              => new sfWidgetFormInputHidden(),
      'first_name'      => new sfWidgetFormInputText(),
      'last_name'       => new sfWidgetFormInputText(),
      'job_position_id' => new sfWidgetFormDoctrineChoice(array('model' => $this->getRelatedModelName('JobPosition'), 'add_empty' => false)),
      'address'         => new sfWidgetFormInputText(),
      'city'            => new sfWidgetFormInputText(),
      'state'           => new sfWidgetFormChoice(array('choices' => array('--' => '--', 'AL' => 'AL', 'AZ' => 'AZ', 'AR' => 'AR', 'CA' => 'CA', 'CO' => 'CO', 'CT' => 'CT', 'DE' => 'DE', 'FL' => 'FL', 'GA' => 'GA', 'HI' => 'HI', 'IA' => 'IA', 'ID' => 'ID', 'IL' => 'IL', 'IN' => 'IN', 'KS' => 'KS', 'KY' => 'KY', 'LA' => 'LA', 'MA' => 'MA', 'ME' => 'ME', 'MD' => 'MD', 'MI' => 'MI', 'MN' => 'MN', 'MO' => 'MO', 'MS' => 'MS', 'MT' => 'MT', 'NE' => 'NE', 'NC' => 'NC', 'ND' => 'ND', 'NJ' => 'NJ', 'NM' => 'NM', 'NV' => 'NV', 'NY' => 'NY', 'OH' => 'OH', 'OK' => 'OK', 'OR' => 'OR', 'PA' => 'PA', 'RI' => 'RI', 'SC' => 'SC', 'SD' => 'SD', 'TN' => 'TN', 'TX' => 'TX', 'UT' => 'UT', 'VA' => 'VA', 'VT' => 'VT', 'WA' => 'WA', 'WI' => 'WI', 'WV' => 'WV', 'WY' => 'WY'))),
      'zip'             => new sfWidgetFormInputText(),
      'phone'           => new sfWidgetFormInputText(),
      'email'           => new sfWidgetFormInputText(),
      'website'         => new sfWidgetFormInputText(),
      'resume'          => new sfWidgetFormDoctrineChoice(array('model' => $this->getRelatedModelName('Resume'), 'add_empty' => false)),
      'objective'       => new sfWidgetFormTextarea(),
      'links'           => new sfWidgetFormTextarea(),
      'cover_letter'    => new sfWidgetFormTextarea(),
      'created_at'      => new sfWidgetFormDateTime(),
      'updated_at'      => new sfWidgetFormDateTime(),

    ));

    $this->setValidators(array(
      'id'              => new sfValidatorChoice(array('choices' => array($this->getObject()->get('id')), 'empty_value' => $this->getObject()->get('id'), 'required' => false)),
      'first_name'      => new sfValidatorString(array('max_length' => 255)),
      'last_name'       => new sfValidatorString(array('max_length' => 255)),
      'job_position_id' => new sfValidatorDoctrineChoice(array('model' => $this->getRelatedModelName('JobPosition'))),
      'address'         => new sfValidatorString(array('max_length' => 255)),
      'city'            => new sfValidatorString(array('max_length' => 255)),
      'state'           => new sfValidatorChoice(array('choices' => array(0 => '--', 1 => 'AL', 2 => 'AZ', 3 => 'AR', 4 => 'CA', 5 => 'CO', 6 => 'CT', 7 => 'DE', 8 => 'FL', 9 => 'GA', 10 => 'HI', 11 => 'IA', 12 => 'ID', 13 => 'IL', 14 => 'IN', 15 => 'KS', 16 => 'KY', 17 => 'LA', 18 => 'MA', 19 => 'ME', 20 => 'MD', 21 => 'MI', 22 => 'MN', 23 => 'MO', 24 => 'MS', 25 => 'MT', 26 => 'NE', 27 => 'NC', 28 => 'ND', 29 => 'NJ', 30 => 'NM', 31 => 'NV', 32 => 'NY', 33 => 'OH', 34 => 'OK', 35 => 'OR', 36 => 'PA', 37 => 'RI', 38 => 'SC', 39 => 'SD', 40 => 'TN', 41 => 'TX', 42 => 'UT', 43 => 'VA', 44 => 'VT', 45 => 'WA', 46 => 'WI', 47 => 'WV', 48 => 'WY'))),
      'zip'             => new sfValidatorString(array('max_length' => 255)),
      'phone'           => new sfValidatorString(array('max_length' => 255, 'required' => false)),
      'email'           => new sfValidatorString(array('max_length' => 255)),
      'website'         => new sfValidatorString(array('max_length' => 255)),
      'resume'          => new sfValidatorDoctrineChoice(array('model' => $this->getRelatedModelName('Resume'))),
      'objective'       => new sfValidatorString(array('required' => false)),
      'links'           => new sfValidatorString(array('required' => false)),
      'cover_letter'    => new sfValidatorString(array('required' => false)),
      'created_at'      => new sfValidatorDateTime(),
      'updated_at'      => new sfValidatorDateTime(),
    ));

    /*
     * Embed Media form for resume
     */
    $this->embedForm('resume_form', $this->createMediaFormForResume());
    unset($this['resume']);

    $this->widgetSchema->setNameFormat('job_application[%s]');

    $this->errorSchema = new sfValidatorErrorSchema($this->validatorSchema);

    $this->setupInheritance();

    parent::setup();
    
    // Unset automatic fields like 'created_at', 'updated_at', 'position'
    // override this method in your form to keep them
    parent::unsetAutoFields();
  }

  /**
   * Creates a DmMediaForm instance for resume
   *
   * @return DmMediaForm a form instance for the related media
   */
  protected function createMediaFormForResume()
  {
    return DmMediaForRecordForm::factory($this->object, 'resume', 'Resume', $this->validatorSchema['resume']->getOption('required'));
  }

  protected function doBind(array $values)
  {
    $values = $this->filterValuesByEmbeddedMediaForm($values, 'resume');
    parent::doBind($values);
  }
  
  public function processValues($values)
  {
    $values = parent::processValues($values);
    $values = $this->processValuesForEmbeddedMediaForm($values, 'resume');
    return $values;
  }
  
  protected function doUpdateObject($values)
  {
    parent::doUpdateObject($values);
    $this->doUpdateObjectForEmbeddedMediaForm($values, 'resume', 'Resume');
  }

  public function getModelName()
  {
    return 'JobApplication';
  }

}