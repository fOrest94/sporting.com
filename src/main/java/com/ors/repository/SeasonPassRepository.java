package com.ors.repository;

import com.ors.model.SeasonPass;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface SeasonPassRepository extends JpaRepository<SeasonPass, Long>
{
    List<SeasonPass> findByUserId(Long userId);
    SeasonPass findByUserIdAndObjectId(Long userId, Long objectId);

}
