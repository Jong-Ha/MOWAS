<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
                <div class="modal-header">
                    <h5 class="modal-title">${kickoutCheck=='T'?'모임원 강퇴':'모임 탈퇴'}</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form>
                        <input type="hidden" name="kickoutCheck" value="${kickoutCheck}">
                        <input type="hidden" name="clubUserNum" value="${cluber.clubUserNum}">
                        <input type="hidden" id="clubNum" name="clubNum" value="${cluber.clubNum}">
                        <input type="hidden" name="userId" value="${cluber.user.userId}">
                        <div class="form-floating mb-3">
                            <input type="text" class="form-control" id="userId" placeholder="userId" name="userId" readonly value="${cluber.user.userId}">
                            <label for="userId">아이디</label>
                        </div>

                            <div class="form-floating">
                                <textarea class="form-control" placeholder="clubOutText" id="clubOutText" name="clubOutText"
                                          style="height: 200px;">${cluber.clubOutText}</textarea>
                                <label for="clubOutText">${kickoutCheck=='T'?'강퇴 사유':'탈퇴 사유'}</label>
                            </div>
                    </form>
                </div>
                <div class="modal-footer" style="display: block">
                    <input type="button" class="deleteCluber btn btn-primary" value="${kickoutCheck=='T'?'강퇴':'탈퇴'}">
                </div>
