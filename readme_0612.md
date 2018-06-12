### 1. 게시판 기능 구현

- 사용자의 입력을 받는 form 태그로 이루어진 / new 액션과 erb 파일
  - form의 action 속성은 /create로 가도록합니다.
  - method는 post를 이용합니다.
  - 게시판 글의 제목(title)과 본문(contents) 두가지 속성을 저장할 겁니다.
- 전체 목록을 보여주는 table 태그로 이루어진 /boards 액션과  erb 파일
  - 일단 파일만 만들어주세요
- /create 액션을 만들고 작성 후에는 /boards 액션으로 돌아가게 함
  - /create  액션이 동작한 이후 글 내용으로
- 각 글(2개의 글을 보는페이지)을 볼 수 있는 페이지는 /board/글번호의 형태로 작성함



### 2. 회원가입 폼 구현

### create와 Read

1. `get`/boards/new
2. `post`/boards/create
3. `get`/boards
4. `get`/board/:id

- `board` 라는 게시판이 하나 존재
- `user`라는 CRUD 기능을 해야하는 DB Table을 만든다고 가정하면?
- 새로운 유저를 등록한다면?



#### 과제

- `User`을 등록할 수 있는 CSV 파일 만들기

- id, password, password_confirmation

- 조건 1

  - password와 password_confirmation을 받는데 회원을 등록할 때 이 두 문자열이 다르면 회원 등록안됨

- Route(라우팅) : url을 연결해 줌

  - `get`/user/new  => new_user.erb

    : 아이디 생성

  - `post`/user/creates

    : 정상적인 가입로직으로 연결 OR error.erb로 연결하기

  - `get`/users  => users.erb

    : 회원가입 성공, 가입한 id, 전체 회원 목록 링크

  - `get`/user/:id   => user.erb

    : redirect "/board/#{id}"

  new board

  create/





## 3. Rails 버전 확인과 설치 

`$ gem rails -v 5.0.6`

`$ rvm install 2.4.1`

`$ rvm default 2.4.1`	: 위의 명령어 이후 `ruby -v`을 통해  확인해보고, 버전 변경이 안 됐을 때 강제로 버전 적용하기



`$ rails _5.0.6_ new test_app` : rails _(버전) _  new (proj 이름)



`$ rails s -p $PORT -o $IP` : 프로젝트 실행 명령어



#### gem install bundler

- 프로젝트에 사용될 모든 gem을 설치함

- 사용될 모든 gem은 `Gemfile`에 명시됨

- 사용할 `gem`을 명시했다면 터미널에 다음 명렬어을 입력한다

  `$ bundle install` 이 과정을 거치지 않는다면, 완벽하게 설치된 것이 아님

  *Gemfile*	

  ```ruby
  gem 'bootstrap-sass'
  ```

  *terminal*

  `$ bundle install`

- 사용하지 않게 된 Gem은 `Gemfile`에서 삭제한 이후에도 마찬가지로 `$ bundle install` 을 실행해야 됨



#### 만든 proj의 app 구성도 살펴보기

- 'app' - 'controllers', 'views', 'models'

- bin = binary  : 명령어들의 모음

- 'config' - 'routes.rb' 

  : 어떤 요청이 왔을 때, 어떤 로직이 실행될지를 설정함 

  (spring의 서비스스 느낌?)

- 'db'

  orm(Object Relational Mapping = Mapper)

  : db에 만들 table을 만들 때 columns 등의 설정을 이곳에서 함

- 'log' : 누가 접속했는지 기록이 남음

- 'public' : 외부에서 접근할 수 있는 폴더

- 'test' : controllers, models, views 폴더가 존재함

  TDD : 

- 'vendor' : template 사용할 때 사용할 예정

- Gemfile.lock : 각 gem들의 dependencies를 보여줌





### 오늘의 error

- `$ ruby app.rb(실행파일) -p $PORT -o $IP`실행되지 않을 경우

  `$gem uninstall sinatra`를 보면 2개 버전의 sinatra가 충돌을 일으키는 것을 확인할 수 있음

- 전체 삭제 후 다시 install하는 방법이 있지만 아래와 또 실행이 안 될 경우, `$ gem list --local sinatra`를 통해 확인해 볼 것

  ```ruby
  * LOCAL GEMS *
  sinatra (2.0.3)
  sinatra-contrib (2.0.2)
  sinatra-reloader (1.0)
  ```

  

  terminal에 위와 같이 출력된다면 `sinatra-contrib`를 삭제 후 다시 설치해 버전을 2.0.3으로 맞춰줘야 함