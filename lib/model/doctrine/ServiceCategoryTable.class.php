<?php


class ServiceCategoryTable extends myDoctrineTable
{
    
    public static function getInstance()
    {
        return Doctrine_Core::getTable('ServiceCategory');
    }
}