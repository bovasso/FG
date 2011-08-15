<?php

/**
 * DmContact form base class.
 *
 * @method DmContact getObject() Returns the current form's model object
 *
 * @package    Funny Garbgage
 * @subpackage form
 * @author     Anthony Bovasso
 * @version    SVN: $Id$
 */
abstract class BaseDmContactForm extends BaseFormDoctrine
{
  public function setup()
  {
    $this->setWidgets(array(
      'id'             => new sfWidgetFormInputHidden(),
      'name'           => new sfWidgetFormInputText(),
      'email'          => new sfWidgetFormInputText(),
      'body'           => new sfWidgetFormTextarea(),
      'email_subject'  => new sfWidgetFormInputText(),
      'email_category' => new sfWidgetFormChoice(array('choices' => array('New Business' => 'New Business', 'Original Content' => 'Original Content', 'Other' => 'Other'))),
      'other_desc'     => new sfWidgetFormInputText(),
      'phone'          => new sfWidgetFormInputText(),
      'created_at'     => new sfWidgetFormDateTime(),
      'updated_at'     => new sfWidgetFormDateTime(),

    ));

    $this->setValidators(array(
      'id'             => new sfValidatorChoice(array('choices' => array($this->getObject()->get('id')), 'empty_value' => $this->getObject()->get('id'), 'required' => false)),
      'name'           => new sfValidatorString(array('max_length' => 255)),
      'email'          => new sfValidatorString(array('max_length' => 255)),
      'body'           => new sfValidatorString(),
      'email_subject'  => new sfValidatorString(array('max_length' => 255)),
      'email_category' => new sfValidatorChoice(array('choices' => array(0 => 'New Business', 1 => 'Original Content', 2 => 'Other'), 'required' => false)),
      'other_desc'     => new sfValidatorString(array('max_length' => 255, 'required' => false)),
      'phone'          => new sfValidatorString(array('max_length' => 255)),
      'created_at'     => new sfValidatorDateTime(),
      'updated_at'     => new sfValidatorDateTime(),
    ));

    $this->widgetSchema->setNameFormat('dm_contact[%s]');

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
    return 'DmContact';
  }

}