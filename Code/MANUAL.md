DataBase COMP322004
Team1's Project
Phase 3.

Project Name : X-mall
***
# 본 과제는 이클립스 EE를 통해 진행함

# 실행하기 (추가과제 항목에 톰켓 등을 다 설치한것을 전제로함)
## 서버 설정
<img width="787" alt="signup" src="https://user-images.githubusercontent.com/39138853/49473217-cb817380-f854-11e8-88b4-9ad0184f39ec.PNG">
기존 프로젝트에 Servers폴더나 서버 폴더가 있다면 삭제하고 밑의 Server탭에 add버튼을 클릭한다

<img width="787" alt="signup" src="https://user-images.githubusercontent.com/39138853/49473225-cf14fa80-f854-11e8-9eb9-16063978faf3.PNG">
tomcat8.5 서버를 선택한다

<img width="787" alt="signup" src="https://user-images.githubusercontent.com/39138853/49473228-d0debe00-f854-11e8-8ff3-eb317bd7b7f7.PNG">
/usr/share/tomcat8 폴더를 지정해준다

## 실행하기
<img width="787" alt="signup" src="https://user-images.githubusercontent.com/39138853/49473229-d2a88180-f854-11e8-8e39-760be2b674ef.PNG">
MainForm.jsp에서 프로젝트를 시작한다


# 1. 회원 관련 기능

## A. 회원 가입

<img width="787" alt="signup" src="https://user-images.githubusercontent.com/30919143/49351885-c60f1680-f6f8-11e8-89ab-231bbb73dd68.png">

+ 회원 가입은
+ 아이디 (숫자 11자리 이내)

+ 비밀번호

+ 비밀번호 확인

+ 주소

+ 휴대전화

+ 성별

+ 나이 (0 = 비공개)

+ 직업

을 받는다.

- 아이디는 중복 확인을 할 수 있다.
<img width="793" alt="not_permit_id" src="https://user-images.githubusercontent.com/30919143/49354820-18a3ff00-f708-11e8-9f82-37b28bb16ef5.png">

- 아이디가 중복되었을 경우에, 허용되지 않는 아이디라고 알려주는 페이지로 연결된다.


## B. 회원 정보 수정

<img width="800" alt="modified profile" src="https://user-images.githubusercontent.com/30919143/49351889-c6a7ad00-f6f8-11e8-96c1-046b9deab980.png">

- 등록되어 있는 회원의 정보를 수정할 수 있다.
- 회원 가입 때 사용했던, 주소, 휴대전화, 성별, 나이, 직업이 변경 가능하다.

- 단, 아이디는 고유의 값이기 때문에 수정이 불가하다.


## C. 비밀 번호 수정

<img width="800" alt="modified profile" src="https://user-images.githubusercontent.com/30919143/49351889-c6a7ad00-f6f8-11e8-96c1-046b9deab980.png">

- 아이디와 별개로 비밀번호는 수정 가능하다.
- 다만 수정을 할 경우, 비밀번호 란과 비밀번호 확인란이 같을 때에만 수정이 가능하다.


## D. 로그인

<img width="800" alt="login" src="https://user-images.githubusercontent.com/30919143/49351883-c60f1680-f6f8-11e8-8bff-8c4d0d662e01.png">

- 로그인은 아이디, 비밀번호를 입력 받고, CUSTOMER Table을 참고하여 아이디와 비밀번호가 일치한다면 로그인이 가능하다.


## E. 관리자 계정

<img width="799" alt="admin_login" src="https://user-images.githubusercontent.com/30919143/49422635-fc6f9300-f7d7-11e8-97d4-8850f10ff4d2.png">

- 관리자 계정은 일반 유저들의 계정과는 다르게 음수 값으로 설정하였다.

<img width="795" alt="admin_connect" src="https://user-images.githubusercontent.com/30919143/49422634-fc6f9300-f7d7-11e8-8963-2e935ba08d6a.png">

- 관리자 계정으로 로그인을 하면,
관리자 계정인 것을 알려주고, 상단의 메뉴 탭도 관리자 용 메뉴가 보인다.


# 2. 물품 관련 기능

## A. 카테고리 리스트 보기

<img width="793" alt="category_m" src="https://user-images.githubusercontent.com/30919143/49351890-c6a7ad00-f6f8-11e8-82b7-64a9063666fa.png">

- 카테고리 란에 들어오면, 대분류 | 소분류로 나뉘어진 화면이 나온다.

<img width="798" alt="category_s" src="https://user-images.githubusercontent.com/30919143/49354984-d929e280-f708-11e8-91c2-c8bde2c4a078.png">

- 소분류를 클릭하게 되면, 해당 소분류에 있는 상품들이 보여진다.


