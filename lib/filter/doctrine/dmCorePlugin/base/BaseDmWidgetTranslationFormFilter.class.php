<?php

/**
 * DmWidgetTranslation filter form base class.
 *
 * @package    Funny Garbgage
 * @subpackage filter
 * @author     Anthony Bovasso
 * @version    SVN: $Id: sfDoctrineFormFilterGeneratedTemplate.php 24171 2009-11-19 16:37:50Z Kris.Wallsmith $
 */
abstract class BaseDmWidgetTranslationFormFilter extends BaseFormFilterDoctrine
{
  public function setup()
  {
    $this->setWidgets(array(
      'value' => new sfWidgetFormDmFilterInput(),
    ));

    $this->setValidators(array(
      'value' => new sfValidatorPass(array('required' => false)),
    ));
    

    $this->widgetSchema->setNameFormat('dm_widget_translation_filters[%s]');

    $this->errorSchema = new sfValidatorErrorSchema($this->validatorSchema);

    $this->setupInheritance();

    parent::setup();
  }

  public function getModelName()
  {
    return 'DmWidgetTranslation';
  }

  public function getFields()
  {
    return array(
      'id'    => 'Number',
      'value' => 'Text',
      'lang'  => 'Text',
    );
  }
}
