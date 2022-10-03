package com.project.club.service;

import com.project.domain.Club;

import java.util.List;

public interface ClubService {

    public Club addClub(Club club);
    public Club updateClub(Club club);
    public void deleteClub(Club club);
    public Club getClub(int clubNum);
}