## B. 상품 검색

<img width="807" alt="search_a" src="https://user-images.githubusercontent.com/30919143/49352452-50587a00-f6fb-11e8-8f40-7b6d04c7e623.png">
상품 검색은,
* 상품 이름
* 상품 번호
* 생산자
* 판매자
를 통해 검색한다.

<img width="799" alt="search_b" src="https://user-images.githubusercontent.com/30919143/49352453-50587a00-f6fb-11e8-885f-2519e57697b3.png">

* ItemDAO를 통해 쿼리문을 실행한다. Mysql의 쿼리문을 통해 결과 값을 반환 받는다.
* ItemBean의 리스트에 각 정보가 저장된다.

## C. 상품과 장바구니 연동

<img width="789" alt="add_item" src="https://user-images.githubusercontent.com/30919143/49436788-59ca0b00-f7fd-11e8-8c83-8cee848bb90b.png">

- 상품 창에서 장바구니에 넣을 매수를 선택한다.

<img width="753" alt="select sb" src="https://user-images.githubusercontent.com/30919143/49436791-5a62a180-f7fd-11e8-97d6-b36da83f7842.png">

- 상품을 넣을 장바구니를 결정한다.

<img width="772" alt="add sb" src="https://user-images.githubusercontent.com/30919143/49436787-59317480-f7fd-11e8-9ffc-ab3d32670620.png">

- 만약, 장바구니를 추가하고 싶다면 해당 화면에서 추가 가능하다.

<img width="756" alt="select sb_b" src="https://user-images.githubusercontent.com/30919143/49436792-5afb3800-f7fd-11e8-8fa6-dac3fa72ea11.png">

- 돌아가기를 누르면, 전에 선택했던 상품의 Id와 수량을 계속 저장하고 있다.
때문에 장바구니에 넣는 과정을 그대로 지속할 수 있다.

<img width="752" alt="notify add to sb" src="https://user-images.githubusercontent.com/30919143/49436789-59ca0b00-f7fd-11e8-90b4-716f23116624.png">

- 넣고 싶은 장바구니를 선택하면 추가가 되었다는 안내 페이지가 나온다.

<img width="752" alt="result of sb" src="https://user-images.githubusercontent.com/30919143/49436790-5a62a180-f7fd-11e8-879d-7f8bd7bed4ad.png">

- "장바구니 확인하기"를 누른다면, 적용된 결과를 확인할 수 있다.
(비어 있던 장바구니를 선택하여서 총 가격이 19,740원으로 된 것을 확인할 수 있다.)


## D. 재고 부족 물품 구매

<img width="789" alt="item_stock 0" src="https://user-images.githubusercontent.com/30919143/49438112-b24ed780-f800-11e8-8960-f7f2f2062823.png">

- 재고가 0일 경우, "장바구니에 담기" 버튼이 비활성화 된다.

<img width="773" alt="item_stock non zero" src="https://user-images.githubusercontent.com/30919143/49438111-b24ed780-f800-11e8-984a-3e0b28c7e692.png">

- 만약 재고보다 많은 양의 양을 주문할 경우

<img width="779" alt="over stock_sb" src="https://user-images.githubusercontent.com/30919143/49438116-b2e76e00-f800-11e8-866b-fef865842813.png">

- 해당 장바구니에서 해당 열을 빨간색으로 알려 준다.

<img width="770" alt="modify over stock" src="https://user-images.githubusercontent.com/30919143/49438113-b2e76e00-f800-11e8-89f2-8b73e62b5999.png">

- 해당 주문 내역을 클릭하면, 주문한 수량을 수정할 수 있다.

<img width="745" alt="notify modifcation" src="https://user-images.githubusercontent.com/30919143/49438114-b2e76e00-f800-11e8-81e2-c33fb8e9d701.png">

- "수정하기" 버튼을 누른 후, 수정이 되었다는 페이지로 연결된다.

<img width="758" alt="after sb" src="https://user-images.githubusercontent.com/30919143/49438110-b1b64100-f800-11e8-9415-73801014240c.png">

- 수정 후, 해당 장바구니에서 "구매하기" 버튼이 활성화 되며 구매를 진행할 수 있다.


# 3. 장바구니 관련 기능

## A. 장바구니 유지

<img width="795" alt="before logout" src="https://user-images.githubusercontent.com/30919143/49438824-c4317a00-f802-11e8-8f82-b2fea72be110.png">

- 로그 아웃 하기 전의 장바구니 내역들이다.

<img width="786" alt="again login" src="https://user-images.githubusercontent.com/30919143/49438822-c398e380-f802-11e8-87c3-5784462c40d5.png">

