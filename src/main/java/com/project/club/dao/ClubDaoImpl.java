package com.project.club.dao;

import com.project.domain.Club;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import java.util.List;

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
        sqlSession.delete("ClubMapper.deleteClub",club);
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
    public void addClubMaster(Club club) {
        sqlSession.insert("ClubMapper.addClubMaster",club);
    }

    @Override
    public Club getClub(Club club) {
        return sqlSession.selectOne("ClubMapper.getNewClub",club);
    }
}
