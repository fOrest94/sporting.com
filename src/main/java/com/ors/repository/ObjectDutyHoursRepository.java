package com.ors.repository;

import com.ors.model.ObjectDutyHours;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ObjectDutyHoursRepository extends JpaRepository<ObjectDutyHours, Long>
{
    ObjectDutyHours findById(Long id);
    ObjectDutyHours findByObjectId(Long objectId);
    List<ObjectDutyHours> findAll();
}
