<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
    alert('${param}')
</script>
                <div class="modal-header">
                    <h5 class="modal-title">${param.kickoutCheck=='T'?'모임원 강퇴':'모임 탈퇴'}</h5>
                </div>
                <div class="modal-body">
                    <form>
                        <input type="hidden" name="kickoutCheck" value="${param.kickoutCheck}">
                        <input type="hidden" name="clubUserNum" value="${param.cluber.clubUserNum}">
                        <input type="hidden" id="clubNum" name="clubNum" value="${param.cluber.clubNum}">
                        <input type="hidden" name="userId" value="${param.cluber.user.userId}">
                        <div class="form-floating mb-3">
                            <input type="text" class="form-control" id="userId" placeholder="userId" name="userId" readonly value="${param.cluber.user.userId}">
                            <label for="userId">아이디</label>
                        </div>
                        <div class="form-floating">
                            <input type="text" class="form-control" id="clubOutText" placeholder="clubOutText" name="clubOutText" value="${param.cluber.clubOutText}">
                            <label for="clubOutText">${param.kickoutCheck=='T'?'강퇴 사유':'탈퇴 사유'}</label>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <input type="button" class="deleteCluber btn btn-primary" value="${param.kickoutCheck=='T'?'강퇴':'탈퇴'}">
                </div>
