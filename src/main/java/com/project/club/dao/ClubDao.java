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
    public void addClubMasterNewClub(Club club);
    public Club getClub(Club club);
    public void addCluberApply(Cluber cluber);
    public void updateCluberApply(Cluber cluber);
    public void deleteCluberApply(int clubUserNum);
    public List<Cluber> listCluberApply(int clubNum);
    public String getCluberApply(int clubUserNum);
    public void processCluberApply(Map<String, Object> map);
    public void updateClubNewCluber(int clubNum);
    public void addClubManager(int clubUserNum);
    public void deleteClubManager(int clubUserNum);
    public void deleteClubMaster(Cluber cluber);
    public void addClubMaster(Cluber cluber);
    public void updateClubMaster(Cluber cluber);
    public void deleteCluber(Map<String, Object> map);
    public void updateClubDeleteCluber(int clubNum);
    public void addClubBlacklist(Cluber cluber);
    public void updateClubBlacklist(Map<String, Object> map);
    public List<Cluber> listClubBlacklist(int clubNum);
    public String getClubBlacklist(int clubUserNum);
}
