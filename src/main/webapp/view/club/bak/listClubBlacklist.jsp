<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>listClubBlacklist</title>
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script>
        $(function () {
            //상태 변경
            $(".updateClubBlacklist").on("click", function () {
                var process = "F"
                if ($(this).val() == '등록') {
                    process = "T";
                }
                $("form").attr("method", "post").attr("action", "/club/updateClubBlacklist/" + process).submit()
            })

            //상세 조회
            $(".getClubBlacklist").on("click", function () {
                var clubUserNum = $(this).parents(".each").find("[name='clubUserNum']").val()
                var div = $(this).parents(".each").find(".blacklistText")
                var me = $(this)
                $.ajax({
                    url: "/club/json/getClubBlacklist",
                    method: "POST",
                    data: JSON.stringify({
                        "clubUserNum": clubUserNum
                    }),
                    dataType: "JSON",
                    headers: {
                        "Accept": "application/json",
                        "Content-Type": "application/json; charset=UTF-8"
                    },
                    success: function (map) {
                        // alert(map.blacklistText)
                        div.html("<h4>" + map.blacklistText + "</h4>")
                        me.val("사유 숨기기")
                        me.off("click")
                        me.on("click", function () {
                            if (me.val() == "사유 숨기기") {
                                me.val("사유보기")
                            } else {
                                me.val("사유 숨기기")
                            }
                            div.toggle()
                        })
                    }
                })
            })

            //검색 조건
            $("#searchCondition").on("change", function () {
                fncListClubBlacklist(1)
            })

            //페이징
            $(".paging").on("click", function () {
                fncListClubBlacklist($(this).text())
            })

            //리스트 조회 function
            function fncListClubBlacklist(currentPage) {
                if (currentPage === 0) {
                    currentPage = 1
                }
                $("#currentPage").val(currentPage)
                $("form").attr("action", "/club/listClubBlacklist/${clubNum}").attr("method", "post").submit()
            }
        })
    </script>
</head>
<body>
<form>
    <label>
        <select name="searchCondition" id="searchCondition">
            <option ${empty search.searchCondition?'selected':search.searchCondition == '0'?'selected':''} value="0">전체 검색</option>
            <option ${search.searchCondition == '1'?'selected':''} value="1">현재 등록 상태</option>
            <option ${search.searchCondition == '2'?'selected':''} value="2">등록 취소</option>
        </select>
    </label>
    <c:forEach items="${list}" var="clubBlacklist">
        <div class="each">
            <label>
                <input type="checkbox" name="clubUserNum" value="${clubBlacklist.clubUserNum}">
                    ${clubBlacklist}
            </label>
            <input type="button" class="getClubBlacklist" value="사유보기">
            <div class="blacklistText"></div>
        </div>
    </c:forEach>
    <input type="hidden" name="clubNum" value="${clubNum}">
    <c:forEach begin="${resultPage.beginUnitPage}" end="${resultPage.endUnitPage}" var="i">
        <span class="paging">${i}</span>
    </c:forEach>
    <label>
        <input type="hidden" id="currentPage" name="currentPage" value="1">
    </label>
</form>
<input type="button" class="updateClubBlacklist" value="등록">
<input type="button" class="updateClubBlacklist" value="취소">
</body>
</html>
