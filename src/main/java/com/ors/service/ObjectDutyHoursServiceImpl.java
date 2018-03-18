package com.ors.service;

import com.ors.model.ObjectDutyHours;
import com.ors.repository.ObjectDutyHoursRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;



@Service
public class ObjectDutyHoursServiceImpl implements ObjectDutyHoursService
{
    @Autowired
    private ObjectDutyHoursRepository objectDutyHoursRepository;

    @Override
    public ObjectDutyHours findById(Long id)
    {
        return objectDutyHoursRepository.findById(id);
    }

    @Override
    public ObjectDutyHours findByObjectId(Long objectId)
    {
        return objectDutyHoursRepository.findByObjectId(objectId);
    }

    @Override
    public List<ObjectDutyHours> findAll()
    {
        return objectDutyHoursRepository.findAll();
    }

}
