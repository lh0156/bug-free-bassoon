<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/team3/asset/css/basket/basket.css">

<%@ include file="../inc/asset.jsp" %>
<style>
        #content {
            width: 100%;
            /* border: 1px solid black; */
            /* box-sizing: border-box; */
        }

        #container {
            width: 1000px;
            margin: 0 auto;
            /* border: 1px solid black; */
            /* box-sizing: border-box; */
        }

        #inc-footer {
            margin-top: 200px;
        }
    </style>
</head>

<head>

	<%@include file="/WEB-INF/views/inc/header.jsp" %>

    <!-- location -->
    <div id="inc-location">
        <div class="nowGrade">
            장바구니<span class="basketNumber">(1)</span>
        </div>

        <div class="Grade">
            <span class="oneRd">01 장바구니
                <i class="fas fa-angle-right" id="oneRdSimbol"></i>
            </span>

            <span class="twoRd">02 주문/결제
                <i class="fas fa-angle-right" id="twoRdSimbol"></i>
            </span>
            <span class="threeRd">
                03 주문완료
            </span>
        </div>
    </div>

    <!-- content  -->
    <div id="content">
        <div id="container">

            <table>
                <tr class="basketAttribute">
                    <th><input type="checkbox" class="checkAll"></th>
                    <th colspan="2">상품 정보</th>
                    <th>상품 금액</th>
                </tr>



                <tr class="basketProduct">
                    <!-- 2행 1열-->
                    <td><input type="checkbox" class="check" name="check"></td>
                    <!-- 2행 2열-->
                    <td class="productImgBox"><img src="../images/chickenBreast1.jpg" class="productImg"></td>
                    <!-- 2행 3열-->
                    <td class="productInfo">
                        <div class="productName">닭가슴살 스테이크 호박맛
                        </div>

                        <div class="productCount">
                            <di class="productNumber" style="color: #666;"> 100개</di>

                            <div class="productCountEdit">
                                <input type='button' onclick='count("minus")' value='-' />

                                <div id="result">1</div>

                                <input type='button' onclick='count("plus")' value='+' />
                            </div>
                        </div>
                    </td>


                    <td class="productPrice">
                        <div id="resultPrice">147,200원</div>
                    </td>
                </tr>
            </table>

            <div class="delList">
                <input type="button" class="del" value="선택삭제" onClick="delRow();" style="cursor: pointer;" >
                <div class="coment">장바구니에 담긴 상품은 최대 15일까지 저장됩니다.</div>
            </div>



            <div id="footer">
                <div class="allPrice">
                    <div class="allPriceTable">
                        <ul>
                            <li>
                                <div>상품금액</div>
                                <div id=resultPrice>147,200원</div>
                            </li>
                            <li><i class="fas fa-plus"></i></li>
                            <li>
                                <div>배송비</div>
                                <div>0원</div>
                            </li>
                            <li><i class="fas fa-equals"></i></li>
                            <li>
                                <div>결제 예상금액</div>
                                <div>147,200원</div>
                            </li>
                        </ul>
                    </div>
                </div>

                <div class="buttonList">
                    <!-- 메인 화면(Main)으로-->
                    <input type="button" value="쇼핑 계속하기" class="shopping" style="cursor: pointer;"
                        onClick="location.href='product.html'">
                    <!-- 결제 창(Pay)으로-->
                    <input type="button" value="주문하기" class="order" style="cursor: pointer;"
                        onClick="location.href='Pay.html'">
                </div>
            </div>
        </div>


    </div>
    </div>

    <!-- footer -->
    <%@include file="/WEB-INF/views/inc/footer.jsp" %>


    <script src='js/jquery-1.12.4.js'></script>
    <script src="js/jquery-ui.js"></script>

    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>

    <script>



        $('.checkAll').click(function () {
            if ($('.checkAll').is(':checked')) {
                $('.check').prop('checked', true);
            } else {
                $('.check').prop('checked', false);

            }
        });



        function count(type) {
            // 결과를 표시할 element
            const resultElement = document.getElementById('result');
            const resultPriceElement = document.getElementById('resultPrice');
            // 현재 화면에 표시된 값
            let number = resultElement.innerText;// 상품 갯수
            let resultPrice = resultElement.innerText;// 총 가격

            // 더하기/빼기
            if (type === 'plus') {
                number = parseInt(number) + 1;

            } else if (type === 'minus' && number != 1) {

                number = parseInt(number) - 1;

            }

            // 결과 출력
            resultElement.innerText = number;
        }

        function delRow() {
            // jquery를 사용한 방법
            var checkRows = $("[name='chkbox']:checked");
            for (var i = checkRows.length - 1; i > -1; i--) {

                checkRows.eq(i).closest('tr').remove();
            }
        }


    </script>
</body>

</html>