package com.project.site.dao;


import com.project.domain.MasterBoard;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

@Repository("siteDaoImpl")
public class SiteDaoImpl implements SiteDao{

    @Autowired
    @Qualifier("sqlSessionTemplate")
    private SqlSession sqlSession;
    public void setSqlSession(SqlSession sqlSession) {
        this.sqlSession = sqlSession;
    }

    public SiteDaoImpl() {
        System.out.println(this.getClass());
        // TODO Auto-generated constructor stub
    }

    public MasterBoard findMasterBoard(int materBoardNo) throws Exception {
        return sqlSession.selectOne("MasterBoardMapper.findMasterBoard", materBoardNo);
    }

    //public List<MasterBoard> getMaterBoardList(Search search) throws Exception {
     //   return sqlSession.selectList("MasterBoardMapper.getMaterBoardList", search);
    //}

    public void updateMasterBoard(MasterBoard masterBoard) throws Exception {
        sqlSession.update("MasterBoardMapper.updateMaterBoard", masterBoard);

    }

    @Override
    public void addMasterBoard(MasterBoard masterBoard) {

    }

    //public int getTotalCount(Search search) throws Exception {
    //    return sqlSession.selectOne("MasterBoardMapper.getTotalCount", search);
    //}
}