- 시간 차를 두고 로그 아웃 후, 로그인을 하였다.

<img width="797" alt="keep sb" src="https://user-images.githubusercontent.com/30919143/49438826-c4ca1080-f802-11e8-9b99-0412392a5ee4.png">

- 장바구니의 내역들이 그대로 유지되어 있다.


# 4. 구매 기능

## A. 장바구니 내 구매

<img width="770" alt="init sb" src="https://user-images.githubusercontent.com/30919143/49439312-0909e080-f804-11e8-81e1-f9a9203fd7d6.png">

- 장바구니 내에서만 "구매하기" 버튼이 존재한다.
- 상품 페이지에서는 "장바구니에 담기" 버튼만이 존재한다.
- 즉, 상품을 장바구니에 담아야지만 주문이 가능하다.

<img width="764" alt="buy sb" src="https://user-images.githubusercontent.com/30919143/49439305-05765980-f804-11e8-955b-0a6893c9d8de.png">

- 장바구니의 "구매하기" 버튼을 클릭 시, 구매가 되었다는 안내 페이지로 연결된다.

<img width="737" alt="update order list" src="https://user-images.githubusercontent.com/30919143/49439313-09a27700-f804-11e8-9266-abfabc9cde36.png">

- 구매를 한 정보를 "주문내역" 탭에서 확인 가능하다.
- 오늘 날짜 (12/4) 로 주문 날짜가 작성 되어진 것을 확인할 수 있다.


# 5. 관리자 기능

## P. 카테고리

<img width="790" alt="admin_item_info" src="https://user-images.githubusercontent.com/30919143/49422906-eadabb00-f7d8-11e8-9e25-40ae605aee26.png">

관리자 계정에서는 대분류 / 소분류 까지는 일반 유저와 똑같지만
상품의 상세 화면에서는 지역별로 재고량을 조절할 수 있는 관리 페이지가 나온다.

## A. 물품 재고 관리

<img width="790" alt="admin_item_info" src="https://user-images.githubusercontent.com/30919143/49422906-eadabb00-f7d8-11e8-9e25-40ae605aee26.png">

- 관리자 계정에서는 대분류 / 소분류 까지는 일반 유저와 똑같지만
- 상품의 상세 화면에서는 지역별로 재고량을 조절할 수 있는 관리 페이지가 나온다.

<img width="778" alt="admin_info_a" src="https://user-images.githubusercontent.com/30919143/49424503-1dd37d80-f7de-11e8-97aa-1f337f4c1e7b.png">

- 상품 정보에 대한 페이지로 가게 되면, 일반 유저와 다르게 재고를 조절할 수 있는 페이지가 나온다.

<img width="794" alt="admin_info_m" src="https://user-images.githubusercontent.com/30919143/49424506-1f04aa80-f7de-11e8-8280-a6001ea3d9b7.png">

- 재고를 조절하면, 제고가 조절되었다는 것을 알려주고
* 카테고리로
* 상품으로
- 두 가지의 선택지를 선택할 수 있다.

<img width="797" alt="admin_info_b" src="https://user-images.githubusercontent.com/30919143/49424504-1f04aa80-f7de-11e8-84ee-d7bdd4e66a99.png">

- "상품으로"를 선택한다면, 수정했던 상품 정보 페이지로 이동한다.
- 카테고리를 선택한다면, 카테고리 페이지로 이동한다.

## B. 재고 부족

<img width="780" alt="lack_item" src="https://user-images.githubusercontent.com/30919143/49435011-f2aa5780-f7f8-11e8-8083-c2a969321eb0.png">

- 재고부족 탭으로 들어가면, 재고가 부족한 아이템의 리스트를 볼 수 있다.

<img width="779" alt="lack_item_info" src="https://user-images.githubusercontent.com/30919143/49435013-f342ee00-f7f8-11e8-8a0b-0ef2641556fc.png">

- 상품을 클릭하면, 상품의 재고를 수정할 수 있는 페이지로 연결된다.

## C. 매출 확인

<img width="792" alt="revenue_when" src="https://user-images.githubusercontent.com/30919143/49435427-effc3200-f7f9-11e8-8f88-874685951a78.png">

- 매출을 확인할 시작일과 종료일을 입력 받는다.

<img width="787" alt="revenue" src="https://user-images.githubusercontent.com/30919143/49435426-effc3200-f7f9-11e8-9f3c-f82cd643072f.png">

- 시작일과 종료일까지의 매출 총액을 보여준다.


# 추가 과제

## 1. 웹 데이터 베이스 프로그램

<img width="371" alt="jsp 1" src="https://user-images.githubusercontent.com/30919143/49459564-ac71ea00-f832-11e8-86dc-8d63dc730302.png">

