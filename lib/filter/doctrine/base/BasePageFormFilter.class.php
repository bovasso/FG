<?php

/**
 * Page filter form base class.
 *
 * @package    Funny Garbgage
 * @subpackage filter
 * @author     Anthony Bovasso
 * @version    SVN: $Id: sfDoctrineFormFilterGeneratedTemplate.php 24171 2009-11-19 16:37:50Z Kris.Wallsmith $
 */
abstract class BasePageFormFilter extends BaseFormFilterDoctrine
{
  public function setup()
  {
    $this->setWidgets(array(
      'title'      => new sfWidgetFormDmFilterInput(),
      'body'       => new sfWidgetFormDmFilterInput(),
      'photo'      => new sfWidgetFormDoctrineChoice(array('model' => 'DmMedia', 'add_empty' => true)),
      'is_active'  => new sfWidgetFormChoice(array('choices' => array('' => $this->getI18n()->__('yes or no', array(), 'dm'), 1 => $this->getI18n()->__('yes', array(), 'dm'), 0 => $this->getI18n()->__('no', array(), 'dm')))),
      'position'   => new sfWidgetFormDmFilterInput(),
      'created_at' => new sfWidgetFormChoice(array('choices' => array(
        ''      => '',
        'today' => $this->getI18n()->__('Today'),
        'week'  => $this->getI18n()->__('Past %number% days', array('%number%' => 7)),
        'month' => $this->getI18n()->__('This month'),
        'year'  => $this->getI18n()->__('This year')
      ))),
      'updated_at' => new sfWidgetFormChoice(array('choices' => array(
        ''      => '',
        'today' => $this->getI18n()->__('Today'),
        'week'  => $this->getI18n()->__('Past %number% days', array('%number%' => 7)),
        'month' => $this->getI18n()->__('This month'),
        'year'  => $this->getI18n()->__('This year')
      ))),
      'tags_list'  => new sfWidgetFormDoctrineChoice(array('multiple' => true, 'model' => 'DmTag')),
    ));

    $this->setValidators(array(
      'title'      => new sfValidatorPass(array('required' => false)),
      'body'       => new sfValidatorPass(array('required' => false)),
      'photo'      => new sfValidatorDoctrineChoice(array('required' => false, 'model' => $this->getRelatedModelName('Photo'), 'column' => 'id')),
      'is_active'  => new sfValidatorChoice(array('required' => false, 'choices' => array('', 1, 0))),
      'position'   => new sfValidatorSchemaFilter('text', new sfValidatorInteger(array('required' => false))),
      'created_at' => new sfValidatorChoice(array('required' => false, 'choices' => array_keys($this->widgetSchema['created_at']->getOption('choices')))),
      'updated_at' => new sfValidatorChoice(array('required' => false, 'choices' => array_keys($this->widgetSchema['updated_at']->getOption('choices')))),
      'tags_list'  => new sfValidatorDoctrineChoice(array('multiple' => true, 'model' => 'DmTag', 'required' => false)),
    ));
    

    $this->widgetSchema->setNameFormat('page_filters[%s]');

    $this->errorSchema = new sfValidatorErrorSchema($this->validatorSchema);

    $this->setupInheritance();

    parent::setup();
  }

  public function addTagsListColumnQuery(Doctrine_Query $query, $field, $values)
  {
    if (!is_array($values))
    {
      $values = array($values);
    }

    if (!count($values))
    {
      return;
    }

    $query->leftJoin('r.PageDmTag PageDmTag')
          ->andWhereIn('PageDmTag.dm_tag_id', $values);
  }

  public function getModelName()
  {
    return 'Page';
  }

  public function getFields()
  {
    return array(
      'id'         => 'Number',
      'title'      => 'Text',
      'body'       => 'Text',
      'photo'      => 'ForeignKey',
      'is_active'  => 'Boolean',
      'position'   => 'Number',
      'created_at' => 'Date',
      'updated_at' => 'Date',
      'tags_list'  => 'ManyKey',
    );
  }
}
