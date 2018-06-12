require 'sinatra'
require 'sinatra/reloader'
require 'csv'

get '/' do
    erb :index
end


get '/new' do
    erb :new
end

post '/create' do
    # 사용자가 입력한 정보를 받음
    # CSV 파일 가장 마지막에 등록
    # => 이 글의 글번호도 같이 저장함
    # => 기존의 글 개수를 파악하기
    # => 글 개수 + 1로 저장하기
    title = params[:title]
    contents = params[:contents]
    # = .open('./boards.csv', 'r')
    id = CSV.read('./boards.csv').count + 1
    puts id
    CSV.open('./boards.csv', 'a+') do |row|
        row << [id, title, contents]
    end
    redirect '/boards'
end

get '/boards' do
    # 파일을 열고 (읽기모드)
    # 각 줄마다 순행하면서
    # @가 붙어있는 변수에 넣어줌
    @boards = []
    CSV.open('./boards.csv', 'r+').each do |row|
        @boards << row
    end
   erb :boards
end

get '/board/:id' do
    # CSV파일에서 params[:id]로 넘겨준
    # 같은 글번호를 가진 row를 선택
    # => CSV파일을 전체 순회합니다.
    # => 값을 만나면 순회를 정히한 후 
    # => 변수에다가 담아줍니다.
    @board = []
    CSV.read("./boards.csv").each do |row|
        if row[0].eql?(params[:id])
            @board = row
            break
        end
    end
    erb :board
end



# 2. 회원가입
get '/user/new' do
    erb :new_user
end


post '/user/create' do
    # id, passswd 입력한 정보 받기
    # CSV의 가장 마지막에 등록하기
    #passwd_confirmation = params[:passwd_confirmation]
    if params[:passwd].eql? (params[:passwd_confirmation])
       #end
       #unless
        id = params[:id]
        passwd = params[:passwd]        
        ind = CSV.read('./users.csv').count + 1
        CSV.open('./users.csv', 'a+') do |row|
            row << [ind, id, passwd]
        end
        redirect "/user/#{ind}"
    else
        
        redirect '/error'
    end
    redirect '/users'
end


get '/error' do
    @msg = "비밀번호 재확인 실패"
    erb :error
end


get '/users' do
    erb :users
end


get '/user/:ind' do
    @user = []
    CSV.open('./users.csv', 'r+').each do |row|
        if row[0].eql?(params[:ind])
            @user = row
            break
        end
    end
    erb :user
end