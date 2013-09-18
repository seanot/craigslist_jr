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

get '/post/' do
  @post = Post.find(params[:id])
  erb :post_view
end

get '/post/success/' do
  @key = params[:key]
  @cat = params[:cat]
  @post = Post.find_by_edit_url(@key)
  erb :post_success
end

get '/post/failed' do
  erb :post_fail
end

get '/post/edit/' do
  @key = params[:key]
  puts @key
  @post = Post.find_by_edit_url(@key)
  @this_category = @post.category_id
  @categories = Category.all
  erb :edit_post
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

post '/post/edit/:id' do
  id = params[:id]
  p = Post.find(id)
  if p.update_attributes(params[:post])
    redirect to "/post/success/?key=#{p.edit_url}&cat=#{p.category_id}"
  else
    redirec to 'post/failed'
  end
end
