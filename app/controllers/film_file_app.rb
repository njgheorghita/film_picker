class FilmFile < Sinatra::Base
  get '/films' do
    @films = Film.all
    erb :films_index
  end

  get '/films/new' do
    erb :new
  end

  post '/films' do
    Film.create(title:params[:title],year:params[:year])
    redirect '/films'
  end

  get '/films/random' do  
    @film = Film.order("RANDOM()").first
    erb :show
  end

  get '/genres' do
    @genres = Genre.all
    erb :index
  end

  get '/directors/:id' do 
    @directors = Director.find(params[:id])
    erb :director
  end

  get '/films/:id/edit' do
    @films = Film.find(params[:id])
    erb :edit
  end

  get '/films/:id' do |id|
    Film.find(id).update_attributes(title:params[:title], year:params[:year])
    redirect '/films'
  end

  post '/films/:id' do |id|
    Film.delete(id)
    redirect '/films'
  end

  delete '/films/:id' do |id|
    Film.delete(id)
    redirect '/films'
  end

end
