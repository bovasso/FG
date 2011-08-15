<?php

/**
 * DmArea form base class.
 *
 * @method DmArea getObject() Returns the current form's model object
 *
 * @package    Funny Garbgage
 * @subpackage form
 * @author     Anthony Bovasso
 * @version    SVN: $Id$
 */
abstract class BaseDmAreaForm extends BaseFormDoctrine
{
  public function setup()
  {
    $this->setWidgets(array(
      'id'              => new sfWidgetFormInputHidden(),
      'dm_layout_id'    => new sfWidgetFormDoctrineChoice(array('model' => $this->getRelatedModelName('Layout'), 'add_empty' => true)),
      'dm_page_view_id' => new sfWidgetFormDoctrineChoice(array('model' => $this->getRelatedModelName('PageView'), 'add_empty' => true)),
      'type'            => new sfWidgetFormInputText(),

    ));

    $this->setValidators(array(
      'id'              => new sfValidatorChoice(array('choices' => array($this->getObject()->get('id')), 'empty_value' => $this->getObject()->get('id'), 'required' => false)),
      'dm_layout_id'    => new sfValidatorDoctrineChoice(array('model' => $this->getRelatedModelName('Layout'), 'required' => false)),
      'dm_page_view_id' => new sfValidatorDoctrineChoice(array('model' => $this->getRelatedModelName('PageView'), 'required' => false)),
      'type'            => new sfValidatorString(array('max_length' => 255)),
    ));

    $this->widgetSchema->setNameFormat('dm_area[%s]');

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
    return 'DmArea';
  }

}