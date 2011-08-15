<?php

/**
 * StaffMember filter form base class.
 *
 * @package    Funny Garbgage
 * @subpackage filter
 * @author     Anthony Bovasso
 * @version    SVN: $Id: sfDoctrineFormFilterGeneratedTemplate.php 24171 2009-11-19 16:37:50Z Kris.Wallsmith $
 */
abstract class BaseStaffMemberFormFilter extends BaseFormFilterDoctrine
{
  public function setup()
  {
    $this->setWidgets(array(
      'name'       => new sfWidgetFormDmFilterInput(),
      'title'      => new sfWidgetFormDmFilterInput(),
      'department' => new sfWidgetFormChoice(array('choices' => array('' => '', 'Design' => 'Design', 'Project Management' => 'Project Management', 'Technology' => 'Technology', 'User Experience Design/IA' => 'User Experience Design/IA'))),
      'bio'        => new sfWidgetFormDmFilterInput(),
      'photo'      => new sfWidgetFormDoctrineChoice(array('model' => 'DmMedia', 'add_empty' => true)),
      'is_active'  => new sfWidgetFormChoice(array('choices' => array('' => $this->getI18n()->__('yes or no', array(), 'dm'), 1 => $this->getI18n()->__('yes', array(), 'dm'), 0 => $this->getI18n()->__('no', array(), 'dm')))),
      'position'   => new sfWidgetFormDmFilterInput(),
    ));

    $this->setValidators(array(
      'name'       => new sfValidatorPass(array('required' => false)),
      'title'      => new sfValidatorPass(array('required' => false)),
      'department' => new sfValidatorChoice(array('required' => false, 'choices' => array('Design' => 'Design', 'Project Management' => 'Project Management', 'Technology' => 'Technology', 'User Experience Design/IA' => 'User Experience Design/IA'))),
      'bio'        => new sfValidatorPass(array('required' => false)),
      'photo'      => new sfValidatorDoctrineChoice(array('required' => false, 'model' => $this->getRelatedModelName('Photo'), 'column' => 'id')),
      'is_active'  => new sfValidatorChoice(array('required' => false, 'choices' => array('', 1, 0))),
      'position'   => new sfValidatorSchemaFilter('text', new sfValidatorInteger(array('required' => false))),
    ));
    

    $this->widgetSchema->setNameFormat('staff_member_filters[%s]');

    $this->errorSchema = new sfValidatorErrorSchema($this->validatorSchema);

    $this->setupInheritance();

    parent::setup();
  }

  public function getModelName()
  {
    return 'StaffMember';
  }

  public function getFields()
  {
    return array(
      'id'         => 'Number',
      'name'       => 'Text',
      'title'      => 'Text',
      'department' => 'Enum',
      'bio'        => 'Text',
      'photo'      => 'ForeignKey',
      'is_active'  => 'Boolean',
      'position'   => 'Number',
    );
  }
}
