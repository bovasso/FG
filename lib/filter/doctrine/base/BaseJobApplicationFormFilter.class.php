<?php

/**
 * JobApplication filter form base class.
 *
 * @package    Funny Garbgage
 * @subpackage filter
 * @author     Anthony Bovasso
 * @version    SVN: $Id: sfDoctrineFormFilterGeneratedTemplate.php 24171 2009-11-19 16:37:50Z Kris.Wallsmith $
 */
abstract class BaseJobApplicationFormFilter extends BaseFormFilterDoctrine
{
  public function setup()
  {
    $this->setWidgets(array(
      'first_name'      => new sfWidgetFormDmFilterInput(),
      'last_name'       => new sfWidgetFormDmFilterInput(),
      'job_position_id' => new sfWidgetFormDoctrineChoice(array('model' => 'JobPosition', 'add_empty' => true)),
      'address'         => new sfWidgetFormDmFilterInput(),
      'city'            => new sfWidgetFormDmFilterInput(),
      'state'           => new sfWidgetFormChoice(array('choices' => array('' => '', '--' => '--', 'AL' => 'AL', 'AZ' => 'AZ', 'AR' => 'AR', 'CA' => 'CA', 'CO' => 'CO', 'CT' => 'CT', 'DE' => 'DE', 'FL' => 'FL', 'GA' => 'GA', 'HI' => 'HI', 'IA' => 'IA', 'ID' => 'ID', 'IL' => 'IL', 'IN' => 'IN', 'KS' => 'KS', 'KY' => 'KY', 'LA' => 'LA', 'MA' => 'MA', 'ME' => 'ME', 'MD' => 'MD', 'MI' => 'MI', 'MN' => 'MN', 'MO' => 'MO', 'MS' => 'MS', 'MT' => 'MT', 'NE' => 'NE', 'NC' => 'NC', 'ND' => 'ND', 'NJ' => 'NJ', 'NM' => 'NM', 'NV' => 'NV', 'NY' => 'NY', 'OH' => 'OH', 'OK' => 'OK', 'OR' => 'OR', 'PA' => 'PA', 'RI' => 'RI', 'SC' => 'SC', 'SD' => 'SD', 'TN' => 'TN', 'TX' => 'TX', 'UT' => 'UT', 'VA' => 'VA', 'VT' => 'VT', 'WA' => 'WA', 'WI' => 'WI', 'WV' => 'WV', 'WY' => 'WY'))),
      'zip'             => new sfWidgetFormDmFilterInput(),
      'phone'           => new sfWidgetFormDmFilterInput(),
      'email'           => new sfWidgetFormDmFilterInput(),
      'website'         => new sfWidgetFormDmFilterInput(),
      'resume'          => new sfWidgetFormDoctrineChoice(array('model' => 'DmMedia', 'add_empty' => true)),
      'objective'       => new sfWidgetFormDmFilterInput(),
      'links'           => new sfWidgetFormDmFilterInput(),
      'cover_letter'    => new sfWidgetFormDmFilterInput(),
      'created_at'      => new sfWidgetFormChoice(array('choices' => array(
        ''      => '',
        'today' => $this->getI18n()->__('Today'),
        'week'  => $this->getI18n()->__('Past %number% days', array('%number%' => 7)),
        'month' => $this->getI18n()->__('This month'),
        'year'  => $this->getI18n()->__('This year')
      ))),
      'updated_at'      => new sfWidgetFormChoice(array('choices' => array(
        ''      => '',
        'today' => $this->getI18n()->__('Today'),
        'week'  => $this->getI18n()->__('Past %number% days', array('%number%' => 7)),
        'month' => $this->getI18n()->__('This month'),
        'year'  => $this->getI18n()->__('This year')
      ))),
    ));

    $this->setValidators(array(
      'first_name'      => new sfValidatorPass(array('required' => false)),
      'last_name'       => new sfValidatorPass(array('required' => false)),
      'job_position_id' => new sfValidatorDoctrineChoice(array('required' => false, 'model' => $this->getRelatedModelName('JobPosition'), 'column' => 'id')),
      'address'         => new sfValidatorPass(array('required' => false)),
      'city'            => new sfValidatorPass(array('required' => false)),
      'state'           => new sfValidatorChoice(array('required' => false, 'choices' => array('--' => '--', 'AL' => 'AL', 'AZ' => 'AZ', 'AR' => 'AR', 'CA' => 'CA', 'CO' => 'CO', 'CT' => 'CT', 'DE' => 'DE', 'FL' => 'FL', 'GA' => 'GA', 'HI' => 'HI', 'IA' => 'IA', 'ID' => 'ID', 'IL' => 'IL', 'IN' => 'IN', 'KS' => 'KS', 'KY' => 'KY', 'LA' => 'LA', 'MA' => 'MA', 'ME' => 'ME', 'MD' => 'MD', 'MI' => 'MI', 'MN' => 'MN', 'MO' => 'MO', 'MS' => 'MS', 'MT' => 'MT', 'NE' => 'NE', 'NC' => 'NC', 'ND' => 'ND', 'NJ' => 'NJ', 'NM' => 'NM', 'NV' => 'NV', 'NY' => 'NY', 'OH' => 'OH', 'OK' => 'OK', 'OR' => 'OR', 'PA' => 'PA', 'RI' => 'RI', 'SC' => 'SC', 'SD' => 'SD', 'TN' => 'TN', 'TX' => 'TX', 'UT' => 'UT', 'VA' => 'VA', 'VT' => 'VT', 'WA' => 'WA', 'WI' => 'WI', 'WV' => 'WV', 'WY' => 'WY'))),
      'zip'             => new sfValidatorPass(array('required' => false)),
      'phone'           => new sfValidatorPass(array('required' => false)),
      'email'           => new sfValidatorPass(array('required' => false)),
      'website'         => new sfValidatorPass(array('required' => false)),
      'resume'          => new sfValidatorDoctrineChoice(array('required' => false, 'model' => $this->getRelatedModelName('Resume'), 'column' => 'id')),
      'objective'       => new sfValidatorPass(array('required' => false)),
      'links'           => new sfValidatorPass(array('required' => false)),
      'cover_letter'    => new sfValidatorPass(array('required' => false)),
      'created_at'      => new sfValidatorChoice(array('required' => false, 'choices' => array_keys($this->widgetSchema['created_at']->getOption('choices')))),
      'updated_at'      => new sfValidatorChoice(array('required' => false, 'choices' => array_keys($this->widgetSchema['updated_at']->getOption('choices')))),
    ));
    

    $this->widgetSchema->setNameFormat('job_application_filters[%s]');

    $this->errorSchema = new sfValidatorErrorSchema($this->validatorSchema);

    $this->setupInheritance();

    parent::setup();
  }

  public function getModelName()
  {
    return 'JobApplication';
  }

  public function getFields()
  {
    return array(
      'id'              => 'Number',
      'first_name'      => 'Text',
      'last_name'       => 'Text',
      'job_position_id' => 'ForeignKey',
      'address'         => 'Text',
      'city'            => 'Text',
      'state'           => 'Enum',
      'zip'             => 'Text',
      'phone'           => 'Text',
      'email'           => 'Text',
      'website'         => 'Text',
      'resume'          => 'ForeignKey',
      'objective'       => 'Text',
      'links'           => 'Text',
      'cover_letter'    => 'Text',
      'created_at'      => 'Date',
      'updated_at'      => 'Date',
    );
  }
}
