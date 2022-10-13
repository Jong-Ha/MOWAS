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
    public List<Club> listClub(Map<String, Object> map) {
        return sqlSession.selectList("ClubMapper.listClub", map);
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
    public Cluber getCluberApplyUpdate(Cluber cluber) {
        return sqlSession.selectOne("ClubMapper.getCluberApplyUpdate",cluber);
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
    public int getCluberDelete(Cluber cluber) {
        System.out.println(cluber);
        return sqlSession.selectOne("ClubMapper.getCluberDelete",cluber);
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
    public List<Cluber> listClubBlacklist(Map<String, Object> map) {
        return sqlSession.selectList("ClubMapper.listClubBlacklist", map);
    }

    @Override
    public int getTotalClubBlacklist(Map<String, Object> map) {
        return sqlSession.selectOne("ClubMapper.getTotalClubBlacklist", map);
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
    public List<ClubMasterBoard> listClubMasterBoard(Map<String, Object> map) {
        return sqlSession.selectList("ClubMapper.listClubMasterBoard", map);
    }

    @Override
    public int getTotalClubMasterBoard(Map<String, Object> map) {
        return sqlSession.selectOne("ClubMapper.getTotalClubMasterBoard", map);
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
    public void deleteClubMasterBoardFile(Map<String, Object> map) {
        sqlSession.delete("ClubMapper.deleteClubMasterBoardFile", map);
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

    @Override
    public List<Cluber> listCluber(Map<String, Object> map) {
        return sqlSession.selectList("ClubMapper.listCluber", map);
    }

    @Override
    public int getTotalCluber(Map<String, Object> map) {
        return sqlSession.selectOne("ClubMapper.getTotalCluber", map);
    }

    @Override
    public String getCluberCondition(Map<String, Object> map) {
        return sqlSession.selectOne("ClubMapper.getCluberCondition", map);
    }

    @Override
    public Cluber getCluber(int clubUserNum) {
        return sqlSession.selectOne("ClubMapper.getCluber", clubUserNum);
    }

    @Override
    public void updateCluber(Cluber cluber) {
        sqlSession.update("ClubMapper.updateCluber", cluber);
    }

    @Override
    public void addVote(Vote vote) {
        sqlSession.insert("ClubMapper.addVote",vote);
    }

    @Override
    public void updateVote(Vote vote) {
        sqlSession.update("ClubMapper.updateVote",vote);
    }

    @Override
    public void deleteVote(int voteNum) {
        sqlSession.delete("ClubMapper.deleteVote",voteNum);
    }

    @Override
    public void deleteVoter(Map<String, Object> map) {
        sqlSession.delete("ClubMapper.deleteVoter",map);
    }

    @Override
    public List<Vote> listVote(String roomId) {
        return sqlSession.selectList("ClubMapper.listVote", roomId);
    }

    @Override
    public Vote getVote(int voteNum) {
        return sqlSession.selectOne("ClubMapper.getVote", voteNum);
    }

    @Override
    public List<Voter> listVoter(Voter voter) {
        return sqlSession.selectList("ClubMapper.listVoter", voter);
    }

    @Override
    public void addVoter(Voter voter) {
        sqlSession.insert("ClubMapper.addVoter",voter);
    }
}
