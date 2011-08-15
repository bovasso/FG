<?php

/**
 * BaseJobApplication
 * 
 * This class has been auto-generated by the Doctrine ORM Framework
 * 
 * @property string $first_name
 * @property string $last_name
 * @property integer $job_position_id
 * @property string $address
 * @property string $city
 * @property enum $state
 * @property string $zip
 * @property string $phone
 * @property string $email
 * @property string $website
 * @property integer $resume
 * @property clob $objective
 * @property clob $links
 * @property clob $cover_letter
 * @property DmMedia $Resume
 * @property JobPosition $JobPosition
 * 
 * @method string         getFirstName()       Returns the current record's "first_name" value
 * @method string         getLastName()        Returns the current record's "last_name" value
 * @method integer        getJobPositionId()   Returns the current record's "job_position_id" value
 * @method string         getAddress()         Returns the current record's "address" value
 * @method string         getCity()            Returns the current record's "city" value
 * @method enum           getState()           Returns the current record's "state" value
 * @method string         getZip()             Returns the current record's "zip" value
 * @method string         getPhone()           Returns the current record's "phone" value
 * @method string         getEmail()           Returns the current record's "email" value
 * @method string         getWebsite()         Returns the current record's "website" value
 * @method integer        getResume()          Returns the current record's "resume" value
 * @method clob           getObjective()       Returns the current record's "objective" value
 * @method clob           getLinks()           Returns the current record's "links" value
 * @method clob           getCoverLetter()     Returns the current record's "cover_letter" value
 * @method DmMedia        getResume()          Returns the current record's "Resume" value
 * @method JobPosition    getJobPosition()     Returns the current record's "JobPosition" value
 * @method JobApplication setFirstName()       Sets the current record's "first_name" value
 * @method JobApplication setLastName()        Sets the current record's "last_name" value
 * @method JobApplication setJobPositionId()   Sets the current record's "job_position_id" value
 * @method JobApplication setAddress()         Sets the current record's "address" value
 * @method JobApplication setCity()            Sets the current record's "city" value
 * @method JobApplication setState()           Sets the current record's "state" value
 * @method JobApplication setZip()             Sets the current record's "zip" value
 * @method JobApplication setPhone()           Sets the current record's "phone" value
 * @method JobApplication setEmail()           Sets the current record's "email" value
 * @method JobApplication setWebsite()         Sets the current record's "website" value
 * @method JobApplication setResume()          Sets the current record's "resume" value
 * @method JobApplication setObjective()       Sets the current record's "objective" value
 * @method JobApplication setLinks()           Sets the current record's "links" value
 * @method JobApplication setCoverLetter()     Sets the current record's "cover_letter" value
 * @method JobApplication setResume()          Sets the current record's "Resume" value
 * @method JobApplication setJobPosition()     Sets the current record's "JobPosition" value
 * 
 * @package    Funny Garbgage
 * @subpackage model
 * @author     Anthony Bovasso
 * @version    SVN: $Id: Builder.php 7490 2010-03-29 19:53:27Z jwage $
 */
abstract class BaseJobApplication extends myDoctrineRecord
{
    public function setTableDefinition()
    {
        $this->setTableName('job_application');
        $this->hasColumn('first_name', 'string', 255, array(
             'type' => 'string',
             'notnull' => true,
             'length' => 255,
             ));
        $this->hasColumn('last_name', 'string', 255, array(
             'type' => 'string',
             'notnull' => true,
             'length' => 255,
             ));
        $this->hasColumn('job_position_id', 'integer', null, array(
             'type' => 'integer',
             'notnull' => true,
             ));
        $this->hasColumn('address', 'string', 255, array(
             'type' => 'string',
             'notnull' => true,
             'length' => 255,
             ));
        $this->hasColumn('city', 'string', 255, array(
             'type' => 'string',
             'notnull' => true,
             'length' => 255,
             ));
        $this->hasColumn('state', 'enum', null, array(
             'type' => 'enum',
             'values' => 
             array(
              0 => '--',
              1 => 'AL',
              2 => 'AZ',
              3 => 'AR',
              4 => 'CA',
              5 => 'CO',
              6 => 'CT',
              7 => 'DE',
              8 => 'FL',
              9 => 'GA',
              10 => 'HI',
              11 => 'IA',
              12 => 'ID',
              13 => 'IL',
              14 => 'IN',
              15 => 'KS',
              16 => 'KY',
              17 => 'LA',
              18 => 'MA',
              19 => 'ME',
              20 => 'MD',
              21 => 'MI',
              22 => 'MN',
              23 => 'MO',
              24 => 'MS',
              25 => 'MT',
              26 => 'NE',
              27 => 'NC',
              28 => 'ND',
              29 => 'NJ',
              30 => 'NM',
              31 => 'NV',
              32 => 'NY',
              33 => 'OH',
              34 => 'OK',
              35 => 'OR',
              36 => 'PA',
              37 => 'RI',
              38 => 'SC',
              39 => 'SD',
              40 => 'TN',
              41 => 'TX',
              42 => 'UT',
              43 => 'VA',
              44 => 'VT',
              45 => 'WA',
              46 => 'WI',
              47 => 'WV',
              48 => 'WY',
             ),
             'notnull' => true,
             ));
        $this->hasColumn('zip', 'string', 255, array(
             'type' => 'string',
             'notnull' => true,
             'length' => 255,
             ));
        $this->hasColumn('phone', 'string', 255, array(
             'type' => 'string',
             'notnull' => false,
             'length' => 255,
             ));
        $this->hasColumn('email', 'string', 255, array(
             'type' => 'string',
             'notnull' => true,
             'length' => 255,
             ));
        $this->hasColumn('website', 'string', 255, array(
             'type' => 'string',
             'notnull' => true,
             'length' => 255,
             ));
        $this->hasColumn('resume', 'integer', null, array(
             'type' => 'integer',
             'notnull' => true,
             ));
        $this->hasColumn('objective', 'clob', null, array(
             'type' => 'clob',
             'extra' => 'markdown',
             ));
        $this->hasColumn('links', 'clob', null, array(
             'type' => 'clob',
             'extra' => 'markdown',
             ));
        $this->hasColumn('cover_letter', 'clob', null, array(
             'type' => 'clob',
             'extra' => 'markdown',
             ));
    }

    public function setUp()
    {
        parent::setUp();
        $this->hasOne('DmMedia as Resume', array(
             'local' => 'resume',
             'foreign' => 'id'));

        $this->hasOne('JobPosition', array(
             'local' => 'job_position_id',
             'foreign' => 'id'));

        $timestampable0 = new Doctrine_Template_Timestampable();
        $this->actAs($timestampable0);
    }
}