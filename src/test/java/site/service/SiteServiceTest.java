package site.service;

import com.project.common.Page;
import com.project.common.Search;
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
        Page page = new Page();
        page.setCurrentPage(1);
        page.setPageSize(3);
        Map<String,Object> map = siteService.listMasterBoard(search);

        List<Object> list = (List<Object>)map.get("mbList");
        Assert.assertEquals(3, list.size());

        //==> console Ȯ��
        //System.out.println(list);

        Integer totalCount = (Integer)map.get("totalCount");
        System.out.println(totalCount);

        System.out.println("=======================================");

        page.setCurrentPage(1);
        page.setPageSize(3);
        search.setSearchCondition("0");
        search.setSearchKeyword("");
        map = siteService.listMasterBoard(search);

        list = (List<Object>)map.get("mblist");
        Assert.assertEquals(3, list.size());

        //==> console Ȯ��
        //System.out.println(list);

        totalCount = (Integer)map.get("totalCount");
        System.out.println(totalCount);
    }
 }
