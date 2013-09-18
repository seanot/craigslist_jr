get '/' do
  @categories = Category.all
  erb :index
end

get '/category/:id' do
  @category = params[:id].to_i
  @posts = Category.find(@category).posts
  erb :category_list
end

get '/post/create/:cat_id' do
  @this_category = params[:cat_id].to_i
  @categories = Category.all
  @post = Post.new
  erb :create_post
end

#todo: make the edit functionality
get '/post/edit/:cat_id' do
  @category = params[:cat_id].to_i
  @post = Post.find()
  erb :edit_post
end

get '/post/cat=:cat_id/:post_id' do
  @category = params[:cat_id]
  @post = Post.find(params[:post_id])
  erb :post_view
end

get '/post/success/' do
  @key = params[:key]
  @cat = params[:cat]
  erb :post_success
end

get '/post/failed' do
  erb :post_fail
end


#POST==============================

post '/post/create' do 
  p = Post.new(params[:post])
  if p.save
    @key = create_edit_key
    p.edit_url = @key
    p.save
    cat = p.category_id
    redirect to "/post/success/?key=#{@key}&cat=#{cat}"
  else
    redirect to '/post/failed'
  end
end
