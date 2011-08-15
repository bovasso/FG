<?php

/**
 * JobPosition filter form base class.
 *
 * @package    Funny Garbgage
 * @subpackage filter
 * @author     Anthony Bovasso
 * @version    SVN: $Id: sfDoctrineFormFilterGeneratedTemplate.php 24171 2009-11-19 16:37:50Z Kris.Wallsmith $
 */
abstract class BaseJobPositionFormFilter extends BaseFormFilterDoctrine
{
  public function setup()
  {
    $this->setWidgets(array(
      'name'             => new sfWidgetFormDmFilterInput(),
      'department'       => new sfWidgetFormChoice(array('choices' => array('' => '', 'Design' => 'Design', 'Project Management' => 'Project Management', 'Technology' => 'Technology', 'User Experience Design/IA' => 'User Experience Design/IA'))),
      'description'      => new sfWidgetFormDmFilterInput(),
      'qualifications'   => new sfWidgetFormDmFilterInput(),
      'tech_experience'  => new sfWidgetFormDmFilterInput(),
      'additional_areas' => new sfWidgetFormDmFilterInput(),
      'required_skills'  => new sfWidgetFormDmFilterInput(),
      'time_reqs'        => new sfWidgetFormDmFilterInput(),
      'is_active'        => new sfWidgetFormChoice(array('choices' => array('' => $this->getI18n()->__('yes or no', array(), 'dm'), 1 => $this->getI18n()->__('yes', array(), 'dm'), 0 => $this->getI18n()->__('no', array(), 'dm')))),
      'created_at'       => new sfWidgetFormChoice(array('choices' => array(
        ''      => '',
        'today' => $this->getI18n()->__('Today'),
        'week'  => $this->getI18n()->__('Past %number% days', array('%number%' => 7)),
        'month' => $this->getI18n()->__('This month'),
        'year'  => $this->getI18n()->__('This year')
      ))),
      'updated_at'       => new sfWidgetFormChoice(array('choices' => array(
        ''      => '',
        'today' => $this->getI18n()->__('Today'),
        'week'  => $this->getI18n()->__('Past %number% days', array('%number%' => 7)),
        'month' => $this->getI18n()->__('This month'),
        'year'  => $this->getI18n()->__('This year')
      ))),
    ));

    $this->setValidators(array(
      'name'             => new sfValidatorPass(array('required' => false)),
      'department'       => new sfValidatorChoice(array('required' => false, 'choices' => array('Design' => 'Design', 'Project Management' => 'Project Management', 'Technology' => 'Technology', 'User Experience Design/IA' => 'User Experience Design/IA'))),
      'description'      => new sfValidatorPass(array('required' => false)),
      'qualifications'   => new sfValidatorPass(array('required' => false)),
      'tech_experience'  => new sfValidatorPass(array('required' => false)),
      'additional_areas' => new sfValidatorPass(array('required' => false)),
      'required_skills'  => new sfValidatorPass(array('required' => false)),
      'time_reqs'        => new sfValidatorPass(array('required' => false)),
      'is_active'        => new sfValidatorChoice(array('required' => false, 'choices' => array('', 1, 0))),
      'created_at'       => new sfValidatorChoice(array('required' => false, 'choices' => array_keys($this->widgetSchema['created_at']->getOption('choices')))),
      'updated_at'       => new sfValidatorChoice(array('required' => false, 'choices' => array_keys($this->widgetSchema['updated_at']->getOption('choices')))),
    ));
    

    $this->widgetSchema->setNameFormat('job_position_filters[%s]');

    $this->errorSchema = new sfValidatorErrorSchema($this->validatorSchema);

    $this->setupInheritance();

    parent::setup();
  }

  public function getModelName()
  {
    return 'JobPosition';
  }

  public function getFields()
  {
    return array(
      'id'               => 'Number',
      'name'             => 'Text',
      'department'       => 'Enum',
      'description'      => 'Text',
      'qualifications'   => 'Text',
      'tech_experience'  => 'Text',
      'additional_areas' => 'Text',
      'required_skills'  => 'Text',
      'time_reqs'        => 'Text',
      'is_active'        => 'Boolean',
      'created_at'       => 'Date',
      'updated_at'       => 'Date',
    );
  }
}
