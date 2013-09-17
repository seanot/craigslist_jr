get '/' do
  @categories = Category.all
  erb :index
end

get '/category/:id' do
  @category = params[:id]
  @posts = Category.find(@category).posts
  erb :category_list
end

get '/post/:cat_id/:post_id' do
  @category = params[:cat_id]
  @post = Post.find(params[:post_id])
  erb :post_view
end
