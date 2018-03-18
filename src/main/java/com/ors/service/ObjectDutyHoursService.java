package com.ors.service;

import com.ors.model.ObjectDutyHours;

import java.util.List;


public interface ObjectDutyHoursService
{
    ObjectDutyHours findById(Long id);
    ObjectDutyHours findByObjectId(Long objectId);
    List<ObjectDutyHours> findAll();
}
