DataBase COMP322004 
Team1's Project 
Phase 3.

Project Name : X-mall
***


# 1. 회원 관련 기능

##  A. 회원 가입

<img width="787" alt="signup" src="https://user-images.githubusercontent.com/30919143/49351885-c60f1680-f6f8-11e8-89ab-231bbb73dd68.png">

회원 가입은
-  아이디 (숫자 11자리 이내)

-  비밀번호

-  비밀번호 확인

-  주소

-  휴대전화

-  성별

-  나이 (0 = 비공개)

-  직업

을 받는다.

아이디는 중복 확인을 할 수 있다.
<img width="793" alt="not_permit_id" src="https://user-images.githubusercontent.com/30919143/49354820-18a3ff00-f708-11e8-9f82-37b28bb16ef5.png">

아이디가 중복되었을 경우에, 허용되지 않는 아이디라고 알려주는 페이지로 연결된다.


##    B. 회원 정보 수정

<img width="800" alt="modified profile" src="https://user-images.githubusercontent.com/30919143/49351889-c6a7ad00-f6f8-11e8-96c1-046b9deab980.png">

등록되어 있는 회원의 정보를 수정할 수 있다.
회원 가입 때 사용했던,
주소, 휴대전화, 성별, 나이, 직업이 변경 가능하다.

단, 아이디는 고유의 값이기 때문에 수정이 불가하다.


##    C. 비밀 번호 수정

<img width="800" alt="modified profile" src="https://user-images.githubusercontent.com/30919143/49351889-c6a7ad00-f6f8-11e8-96c1-046b9deab980.png">

아이디와 별개로 비밀번호는 수정 가능하다.
다만 수정을 할 경우, 비밀번호 란과 비밀번호 확인란이 같을 때에만 수정이 가능하다.


##    D. 로그인

<img width="800" alt="login" src="https://user-images.githubusercontent.com/30919143/49351883-c60f1680-f6f8-11e8-8bff-8c4d0d662e01.png">

로그인은 아이디, 비밀번호를 입력 받고, CUSTOMER Table을 참고하여 아이디와 비밀번호가 일치한다면 로그인이 가능하다.


##    E. 관리자 계정

<insert to Pic>
    

#   2. 물품 관련 기능

##  A. 카테고리 리스트 보기

<img width="793" alt="category_m" src="https://user-images.githubusercontent.com/30919143/49351890-c6a7ad00-f6f8-11e8-82b7-64a9063666fa.png">

카테고리 란에 들어오면, 대분류 | 소분류로 나뉘어진 화면이 나온다.

<img width="798" alt="category_s" src="https://user-images.githubusercontent.com/30919143/49354984-d929e280-f708-11e8-91c2-c8bde2c4a078.png">

소분류를 클릭하게 되면, 해당 소분류에 있는 상품들이 보여진다.

    
##  B. 상품 검색
<img width="807" alt="search_a" src="https://user-images.githubusercontent.com/30919143/49352452-50587a00-f6fb-11e8-8f40-7b6d04c7e623.png">
    상품 검색은,
    * 상품 이름
    * 상품 번호
    * 생산자
    * 판매자
    를 통해 검색한다.
    
<img width="799" alt="search_b" src="https://user-images.githubusercontent.com/30919143/49352453-50587a00-f6fb-11e8-885f-2519e57697b3.png">
검색은
#! code
<pre><code> printf("Hello World!"); </code></pre>
의 쿼리문으로 진행하고 결과를 GUI로 보여준다.

##  C. 물품에 대한 정보와 장바구니 연동
카테고리 분류
