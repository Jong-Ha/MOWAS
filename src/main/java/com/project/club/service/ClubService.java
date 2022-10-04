package com.project.club.service;

import com.project.domain.Club;
import com.project.domain.Cluber;

import java.util.List;
import java.util.Map;

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
    public void updateCluberApply(Map<String, Object> map);
}
