<?php

/**
 * StaffMember form base class.
 *
 * @method StaffMember getObject() Returns the current form's model object
 *
 * @package    Funny Garbgage
 * @subpackage form
 * @author     Anthony Bovasso
 * @version    SVN: $Id$
 */
abstract class BaseStaffMemberForm extends BaseFormDoctrine
{
  public function setup()
  {
    $this->setWidgets(array(
      'id'         => new sfWidgetFormInputHidden(),
      'name'       => new sfWidgetFormInputText(),
      'title'      => new sfWidgetFormInputText(),
      'department' => new sfWidgetFormChoice(array('choices' => array('Design' => 'Design', 'Project Management' => 'Project Management', 'Technology' => 'Technology', 'User Experience Design/IA' => 'User Experience Design/IA'))),
      'bio'        => new sfWidgetFormTextarea(),
      'photo'      => new sfWidgetFormDoctrineChoice(array('model' => $this->getRelatedModelName('Photo'), 'add_empty' => true)),
      'is_active'  => new sfWidgetFormInputCheckbox(),
      'position'   => new sfWidgetFormInputText(),

    ));

    $this->setValidators(array(
      'id'         => new sfValidatorChoice(array('choices' => array($this->getObject()->get('id')), 'empty_value' => $this->getObject()->get('id'), 'required' => false)),
      'name'       => new sfValidatorString(array('max_length' => 255)),
      'title'      => new sfValidatorString(array('max_length' => 255)),
      'department' => new sfValidatorChoice(array('choices' => array(0 => 'Design', 1 => 'Project Management', 2 => 'Technology', 3 => 'User Experience Design/IA'), 'required' => false)),
      'bio'        => new sfValidatorString(array('required' => false)),
      'photo'      => new sfValidatorDoctrineChoice(array('model' => $this->getRelatedModelName('Photo'), 'required' => false)),
      'is_active'  => new sfValidatorBoolean(array('required' => false)),
      'position'   => new sfValidatorInteger(array('required' => false)),
    ));

    /*
     * Embed Media form for photo
     */
    $this->embedForm('photo_form', $this->createMediaFormForPhoto());
    unset($this['photo']);

    $this->widgetSchema->setNameFormat('staff_member[%s]');

    $this->errorSchema = new sfValidatorErrorSchema($this->validatorSchema);

    $this->setupInheritance();

    parent::setup();
    
    // Unset automatic fields like 'created_at', 'updated_at', 'position'
    // override this method in your form to keep them
    parent::unsetAutoFields();
  }

  /**
   * Creates a DmMediaForm instance for photo
   *
   * @return DmMediaForm a form instance for the related media
   */
  protected function createMediaFormForPhoto()
  {
    return DmMediaForRecordForm::factory($this->object, 'photo', 'Photo', $this->validatorSchema['photo']->getOption('required'));
  }

  protected function doBind(array $values)
  {
    $values = $this->filterValuesByEmbeddedMediaForm($values, 'photo');
    parent::doBind($values);
  }
  
  public function processValues($values)
  {
    $values = parent::processValues($values);
    $values = $this->processValuesForEmbeddedMediaForm($values, 'photo');
    return $values;
  }
  
  protected function doUpdateObject($values)
  {
    parent::doUpdateObject($values);
    $this->doUpdateObjectForEmbeddedMediaForm($values, 'photo', 'Photo');
  }

  public function getModelName()
  {
    return 'StaffMember';
  }

}