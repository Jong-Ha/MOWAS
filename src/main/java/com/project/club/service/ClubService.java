package com.project.club.service;

import com.project.domain.Club;
import com.project.domain.Cluber;

import java.util.List;

public interface ClubService {

    public Club addClub(Club club);
    public Club updateClub(Club club);
    public void deleteClub(Club club);
    public Club getClub(int clubNum);
//    public List<Club> listClub();
    public void addCluberApply(Cluber cluber);
    public void updateCluberApply(Cluber cluber);
    public void deleteCluberApply(int clubUserNum);
    public List<Cluber> listCluberApply(int clubNum);
    public String getCluberApply(int clubUserNum);
    public void updateCluberApply(int clubNum, int clubUserNum, String result);
    public void addClubManager(int clubUserNum);
    public void deleteClubManager(int clubUserNum);
    public void updateClubMaster(Cluber cluber);
    public void deleteCluber(Cluber cluber, String kickoutCheck);
    public void addClubBlacklist(Cluber cluber);
    public void updateClubBlacklist(String process, List<Integer> clubUserNumList);
    public List<Cluber> listClubBlacklist(int clubNum);
    public String getClubBlacklist(int clubUserNum);
}
