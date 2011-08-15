<?php

/**
 * DmTag filter form base class.
 *
 * @package    Funny Garbgage
 * @subpackage filter
 * @author     Anthony Bovasso
 * @version    SVN: $Id: sfDoctrineFormFilterGeneratedTemplate.php 24171 2009-11-19 16:37:50Z Kris.Wallsmith $
 */
abstract class BaseDmTagFormFilter extends BaseFormFilterDoctrine
{
  public function setup()
  {
    $this->setWidgets(array(
      'name'          => new sfWidgetFormDmFilterInput(),
      'projects_list' => new sfWidgetFormDoctrineChoice(array('multiple' => true, 'model' => 'Project')),
      'pages_list'    => new sfWidgetFormDoctrineChoice(array('multiple' => true, 'model' => 'Page')),
    ));

    $this->setValidators(array(
      'name'          => new sfValidatorPass(array('required' => false)),
      'projects_list' => new sfValidatorDoctrineChoice(array('multiple' => true, 'model' => 'Project', 'required' => false)),
      'pages_list'    => new sfValidatorDoctrineChoice(array('multiple' => true, 'model' => 'Page', 'required' => false)),
    ));
    

    $this->widgetSchema->setNameFormat('dm_tag_filters[%s]');

    $this->errorSchema = new sfValidatorErrorSchema($this->validatorSchema);

    $this->setupInheritance();

    parent::setup();
  }

  public function addProjectsListColumnQuery(Doctrine_Query $query, $field, $values)
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
          ->andWhereIn('ProjectDmTag.id', $values);
  }

  public function addPagesListColumnQuery(Doctrine_Query $query, $field, $values)
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
          ->andWhereIn('PageDmTag.id', $values);
  }

  public function getModelName()
  {
    return 'DmTag';
  }

  public function getFields()
  {
    return array(
      'id'            => 'Number',
      'name'          => 'Text',
      'projects_list' => 'ManyKey',
      'pages_list'    => 'ManyKey',
    );
  }
}
