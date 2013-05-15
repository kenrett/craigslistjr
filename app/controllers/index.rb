get '/' do
  # Look in app/views/index.erb
  erb :index
end

get '/category' do
  erb :category
end

get '/post/new' do
  erb :new_post
end

get '/post/:id/edit' do |id|
    @editable = Post.find_by_url(id)
    @cat = Category.find_by_id(@editable.category_id)
    @params[:url] = id
    erb :edit_post
end

get '/category/:id' do |id|
  @cat_id = id.to_s
  erb :post_by_category
end

get '/post/:id' do |id|
  @current = Post.find_by_id(id)
  @cat = Category.find_by_id(@current.category_id)
  erb :post
end

post '/post' do
  new_id = Category.newish(params[:category])
  posted = Post.create(text: params[:text] , category_id: new_id, url: SecureRandom.hex(16))
  @params[:url] = posted.url
  erb :posted
end

get '/posted' do
  erb :posted
end


post '/posted' do
  new_id = Category.newish(params[:category])
  to_update = Post.find_by_url(@params[:url])
  to_update.update_attributes(text: @params[:text] , category_id: new_id)
  erb :posted
end

