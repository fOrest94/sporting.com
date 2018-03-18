package com.ors.repository;

import com.ors.model.Object;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface RankingRepository extends JpaRepository<Object, Long> {

    @Query("select obj from Object obj order by obj.mark desc")
    List<Object> findSportObjectByMark(Pageable pageable);
}
