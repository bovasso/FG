<?php

/**
 * Client form base class.
 *
 * @method Client getObject() Returns the current form's model object
 *
 * @package    Funny Garbgage
 * @subpackage form
 * @author     Anthony Bovasso
 * @version    SVN: $Id$
 */
abstract class BaseClientForm extends BaseFormDoctrine
{
  public function setup()
  {
    $this->setWidgets(array(
      'id'          => new sfWidgetFormInputHidden(),
      'title'       => new sfWidgetFormInputText(),
      'description' => new sfWidgetFormTextarea(),
      'logo'        => new sfWidgetFormDoctrineChoice(array('model' => $this->getRelatedModelName('Logo'), 'add_empty' => true)),
      'is_active'   => new sfWidgetFormInputCheckbox(),
      'position'    => new sfWidgetFormInputText(),

    ));

    $this->setValidators(array(
      'id'          => new sfValidatorChoice(array('choices' => array($this->getObject()->get('id')), 'empty_value' => $this->getObject()->get('id'), 'required' => false)),
      'title'       => new sfValidatorString(array('max_length' => 120)),
      'description' => new sfValidatorString(array('required' => false)),
      'logo'        => new sfValidatorDoctrineChoice(array('model' => $this->getRelatedModelName('Logo'), 'required' => false)),
      'is_active'   => new sfValidatorBoolean(array('required' => false)),
      'position'    => new sfValidatorInteger(array('required' => false)),
    ));

    /*
     * Embed Media form for logo
     */
    $this->embedForm('logo_form', $this->createMediaFormForLogo());
    unset($this['logo']);

    $this->widgetSchema->setNameFormat('client[%s]');

    $this->errorSchema = new sfValidatorErrorSchema($this->validatorSchema);

    $this->setupInheritance();

    parent::setup();
    
    // Unset automatic fields like 'created_at', 'updated_at', 'position'
    // override this method in your form to keep them
    parent::unsetAutoFields();
  }

  /**
   * Creates a DmMediaForm instance for logo
   *
   * @return DmMediaForm a form instance for the related media
   */
  protected function createMediaFormForLogo()
  {
    return DmMediaForRecordForm::factory($this->object, 'logo', 'Logo', $this->validatorSchema['logo']->getOption('required'));
  }

  protected function doBind(array $values)
  {
    $values = $this->filterValuesByEmbeddedMediaForm($values, 'logo');
    parent::doBind($values);
  }
  
  public function processValues($values)
  {
    $values = parent::processValues($values);
    $values = $this->processValuesForEmbeddedMediaForm($values, 'logo');
    return $values;
  }
  
  protected function doUpdateObject($values)
  {
    parent::doUpdateObject($values);
    $this->doUpdateObjectForEmbeddedMediaForm($values, 'logo', 'Logo');
  }

  public function getModelName()
  {
    return 'Client';
  }

}