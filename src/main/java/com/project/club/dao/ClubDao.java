package com.project.club.dao;

import com.project.domain.Club;

import java.util.List;

public interface ClubDao {

    public void addClub(Club club);
    public void updateClub(Club club);
    public void deleteClub(Club club);
    public Club getClub(int clubNum);
    public List<Club> listClub();
    public void addClubMaster(Club club);
    public Club getClub(Club club);
}
