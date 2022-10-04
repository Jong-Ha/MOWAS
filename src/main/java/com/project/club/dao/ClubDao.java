package com.project.club.dao;

import com.project.domain.Club;
import com.project.domain.Cluber;

import java.util.List;
import java.util.Map;

public interface ClubDao {

    public void addClub(Club club);
    public void updateClub(Club club);
    public void deleteClub(Club club);
    public Club getClub(int clubNum);
    public List<Club> listClub();
    public void addClubMaster(Club club);
    public Club getClub(Club club);
    public void addCluberApply(Cluber cluber);
    public void updateCluberApply(Cluber cluber);
    public void deleteCluberApply(int clubUserNum);
    public List<Cluber> listCluberApply(int clubNum);
    public String getCluberApply(int clubUserNum);
    public void processCluberApply(Map<String, Object> map);
    public void updateClubNewCluber(int clubNum);
}
