<?php

/**
 * JobPosition form base class.
 *
 * @method JobPosition getObject() Returns the current form's model object
 *
 * @package    Funny Garbgage
 * @subpackage form
 * @author     Anthony Bovasso
 * @version    SVN: $Id$
 */
abstract class BaseJobPositionForm extends BaseFormDoctrine
{
  public function setup()
  {
    $this->setWidgets(array(
      'id'               => new sfWidgetFormInputHidden(),
      'name'             => new sfWidgetFormInputText(),
      'department'       => new sfWidgetFormChoice(array('choices' => array('Design' => 'Design', 'Project Management' => 'Project Management', 'Technology' => 'Technology', 'User Experience Design/IA' => 'User Experience Design/IA'))),
      'description'      => new sfWidgetFormTextarea(),
      'qualifications'   => new sfWidgetFormTextarea(),
      'tech_experience'  => new sfWidgetFormTextarea(),
      'additional_areas' => new sfWidgetFormTextarea(),
      'required_skills'  => new sfWidgetFormTextarea(),
      'time_reqs'        => new sfWidgetFormTextarea(),
      'is_active'        => new sfWidgetFormInputCheckbox(),
      'created_at'       => new sfWidgetFormDateTime(),
      'updated_at'       => new sfWidgetFormDateTime(),

    ));

    $this->setValidators(array(
      'id'               => new sfValidatorChoice(array('choices' => array($this->getObject()->get('id')), 'empty_value' => $this->getObject()->get('id'), 'required' => false)),
      'name'             => new sfValidatorString(array('max_length' => 255)),
      'department'       => new sfValidatorChoice(array('choices' => array(0 => 'Design', 1 => 'Project Management', 2 => 'Technology', 3 => 'User Experience Design/IA'), 'required' => false)),
      'description'      => new sfValidatorString(array('required' => false)),
      'qualifications'   => new sfValidatorString(array('required' => false)),
      'tech_experience'  => new sfValidatorString(array('required' => false)),
      'additional_areas' => new sfValidatorString(array('required' => false)),
      'required_skills'  => new sfValidatorString(array('required' => false)),
      'time_reqs'        => new sfValidatorString(array('required' => false)),
      'is_active'        => new sfValidatorBoolean(array('required' => false)),
      'created_at'       => new sfValidatorDateTime(),
      'updated_at'       => new sfValidatorDateTime(),
    ));

    $this->widgetSchema->setNameFormat('job_position[%s]');

    $this->errorSchema = new sfValidatorErrorSchema($this->validatorSchema);

    $this->setupInheritance();

    parent::setup();
    
    // Unset automatic fields like 'created_at', 'updated_at', 'position'
    // override this method in your form to keep them
    parent::unsetAutoFields();
  }


  protected function doBind(array $values)
  {
    parent::doBind($values);
  }
  
  public function processValues($values)
  {
    $values = parent::processValues($values);
    return $values;
  }
  
  protected function doUpdateObject($values)
  {
    parent::doUpdateObject($values);
  }

  public function getModelName()
  {
    return 'JobPosition';
  }

}