<img width="363" alt="jsp 2" src="https://user-images.githubusercontent.com/30919143/49459565-ad0a8080-f832-11e8-91fa-c2d66e8b2a14.png">

- 이클립스를 기반으로 하여 JSP로 웹 데이터 베이스 프로그램을 제작하였다.


### 1. Mysql 설치 (Ubuntu)

<https://www.digitalocean.com/community/tutorials/how-to-install-mysql-on-ubuntu-18-04>

<img width="730" alt="mysql-server" src="https://user-images.githubusercontent.com/30919143/49461159-64ed5d00-f836-11e8-9f4d-6e41478846ed.png">

<pre><code>#sudo apt install mysql-server</code></pre>


### 2. JSP 설정

<https://blog.lael.be/post/858>

<pre><code>#apt-get update</code></pre>

- 패키지 목록 갱신

<pre><code>#apt-get install openjdk-8-jre-headless</code></pre>

- 자바 해석기 설치

<pre><code>#apt-get install openjdk-8-jdk</code></pre>

- 자바 컴파일러 설치

<pre><code>#java -version</code></pre>

<img width="689" alt="java -v" src="https://user-images.githubusercontent.com/30919143/49460577-fc51b080-f834-11e8-9efb-82004e102503.png">

- 자바 해석기 버전 확인
- openjdk version이 "1.8.0_191"이 나옴.

<pre><code>#javac -version</code></pre>

<img width="426" alt="javac -v" src="https://user-images.githubusercontent.com/30919143/49460578-fcea4700-f834-11e8-837f-e7d3e08cc15e.png">

- 자바 컴파일러 버전 확인
- "javac 1.8.0_191"이 나옴


### Tomcat8 설치

<pre><code>#apt-get install tomcat8</code></pre>

- Apache Tomcat8 설치

<pre><code>#/usr/share/tomcat8/bin/version.sh</code></pre>

<img width="726" alt="tomcat version" src="https://user-images.githubusercontent.com/30919143/49460496-c57b9a80-f834-11e8-885e-34d6ca823a7f.png">

- 설치된 tomcat 버전 확인

<pre><code>#apt-get install libmysql-java</code></pre>

- Java에서 MYSql DB와 Connect 하는 드라이버를 설치해야 한다.
- /usr/share/java/mysql-connector-java.jar 위치에 connector 가 설치된다.

<pre><code>#ln -s /usr/share/javamysql-connector-java.jar /usr/share/tomcat8/lib/mysql-connector-java.jar</code></pre>

- Tomcat8 라이브러리 폴더에 심볼릭 링크 생성

<pre><code>#service tomcat8 restart</code></pre>

-Tomcat8 재시작


<https://stackoverflow.com/questions/30962732/could-not-load-the-tomcat-server-configuration/34575819>

<pre><code>cd /usr/share/tomcat8
sudo ln -s /var/lib/tomcat8/conf conf
sudo ln -s /var/log/tomca87 log
sudo ln -s /etc/tomcat8/policy.d/03catalina.policy conf/catalina.policy
sudo chmod -R a+rwx /usr/share/tomcat7/conf</code></pre>

- 추가적인 심볼릭 링크 생성

## 3. 신규 고객 추천 서비스

<img width="791" alt="recommend" src="https://user-images.githubusercontent.com/30919143/49461671-94509980-f837-11e8-805b-acf1625deed1.png">

- 신규 고객이 로그인을 하면 고객에게 맞는 상품을 추천하는 시스템을 구현하였다.
- mahout을 활용해보려 했으나,,, 실패

## 4. Github 사용

<https://github.com/HotsChef/X-mall>

<img width="652" alt="git" src="https://user-images.githubusercontent.com/30919143/49461148-63bc3000-f836-11e8-9133-7cc62537de51.png">

<img width="729" alt="git setting" src="https://user-images.githubusercontent.com/30919143/49461156-6454c680-f836-11e8-8f88-b5502314c81d.png">

# 오류 해결
## jsp 파일에 cannot resolved 에러가 뜰때
Web 폴더를 우클릭하면 Build Path > Configure Build Path 버튼을 누른다.
Library 탭에 들어간다.
JRE System Library을 선택하고 Edit을 클릭
alternate JRE선택바를 클릭하여 해당 JDK버전을 선택한다.
<http://zanywitch.tistory.com/79>

## 로컬 호스트 에러가 뜰때
<img width="729" alt="git setting" src="https://user-images.githubusercontent.com/39138853/49473232-d3d9ae80-f854-11e8-8d17-e501cac7e1c7.PNG">
터미널 창을 열어
$sudo service tomcat8 stop
을 입력한다
