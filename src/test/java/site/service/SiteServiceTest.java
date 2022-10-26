package site.service;

import com.project.common.Page;
import com.project.common.Search;
import com.project.domain.Club;
import com.project.domain.ClubReport;
import com.project.domain.CommunityReport;
import com.project.domain.MasterBoard;
import com.project.site.service.SiteService;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;
import java.util.Map;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {	"classpath:config/context-common.xml",
                                        "classpath:config/context-aspect.xml",
                                        "classpath:config/context-mybatis.xml",
                                        "classpath:config/context-transaction.xml" })

public class SiteServiceTest {

    @Autowired
    @Qualifier(value = "siteServiceImpl")
    private SiteService siteService;

    @Test
    public void testAddMasterBoard() throws Exception {
        MasterBoard masterBoard = new MasterBoard();

        masterBoard.setAdminId("admin3");
        masterBoard.setMbCategory('1');
        masterBoard.setMbTitle("공지사항 제목");
        masterBoard.setMbText("공지사항 세부 내역");

        siteService.addMasterBoard(masterBoard);

        masterBoard = siteService.getMasterBoard(10004);

        //System.out.println(masterBoard);

        Assert.assertEquals("admin3", masterBoard.getAdminId());
        Assert.assertEquals('1', masterBoard.getMbCategory());
        Assert.assertEquals("공지사항 제목", masterBoard.getMbTitle());
        Assert.assertEquals("공지사항 세부 내역", masterBoard.getMbText());
    }

    @Test
    public void testGetMasterBoard() throws Exception {

        MasterBoard masterBoard = new MasterBoard();

        masterBoard = siteService.getMasterBoard(10004);

        //==> console Ȯ��
        //System.out.println(user);

        //==> API Ȯ��
        Assert.assertEquals("admin3", masterBoard.getAdminId());
        Assert.assertEquals('1', masterBoard.getMbCategory());
        Assert.assertEquals("공지사항 제목", masterBoard.getMbTitle());
        Assert.assertEquals("공지사항 세부 내역",masterBoard.getMbText());
    }

    @Test
    public void testUpdateMasterBoard() throws Exception{

        MasterBoard masterBoard = siteService.getMasterBoard(10004);

        Assert.assertEquals("admin3", masterBoard.getAdminId());
        Assert.assertEquals('1', masterBoard.getMbCategory());
        Assert.assertEquals("공지사항 제목", masterBoard.getMbTitle());
        Assert.assertEquals("공지사항 세부 내역",masterBoard.getMbText());

        masterBoard.setAdminId("admin4");
        masterBoard.setMbCategory('3');
        masterBoard.setMbTitle("공지사항 제목 수정");
        masterBoard.setMbText("공지사항 세부 내역 수정 ");

        siteService.updateMasterBoard(masterBoard);

        masterBoard = siteService.getMasterBoard(10004);

        //==> console Ȯ��
        //System.out.println(user);

        //==> API Ȯ��
        Assert.assertEquals("admin4", masterBoard.getAdminId());
        Assert.assertEquals('3', masterBoard.getMbCategory());
        Assert.assertEquals("공지사항 제목 수정", masterBoard.getMbTitle());
        Assert.assertEquals("공지사항 세부 내역 수정",masterBoard.getMbText());
    }

    @Test
    public void testListMasterBoardAll() throws Exception{

        Search search = new Search();
        search.setCurrentPage(1);
        search.setPageSize(5);

        Map<String,Object> map = siteService.listMasterBoard(search);

        List<Object> list = (List<Object>)map.get("List");

        //Assert.assertEquals(3, list.size());

        //==> console Ȯ��
        System.out.println(list);

        Integer totalCount = (Integer)map.get("totalCount");
        System.out.println(totalCount);

        System.out.println("=======================================");

        search.setCurrentPage(1);
        search.setPageSize(5);
        search.setSearchCondition("1");
        search.setSearchKeyword("");
        map = siteService.listMasterBoard(search);

        list = (List<Object>)map.get("list");
        //Assert.assertEquals(3, list.size());

        //==> console Ȯ��
        //System.out.println(list);

        totalCount = (Integer)map.get("totalCount");
        System.out.println(totalCount);
    }

    @Test
    public void testAddCommuReport() throws Exception {
        CommunityReport commReport = new CommunityReport();

        commReport.setBoardNo(10003);
        commReport.setBoardCategory("03");
        commReport.setReportId("user04");
        commReport.setReportedId("user05");
        commReport.setReportBasis('6');
        commReport.setReportText("게시글에 정치적 발언이 포함되었어요");

        siteService.addCommunityReport(commReport);

        /*
        commReport = siteService.getCommunityReport(10002);

        //System.out.println(masterBoard);

        Assert.assertEquals("admin3", commReport.getAdminId());
        Assert.assertEquals("02", commReport.getBoardCategory());
        Assert.assertEquals("user02", commReport.getReportId());
        Assert.assertEquals("user03", commReport.getReportedId());
        Assert.assertEquals("게시글에 욕설이 포함되었어요", commReport.getReportText());

         */
    }

