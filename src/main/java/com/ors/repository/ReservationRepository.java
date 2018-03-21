package com.ors.repository;

import com.ors.model.Object;
import com.ors.model.Reservation;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import javax.transaction.Transactional;
import java.util.List;

/**
 * Created by cos on 12.12.2016.
 */
public interface ReservationRepository  extends JpaRepository<Reservation, Long> {
    List<Reservation> findByUserId(Long userId);

    @Query("select res from Reservation res where res.dayOfReservation=:date and res.hourOfReservation=:startTime and res.hourOfEndReservation=:endTime")
    List<Reservation> findByProperTime(@Param("date") String date, @Param("startTime") String startTime, @Param("endTime")  String endTime);
    Reservation findByObjectId(Long aLong);
    List<Reservation> findAllByObjectId(Long aLong);

    @Query("select res from Reservation res where res.dayOfReservation=:date and res.objectId=:objectId")
    List<Reservation> findByIdAndDate(@Param("date") String date, @Param("objectId") long objectId);
}
