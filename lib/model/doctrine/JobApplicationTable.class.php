<?php


class JobApplicationTable extends myDoctrineTable
{
    
    public static function getInstance()
    {
        return Doctrine_Core::getTable('JobApplication');
    }
}