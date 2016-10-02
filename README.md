# hello MVC #
hello MVC는 기본적인 회원가입, 로그인 기능이 있는 웹 프로젝트입니다.

* 사용 언어 및 라이브러리: Java, Sevlet, JSP, Lombok, JSTL
* 빌드 스크립트: Maven
* 개발 환경: Windows 10, STS 3.7.3 (Eclipse Mars.2, Lombook), JDK 1.8.0, Tomcat 8,

## 목차 ##
1. [사용법](#how-to-use)
2. [프로젝트 구성](#project-structure)
3. [클래스 설명](#class-info)

<a name="how-to-use"></a>
## 1. 사용법 ##
### 회원가입 ###
1. 웹 브라우저로 **/helloMVC/index.jsp**으로 접속합니다.
2. **go to register page** 링크를 클릭해 회원가입 폼으로 이동합니다.
3. 회원가입 폼에 아이디, 비밀번호, 이름, 성별, 이메일을 작성 후 register 버튼을 눌러 회원가입 신청을 합니다.
4. 정상적으로 회원가입이 된 경우 가입한 정보가 나타납니다. <br/>
만약 회원가입이 정상적으로 되지 않은 경우(아이디 중복이나 필수 데이터 누락) 에러 메시지가 나타나게 됩니다.

### 로그인 ###
1. 웹 브라우저로 **/helloMVC/index.jsp**으로 접속합니다.
2. **go to login page** 링크를 클릭해 로그인 폼으로 이동합니다.
3. 회원가입 했던 아이디, 비밀번호를 입력 후 login 버튼 눌러 로그인합니다.
4. 정상적으로 로그인이 된 경우 a logged in successfully가 나타납니다. <br/>
만약 로그인을 실패한 경우 Login failed 메시지가 나타나게 됩니다.

<a name="project-structure"></a>
## 2. 프로젝트 구성##
```
helloMVC/
├── src/
│   ├── controller/
│   │   ├── DoLogin.java
│   │   ├── DoRegister.java
│   │   └── Home.java
│   ├── model/
│   │   └── Customer.java
│   └── service/
│       └── CustomerService.java
├── webContent/
│   ├── META-INF/
│   │   └── MANIFEST.MF
│   ├── WEB-INF/
│   │   └── web.xml
│   ├── view/
│   │   ├── error.jsp
│   │   ├── help.jsp
│   │   ├── loginFail.jsp
│   │   ├── loginForm.jsp
│   │   ├── loginSuccess.jsp
│   │   ├── registerForm.jsp
│   │   └── registerSuccess.jsp
│   └── index.jsp
└── pom.xml
```

* Controller: **/src/controller/**, [Servlet](https://ko.wikipedia.org/wiki/%EC%9E%90%EB%B0%94_%EC%84%9C%EB%B8%94%EB%A6%BF)
* Model: **/src/model/**, [JavaBeans](https://en.wikipedia.org/wiki/JavaBeans)
* View: **/webContent/view/**, [JSP](https://ko.wikipedia.org/wiki/%EC%9E%90%EB%B0%94%EC%84%9C%EB%B2%84_%ED%8E%98%EC%9D%B4%EC%A7%80)

<a name="class-info"></a>
## 3. 클래스 설명 ##
### Home (Controller) ###
로그인 폼, 회원가입 폼에 대한 Controller 부분으로 GET 방식으로만 요청을 받으며
request의 action 파라메타로 보여질 뷰를 선택합니다.

action이 login이면 loginForm.jsp, register이라면 registerForm.jsp으로 포워딩하게 됩니다.

### DoRegister (Controller) ###
회원 가입 요청을 담당하는 Controller로 POST 방식으로만 회원 가입 요청을 받습니다.

Customer 빈에 사용자가 입력한 파라미터를 넣으며 CustomerService의 addCustomer 메소드를 이용해 사용자를 등록합니다.

이후 addCustomer의 반환값을 통해 회원가입이 정상적으로 됬는지 여부를 판단하며
정상적으로 처리된 경우 registerSuccess.jsp로 뷰을 연결시키고 회원가입 정보를 사용자에게 보여줍니다.

만약 회원가입이 정상적으로 처리되지 않았다면 error.jsp로 뷰를 연결시켜 오류를 나타냅니다.

### DoRegister (Controller) ###
로그인 처리를 담당하는 Controller로 POST 방식으로만 회원 가입 요청을 받습니다.

CustomerService의 login 메소드를 이용해 사용자의 정보를 가져옵니다.

로그인에 성공해 정상적으로 사용자 정보를 가져온 경우 뷰를 loginSuccess.jsp으로 보여주며,
로그인 실패시 loginFail.jsp으로 뷰를 연결합니다.

### CustomerService ###
회원에 관련된 서비스를 제공합니다.

사용자 정보는 Map<String, Customer> 타입의 customers에 저장되며 [싱글톤 패턴](https://ko.wikipedia.org/wiki/%EC%8B%B1%EA%B8%80%ED%84%B4_%ED%8C%A8%ED%84%B4)을 적용하여 하나의 인스턴트로 각 컨트롤러에서 사용하게 됩니다.

#### 메소드 설명 ####
* boolean addCustomer(Customer customer): customers에 사용자를 등록, 등록 여부를 반환
* Customer findCustomer(String id): customers에 있는 사용자를 조회, 찾은 사용자 정보를 반환
* Customer login(String id, String password): id와 password가 일치하는 사용자 조회, 해당 조건에 일치하는 사용자 정보 반환
