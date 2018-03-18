package com.ors.service;

import com.ors.model.Object;
import com.ors.repository.RankingRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class RankingServiceImpl implements RankingService {

    @Autowired
    private RankingRepository rankingRepository;

    @Override
    public List<Object> getTopSportObjects() {
        Pageable topTen = new PageRequest(0, 6);
        return rankingRepository.findSportObjectByMark(topTen);
    }
}
