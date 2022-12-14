package com.project.common.dao;

import com.project.domain.Club;
import com.project.domain.Cluber;

public interface MongoDbDao {

    public void addClub(int clubNum, String clubName, String userId, String userImage, String clubImage);
    public void addCluber(int clubNum, String userId, String userImage);
    public void deleteCluber(int clubNum, String userId);
    public void deleteClub(int clubNum);
    public void updateClub(int clubNum, String clubName, String clubImage);
    public void updateUser(String userId, String userImage);
}
