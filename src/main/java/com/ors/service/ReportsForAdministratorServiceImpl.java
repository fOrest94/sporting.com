package com.ors.service;

import com.ors.model.ReportObj;
import com.ors.model.Reservation;
import com.ors.model.User;
import com.ors.repository.ReservationRepository;
import com.ors.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.logging.Logger;


@Service
public class ReportsForAdministratorServiceImpl implements ReportsForAdministratorService {

    private Logger LOGGER = Logger.getLogger(ReportsForAdministratorServiceImpl.class.getName());

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private ReservationRepository reservationRepository;


    @Override
    public ReportObj reportForNewUser() {
        return createReportForReservation(userRepository.findAll());
    }

    @Override
    public ReportObj reportForReservations() {
        try {
            return createReportForUsers(reservationRepository.findAll());
        } catch (ParseException e) {
            LOGGER.info("UNABLE TO GET REPORT FOR RESERVATIONS");
            return new ReportObj(0, 0, 0);
        }
    }

    private ReportObj createReportForReservation(List<User> listOfUsers) {
        int createdToday = 0;
        int createdInThisMonth = 0;
        int createdInThisYear = 0;

        Date today = new Date();
        for (User user : listOfUsers) {
            if (user.getCreatedDate().getYear() == today.getYear()) {
                if (user.getCreatedDate().getMonth() == today.getMonth()) {
                    if (user.getCreatedDate().getDay() == today.getDay()) {
                        createdToday++;
                    } else {
                        createdInThisMonth++;
                    }
                } else {
                    createdInThisYear++;
                }
            }
        }
        return new ReportObj(createdToday, createdInThisMonth, createdInThisYear);
    }

    private ReportObj createReportForUsers(List<Reservation> listOfReservations) throws ParseException {
        int createdToday = 0;
        int createdInThisMonth = 0;
        int createdInThisYear = 0;

        Date today = new Date();
        for (Reservation reservation : listOfReservations) {
            Date dateOfReserv = getDateObjFromDateString(reservation);
            if (dateOfReserv.getYear() == today.getYear()) {
                if (dateOfReserv.getMonth() == today.getMonth()) {
                    if (dateOfReserv.getDay() == today.getDay()) {
                        createdToday++;
                    } else {
                        createdInThisMonth++;
                    }
                } else {
                    createdInThisYear++;
                }
            }
        }
        return new ReportObj(createdToday, createdInThisMonth, createdInThisYear);
    }

    private Date getDateObjFromDateString(Reservation reservation) throws ParseException {
        SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
        return sdf.parse(reservation.getDayOfReservation());
    }


}
