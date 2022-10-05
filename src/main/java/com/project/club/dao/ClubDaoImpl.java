package com.project.club.dao;

import com.project.domain.*;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository("clubDaoImpl")
public class ClubDaoImpl implements ClubDao {

    @Autowired
    @Qualifier(value = "sqlSessionTemplate")
    private SqlSession sqlSession;

    public ClubDaoImpl() {
    }

    @Override
    public void addClub(Club club) {
        sqlSession.insert("ClubMapper.addClub",club);
    }

    @Override
    public void updateClub(Club club) {
        sqlSession.update("ClubMapper.updateClub",club);
    }

    @Override
    public void deleteClub(Club club) {
        sqlSession.update("ClubMapper.deleteClub",club.getClubNum());
    }

    @Override
    public Club getClub(int clubNum) {
        return sqlSession.selectOne("ClubMapper.getClub",clubNum);
    }

    @Override
    public List<Club> listClub() {
        return sqlSession.selectList("ClubMapper.listClub");
    }

    @Override
    public void addClubMasterNewClub(Club club) {
        sqlSession.insert("ClubMapper.addClubMasterNewClub",club);
    }

    @Override
    public Club getClub(Club club) {
        return sqlSession.selectOne("ClubMapper.getNewClub",club);
    }

    @Override
    public void addCluberApply(Cluber cluber) {
        sqlSession.insert("ClubMapper.addCluberApply",cluber);
    }

    @Override
    public void updateCluberApply(Cluber cluber) {
        sqlSession.update("ClubMapper.updateCluberApply",cluber);
    }

    @Override
    public void deleteCluberApply(int clubUserNum) {
        sqlSession.delete("ClubMapper.deleteCluberApply",clubUserNum);
    }

    @Override
    public List<Cluber> listCluberApply(int clubNum) {
        return sqlSession.selectList("ClubMapper.listCluberApply",clubNum);
    }

    @Override
    public String getCluberApply(int clubUserNum) {
        return sqlSession.selectOne("ClubMapper.getCluberApply",clubUserNum);
    }

    @Override
    public void processCluberApply(Map<String, Object> map) {
        sqlSession.update("ClubMapper.processCluberApply",map);
    }

    @Override
    public void updateClubNewCluber(int clubNum) {
        sqlSession.update("ClubMapper.updateClubNewCluber",clubNum);
    }

    @Override
    public void addClubManager(int clubUserNum) {
        sqlSession.update("ClubMapper.addClubManager",clubUserNum);
    }

    @Override
    public void deleteClubManager(int clubUserNum) {
        sqlSession.update("ClubMapper.deleteClubManager",clubUserNum);
    }

    @Override
    public void deleteClubMaster(Cluber cluber) {
        sqlSession.update("ClubMapper.deleteClubMaster",cluber);
    }

    @Override
    public void addClubMaster(Cluber cluber) {
        sqlSession.update("ClubMapper.addClubMaster",cluber);
    }

    @Override
    public void updateClubMaster(Cluber cluber) {
        sqlSession.update("ClubMapper.updateClubMaster",cluber);
    }

    @Override
    public void deleteCluber(Map<String, Object> map) {
        sqlSession.update("ClubMapper.deleteCluber",map);
    }

    @Override
    public void updateClubDeleteCluber(int clubNum) {
        sqlSession.update("ClubMapper.updateClubDeleteCluber",clubNum);
    }

    @Override
    public void addClubBlacklist(Cluber cluber) {
        sqlSession.insert("ClubMapper.addClubBlacklist", cluber);
    }

    @Override
    public void updateClubBlacklist(Map<String, Object> map) {
        sqlSession.update("ClubMapper.updateClubBlacklist", map);
    }

    @Override
    public List<Cluber> listClubBlacklist(int clubNum) {
        return sqlSession.selectList("ClubMapper.listClubBlacklist", clubNum);
    }

    @Override
    public String getClubBlacklist(int clubUserNum) {
        return sqlSession.selectOne("ClubMapper.getClubBlacklist", clubUserNum);
    }

    @Override
    public void addClubMasterBoard(ClubMasterBoard clubMasterBoard) {
        sqlSession.insert("ClubMapper.addClubMasterBoard", clubMasterBoard);
    }

    @Override
    public void updateClubMasterBoard(ClubMasterBoard clubMasterBoard) {
        sqlSession.update("ClubMapper.updateClubMasterBoard", clubMasterBoard);
    }

    @Override
    public void deleteClubMasterBoard(int clubMasterBoardNum) {
        sqlSession.delete("ClubMapper.deleteClubMasterBoard", clubMasterBoardNum);
    }

    @Override
    public List<ClubMasterBoard> listClubMasterBoard(int clubNum) {
        return sqlSession.selectList("ClubMapper.listClubMasterBoard", clubNum);
    }

    @Override
    public ClubMasterBoard getClubMasterBoard(int clubMasterBoardNum) {
        return sqlSession.selectOne("ClubMapper.getClubMasterBoard", clubMasterBoardNum);
    }

    @Override
    public void addClubMasterBoardFile(File file) {
        sqlSession.insert("ClubMapper.addClubMasterBoardFile", file);
    }

    @Override
    public void deleteClubMasterBoardFile(ClubMasterBoard clubMasterBoard) {
        sqlSession.delete("ClubMapper.deleteClubMasterBoardFile", clubMasterBoard);
    }

    @Override
    public List<String> listClubMasterBoardCurrentFile(int clubMasterBoardNum) {
        return sqlSession.selectList("ClubMapper.listClubMasterBoardCurrentFile", clubMasterBoardNum);
    }

    @Override
    public int getClubMasterBoardNum(String userId) {
        return sqlSession.selectOne("ClubMapper.getClubMasterBoardNum", userId);
    }

    @Override
    public void addClubCalendarApply(Map<String, Object> map) {
        sqlSession.insert("ClubMapper.addClubCalendarApply", map);
    }

    @Override
    public void deleteClubCalendarApply(Map<String, Object> map) {
        sqlSession.delete("ClubMapper.deleteClubCalendarApply", map);
    }

    @Override
    public List<CalendarCluber> listClubCalendarApply(Map<String, Object> map) {
        return sqlSession.selectList("ClubMapper.listClubCalendarApply", map);
    }

    @Override
    public void updateClubCalendarApply(Map<String, Object> map) {
        sqlSession.update("ClubMapper.updateClubCalendarApply", map);

    }
}
