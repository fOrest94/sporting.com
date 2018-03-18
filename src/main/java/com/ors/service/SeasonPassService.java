package com.ors.service;

import com.ors.model.SeasonPass;

import java.util.List;

public interface SeasonPassService
{
    List<SeasonPass> findByUserId(Long userId);
    SeasonPass findByUserIdAndObjectId(Long userId, Long objectId);
}