    @Test
    public void testGetCommuReport() throws Exception {
        CommunityReport commReport = new CommunityReport();

        commReport = siteService.getCommunityReport(10000);

        //==> console Ȯ��
        System.out.println(commReport);

        //==> API Ȯ��
        //Assert.assertEquals("admin3", masterBoard.getAdminId());
        //Assert.assertEquals('1', masterBoard.getMbCategory());
        //Assert.assertEquals("공지사항 제목", masterBoard.getMbTitle());
        //Assert.assertEquals("공지사항 세부 내역",masterBoard.getMbText());
    }

    @Test
    public void testUpdateCommuReport() throws Exception{
        CommunityReport commReport = siteService.getCommunityReport(10000);

        commReport.setPpt(5);

        siteService.processCommunityReport(commReport);;

        commReport = siteService.getCommunityReport(10000);

        //==> console Ȯ��
        System.out.println(commReport);
    }

    @Test
    public void testListCommunityReportAll() throws Exception{

        Search search = new Search();
        search.setCurrentPage(1);
        search.setPageSize(3);

        Map<String,Object> map = siteService.listCommunityReport(search);

        List<Object> list = (List<Object>)map.get("List");

        //Assert.assertEquals(3, list.size());

        //==> console Ȯ��
        System.out.println(list);

        Integer totalCount = (Integer)map.get("totalCount");
        System.out.println(totalCount);

        System.out.println("=======================================");

        search.setCurrentPage(1);
        search.setPageSize(2);
        search.setSearchCondition("1");
        search.setSearchKeyword("");
        map = siteService.listCommunityReport(search);

        list = (List<Object>)map.get("list");
        //Assert.assertEquals(3, list.size());

        //==> console Ȯ��
        //System.out.println(list);

        totalCount = (Integer)map.get("totalCount");
        System.out.println(totalCount);
    }

    @Test
    public void testListCommunityReportProcessAll() throws Exception{

        Search search = new Search();
        search.setCurrentPage(1);
        search.setPageSize(3);

        Map<String,Object> map = siteService.listCommunityReportProcess(search);

        List<Object> list = (List<Object>)map.get("list");

        //Assert.assertEquals(3, list.size());

        //==> console Ȯ��
        System.out.println(list);

        Integer totalCount = (Integer)map.get("totalCount");
        System.out.println(totalCount);

        System.out.println("=======================================");

        search.setCurrentPage(1);
        search.setPageSize(2);
        search.setSearchCondition("1");
        search.setSearchKeyword("");
        map = siteService.listCommunityReportProcess(search);

        list = (List<Object>)map.get("list");
        //Assert.assertEquals(3, list.size());

        //==> console Ȯ��
        //System.out.println(list);

        totalCount = (Integer)map.get("totalCount");
        System.out.println(totalCount);
    }

    @Test
    public void testAddClubReport() throws Exception {
        ClubReport clubReport = new ClubReport();

        clubReport.setClubNum(10002);
        clubReport.setReportId("user02");
        clubReport.setCrBasis("1");
        clubReport.setReportText("다단계 모임");
        clubReport.setAdminId("admin01");

        siteService.addClubReport(clubReport);
    }

    @Test
    public void testGetClubReport() throws Exception {
        ClubReport clubReport = new ClubReport();

        Club club = new Club();
        clubReport.setClubNum(10002);
        clubReport = siteService.getClubReport(10001);

        //==> console Ȯ��
        System.out.println(clubReport);
    }

    @Test
    public void testUpdateClubReport() throws Exception{
        ClubReport clubReport = siteService.getClubReport(10001);

        clubReport.setReportResult("대기");

        siteService.processClubReport(clubReport);;

        clubReport = siteService.getClubReport(10001);

        //==> console Ȯ��
        System.out.println(clubReport);
    }

    @Test
    public void testUpdateClubRereport() throws Exception{
        ClubReport clubReport = siteService.getClubReport(10001);

        clubReport.setRereportResult("대기");
        clubReport.setRereportText("상품 판매 모임이 아닌 사회적 기업 소개였습니다.");

        siteService.processClubRereport(clubReport);;

        clubReport = siteService.getClubReport(10001);

        //==> console Ȯ��
        System.out.println(clubReport);
    }
    @Test
    public void testListClubReportAll() throws Exception{

        Search search = new Search();
        search.setCurrentPage(1);
        search.setPageSize(3);

        Map<String,Object> map = siteService.listClubReport(search);

        List<Object> list = (List<Object>)map.get("list");

        //Assert.assertEquals(3, list.size());

        //==> console Ȯ��
        System.out.println(list);

        Integer totalCount = (Integer)map.get("totalCount");
        System.out.println(totalCount);

        System.out.println("=======================================");

        search.setCurrentPage(1);
        search.setPageSize(2);
        search.setSearchCondition("1");
        search.setSearchKeyword("");
        map = siteService.listClubReport(search);

        list = (List<Object>)map.get("list");
        //Assert.assertEquals(3, list.size());

        //==> console Ȯ��
        //System.out.println(list);

        totalCount = (Integer)map.get("totalCount");
        System.out.println(totalCount);
    }
 }
