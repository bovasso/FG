<?php

/**
 * DmContact filter form base class.
 *
 * @package    Funny Garbgage
 * @subpackage filter
 * @author     Anthony Bovasso
 * @version    SVN: $Id: sfDoctrineFormFilterGeneratedTemplate.php 24171 2009-11-19 16:37:50Z Kris.Wallsmith $
 */
abstract class BaseDmContactFormFilter extends BaseFormFilterDoctrine
{
  public function setup()
  {
    $this->setWidgets(array(
      'name'           => new sfWidgetFormDmFilterInput(),
      'email'          => new sfWidgetFormDmFilterInput(),
      'body'           => new sfWidgetFormDmFilterInput(),
      'email_subject'  => new sfWidgetFormDmFilterInput(),
      'email_category' => new sfWidgetFormChoice(array('choices' => array('' => '', 'New Business' => 'New Business', 'Original Content' => 'Original Content', 'Other' => 'Other'))),
      'other_desc'     => new sfWidgetFormDmFilterInput(),
      'phone'          => new sfWidgetFormDmFilterInput(),
      'created_at'     => new sfWidgetFormChoice(array('choices' => array(
        ''      => '',
        'today' => $this->getI18n()->__('Today'),
        'week'  => $this->getI18n()->__('Past %number% days', array('%number%' => 7)),
        'month' => $this->getI18n()->__('This month'),
        'year'  => $this->getI18n()->__('This year')
      ))),
      'updated_at'     => new sfWidgetFormChoice(array('choices' => array(
        ''      => '',
        'today' => $this->getI18n()->__('Today'),
        'week'  => $this->getI18n()->__('Past %number% days', array('%number%' => 7)),
        'month' => $this->getI18n()->__('This month'),
        'year'  => $this->getI18n()->__('This year')
      ))),
    ));

    $this->setValidators(array(
      'name'           => new sfValidatorPass(array('required' => false)),
      'email'          => new sfValidatorPass(array('required' => false)),
      'body'           => new sfValidatorPass(array('required' => false)),
      'email_subject'  => new sfValidatorPass(array('required' => false)),
      'email_category' => new sfValidatorChoice(array('required' => false, 'choices' => array('New Business' => 'New Business', 'Original Content' => 'Original Content', 'Other' => 'Other'))),
      'other_desc'     => new sfValidatorPass(array('required' => false)),
      'phone'          => new sfValidatorPass(array('required' => false)),
      'created_at'     => new sfValidatorChoice(array('required' => false, 'choices' => array_keys($this->widgetSchema['created_at']->getOption('choices')))),
      'updated_at'     => new sfValidatorChoice(array('required' => false, 'choices' => array_keys($this->widgetSchema['updated_at']->getOption('choices')))),
    ));
    

    $this->widgetSchema->setNameFormat('dm_contact_filters[%s]');

    $this->errorSchema = new sfValidatorErrorSchema($this->validatorSchema);

    $this->setupInheritance();

    parent::setup();
  }

  public function getModelName()
  {
    return 'DmContact';
  }

  public function getFields()
  {
    return array(
      'id'             => 'Number',
      'name'           => 'Text',
      'email'          => 'Text',
      'body'           => 'Text',
      'email_subject'  => 'Text',
      'email_category' => 'Enum',
      'other_desc'     => 'Text',
      'phone'          => 'Text',
      'created_at'     => 'Date',
      'updated_at'     => 'Date',
    );
  }
}
