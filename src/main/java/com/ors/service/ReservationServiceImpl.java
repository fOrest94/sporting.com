package com.ors.service;

import com.ors.model.Reservation;
import com.ors.model.User;
import com.ors.repository.ReservationRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by cos on 12.12.2016.
 */
@Service
public class ReservationServiceImpl implements ReservationService{
    @Autowired
    private ReservationRepository reservationRepository;

    @Override
    public void save(Reservation reservation) {
        reservationRepository.save(reservation);
    }

    @Override
    public List<Reservation> findByUserId(Long userId) {
        return reservationRepository.findByUserId(userId);
    }

    @Override
    public List<Reservation> findAll() {
        return reservationRepository.findAll();
    }

    @Override
    public List<Reservation> findByProperTime(String date, String startTime, String endTime) {
        System.out.println("sdsd "+date+" "+startTime+" "+endTime);
        return reservationRepository.findByProperTime(date,startTime,endTime);
    }

    @Override
    public Reservation findByObjectId(Long aLong) {
        return reservationRepository.findByObjectId(aLong);
    }

    @Override
    public List<Reservation> findAllByObjectId(Long aLong) {
        return reservationRepository.findAllByObjectId(aLong);
    }
}
