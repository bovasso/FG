<?php

/**
 * BaseDmTransUnit
 * 
 * This class has been auto-generated by the Doctrine ORM Framework
 * 
 * @property integer $dm_catalogue_id
 * @property string $source
 * @property string $target
 * @property string $meta
 * @property DmCatalogue $DmCatalogue
 * 
 * @method integer     getDmCatalogueId()   Returns the current record's "dm_catalogue_id" value
 * @method string      getSource()          Returns the current record's "source" value
 * @method string      getTarget()          Returns the current record's "target" value
 * @method string      getMeta()            Returns the current record's "meta" value
 * @method DmCatalogue getDmCatalogue()     Returns the current record's "DmCatalogue" value
 * @method DmTransUnit setDmCatalogueId()   Sets the current record's "dm_catalogue_id" value
 * @method DmTransUnit setSource()          Sets the current record's "source" value
 * @method DmTransUnit setTarget()          Sets the current record's "target" value
 * @method DmTransUnit setMeta()            Sets the current record's "meta" value
 * @method DmTransUnit setDmCatalogue()     Sets the current record's "DmCatalogue" value
 * 
 * @package    Funny Garbgage
 * @subpackage model
 * @author     Anthony Bovasso
 * @version    SVN: $Id: Builder.php 7490 2010-03-29 19:53:27Z jwage $
 */
abstract class BaseDmTransUnit extends myDoctrineRecord
{
    public function setTableDefinition()
    {
        $this->setTableName('dm_trans_unit');
        $this->hasColumn('dm_catalogue_id', 'integer', null, array(
             'type' => 'integer',
             'notnull' => true,
             ));
        $this->hasColumn('source', 'string', 60000, array(
             'type' => 'string',
             'notnull' => true,
             'length' => 60000,
             ));
        $this->hasColumn('target', 'string', 60000, array(
             'type' => 'string',
             'notnull' => true,
             'length' => 60000,
             ));
        $this->hasColumn('meta', 'string', 255, array(
             'type' => 'string',
             'length' => 255,
             ));
    }

    public function setUp()
    {
        parent::setUp();
        $this->hasOne('DmCatalogue', array(
             'local' => 'dm_catalogue_id',
             'foreign' => 'id',
             'onDelete' => 'CASCADE'));

        $timestampable0 = new Doctrine_Template_Timestampable(array(
             ));
        $this->actAs($timestampable0);
    }
}