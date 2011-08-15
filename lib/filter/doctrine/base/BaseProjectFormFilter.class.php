<?php

/**
 * Project filter form base class.
 *
 * @package    Funny Garbgage
 * @subpackage filter
 * @author     Anthony Bovasso
 * @version    SVN: $Id: sfDoctrineFormFilterGeneratedTemplate.php 24171 2009-11-19 16:37:50Z Kris.Wallsmith $
 */
abstract class BaseProjectFormFilter extends BaseFormFilterDoctrine
{
  public function setup()
  {
    $this->setWidgets(array(
      'title'       => new sfWidgetFormDmFilterInput(),
      'category_id' => new sfWidgetFormDoctrineChoice(array('model' => 'Category', 'add_empty' => true)),
      'extract'     => new sfWidgetFormDmFilterInput(),
      'overview'    => new sfWidgetFormDmFilterInput(),
      'launch_date' => new sfWidgetFormDmFilterInput(),
      'url'         => new sfWidgetFormDmFilterInput(),
      'awards'      => new sfWidgetFormDmFilterInput(),
      'screenshot'  => new sfWidgetFormDoctrineChoice(array('model' => 'DmMedia', 'add_empty' => true)),
      'thumbnail'   => new sfWidgetFormDoctrineChoice(array('model' => 'DmMedia', 'add_empty' => true)),
      'client'      => new sfWidgetFormDoctrineChoice(array('model' => 'Client', 'add_empty' => true)),
      'client_2'    => new sfWidgetFormDoctrineChoice(array('model' => 'Client', 'add_empty' => true)),
      'client_3'    => new sfWidgetFormDoctrineChoice(array('model' => 'Client', 'add_empty' => true)),
      'is_featured' => new sfWidgetFormChoice(array('choices' => array('' => $this->getI18n()->__('yes or no', array(), 'dm'), 1 => $this->getI18n()->__('yes', array(), 'dm'), 0 => $this->getI18n()->__('no', array(), 'dm')))),
      'is_active'   => new sfWidgetFormChoice(array('choices' => array('' => $this->getI18n()->__('yes or no', array(), 'dm'), 1 => $this->getI18n()->__('yes', array(), 'dm'), 0 => $this->getI18n()->__('no', array(), 'dm')))),
      'position'    => new sfWidgetFormDmFilterInput(),
      'tags_list'   => new sfWidgetFormDoctrineChoice(array('multiple' => true, 'model' => 'DmTag')),
      'medias_list' => new sfWidgetFormDoctrineChoice(array('multiple' => true, 'model' => 'DmMedia')),
    ));

    $this->setValidators(array(
      'title'       => new sfValidatorPass(array('required' => false)),
      'category_id' => new sfValidatorDoctrineChoice(array('required' => false, 'model' => $this->getRelatedModelName('Category'), 'column' => 'id')),
      'extract'     => new sfValidatorPass(array('required' => false)),
      'overview'    => new sfValidatorPass(array('required' => false)),
      'launch_date' => new sfValidatorPass(array('required' => false)),
      'url'         => new sfValidatorPass(array('required' => false)),
      'awards'      => new sfValidatorPass(array('required' => false)),
      'screenshot'  => new sfValidatorDoctrineChoice(array('required' => false, 'model' => $this->getRelatedModelName('Screenshot'), 'column' => 'id')),
      'thumbnail'   => new sfValidatorDoctrineChoice(array('required' => false, 'model' => $this->getRelatedModelName('Thumbnail'), 'column' => 'id')),
      'client'      => new sfValidatorDoctrineChoice(array('required' => false, 'model' => $this->getRelatedModelName('Client'), 'column' => 'id')),
      'client_2'    => new sfValidatorDoctrineChoice(array('required' => false, 'model' => $this->getRelatedModelName('Client2'), 'column' => 'id')),
      'client_3'    => new sfValidatorDoctrineChoice(array('required' => false, 'model' => $this->getRelatedModelName('Client3'), 'column' => 'id')),
      'is_featured' => new sfValidatorChoice(array('required' => false, 'choices' => array('', 1, 0))),
      'is_active'   => new sfValidatorChoice(array('required' => false, 'choices' => array('', 1, 0))),
      'position'    => new sfValidatorSchemaFilter('text', new sfValidatorInteger(array('required' => false))),
      'tags_list'   => new sfValidatorDoctrineChoice(array('multiple' => true, 'model' => 'DmTag', 'required' => false)),
      'medias_list' => new sfValidatorDoctrineChoice(array('multiple' => true, 'model' => 'DmMedia', 'required' => false)),
    ));
    

    $this->widgetSchema->setNameFormat('project_filters[%s]');

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

    $query->leftJoin('r.ProjectDmTag ProjectDmTag')
          ->andWhereIn('ProjectDmTag.dm_tag_id', $values);
  }

  public function addMediasListColumnQuery(Doctrine_Query $query, $field, $values)
  {
    if (!is_array($values))
    {
      $values = array($values);
    }

    if (!count($values))
    {
      return;
    }

    $query->leftJoin('r.ProjectDmMedia ProjectDmMedia')
          ->andWhereIn('ProjectDmMedia.dm_media_id', $values);
  }

  public function getModelName()
  {
    return 'Project';
  }

  public function getFields()
  {
    return array(
      'id'          => 'Number',
      'title'       => 'Text',
      'category_id' => 'ForeignKey',
      'extract'     => 'Text',
      'overview'    => 'Text',
      'launch_date' => 'Text',
      'url'         => 'Text',
      'awards'      => 'Text',
      'screenshot'  => 'ForeignKey',
      'thumbnail'   => 'ForeignKey',
      'client'      => 'ForeignKey',
      'client_2'    => 'ForeignKey',
      'client_3'    => 'ForeignKey',
      'is_featured' => 'Boolean',
      'is_active'   => 'Boolean',
      'position'    => 'Number',
      'tags_list'   => 'ManyKey',
      'medias_list' => 'ManyKey',
    );
  }
}
