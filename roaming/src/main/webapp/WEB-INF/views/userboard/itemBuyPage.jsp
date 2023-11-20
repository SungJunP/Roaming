<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
        rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <title>상품 구매 페이지</title>
</head>
<body>
    <form action="./insertItemBuyProcess" method="post">
        <div class="container-fluid">
            <div class="row border-bottom mb-5">
                <div class="col">
                    <%@ include file="../common/topNavi.jsp" %>
                </div>
            </div>
            <div class="row mt-5">
                <div class="col-2"></div>
                <div class="col-5">
                    <div class="row">
                        <div class="col fw-semibold fs-2">
                            구매하기
                        </div>
                    </div>
                    <div class="row mt-5 border-bottom pb-3">
                        <div class="col fw-semibold fs-4">
                            상품정보
                        </div>
                    </div>
                    <div class="row mt-4">
                        <div class="col-2 pe-0">
                            <img src="/uploadFiles/${itemBuy.itemDto.item_thumbnail}" width="100px" height="100px">
                        </div>
                        <div class="col ps-0">
                            <div class="row">
                                <div class="col fw-semibold fs-6">
                                    ${itemBuy.itemDto.item_name}
                                    <input type="hidden" name="item_name" value="${itemBuy.itemDto.item_name}">
                                    <input type="hidden" name="id" value="${itemBuy.itemDto.id}">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row mt-5 border-bottom pb-3">
                        <div class="col fw-semibold fs-4">
                            배송 정보
                        </div>
                    </div>
                    <div class="row mt-3 pb-4">
                        <div class="col-5">
                            <div class="card" style="width: 50rem; height: 3rem;">
                                <div class="row fw-semibold">
                                    <div class="col">
                                        배송지
                                    </div>
                                    <div class="col">
                                        <input type="text" name="address" style="background: none; border: none;">
                                    </div>
                                </div>
                            </div>
                            <div class="card" style="width: 50rem; height: 3rem;">
                                <div class="row fw-semibold">
                                    <div class="col">
                                        이름
                                    </div>
                                    <div class="col">
                                        ${sessionUser.user_name}
                                        <input type="hidden" name="user_name" value="${sessionUser.user_name}">
                                        
                                        <input type="hidden" name="id" value="${itemBuy.itemDto.id}">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-2"></div>
                </div>
                <div class="col-3 ps-4 mt-5" id="paymentInfo">
                    <div class="card">
                        <div class="card-body">
                            <div class="row ms-1 me-1 mt-2 border-bottom pb-2">
                                <div class="col fw-semibold fs-5">
                                    결제정보
                                </div>
                            </div>
                            <div class="row mt-3 ms-1 me-1">
                                <div class="col text-primary fw-semibold pt-2">
                                    총 결제금액
                                </div>
                                <div class="col text-primary fs-3 text-end fw-semibold">
                                    <span class="text-primary fs-3 text-end fw-semibold" id="totalPrice"></span>
                                </div>
                            </div>
                            <div class="row mt-3 ms-1 me-1">
                                <div class="col d-grid">
                                    <div class="text-center">
                                        <button class="btn btn-primary" type="submit">
                                            ${itemBuy.itemDto.item_price}P 결제하기
                                        </button>
                                        <input type="hidden" name="item_price" value="${itemBuy.itemDto.item_price}">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
