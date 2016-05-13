
class App < Sinatra::Base

  use Rack::MethodOverride
  get '/' do
    redirect '/facts'
  end
#index
get '/facts' do 
  @facts = Fact.all
  erb :"facts/index"
end

#new
get '/facts/new' do
  @facts = Fact.all
  @categories = Category.all
  erb :"facts/new"
end
#create

post '/facts' do
  @fact = Fact.new(params[:fact])
  if @fact.save
    redirect "/facts/#{@fact.id}"
  else 
    erb :'facts/new'
  end
end

#show
get '/facts/:id' do
  @fact = Fact.find(params[:id])
  @facts = Fact.all
  erb(:"facts/show")

end

#edit 
get '/facts/:id/edit' do
  @fact = Fact.find(params[:id])
  @facts = Fact.all
  erb :'facts/edit'
end

#update
post '/facts/:id' do
  @fact = Fact.find(params[:id])
  if @fact.update_attributes(params[:fact])
    redirect("/facts/#{@fact.id}")
  else 
    erb(:"facts/edit")
  end
end

#delete 
delete '/facts/:id/delete' do
  @fact = Fact.find(params[:id])
  if @fact.destroy
    redirect('/facts')
  else
    redirect("/facts/#{@fact.id}")
  end
end

#index
get '/users' do 
  @users = User.all
  erb :"users/index"
end

#new
get '/users/new' do
  @users = User.all
  erb :"users/new"
end
#create

post '/users' do
  @user = User.new(params[:user])
  if @user.save
    redirect "/users/#{@user.id}"
  else 
    erb :'users/new'
  end
end

#show
get '/users/:id' do
  @user = User.find(params[:id])
  @users = User.all
  erb(:"users/show")

end

#edit 
get '/users/:id/edit' do
  @user = User.find(params[:id])
  @users = User.all
  erb :'users/edit'
end

#update
post '/users/:id' do
  @user = User.find(params[:id])
  if @user.update_attributes(params[:user])
    redirect("/users/#{@user.id}")
  else 
    erb(:"users/edit")
  end
end

#delete 
delete '/users/:id/delete' do
  @user = User.find(params[:id])
  if @user.destroy
    redirect('/users')
  else
    redirect("/users/#{@user.id}")
  end
end

#index
get '/categories' do 
  @categories = Category.all
  erb :"categories/index"
end

#new
get '/categories/new' do
  @categories = Category.all
  erb :"categories/new"
end
#create

post '/categories' do
  @category = Category.new(params[:category])
  if @category.save
    redirect "/categories/#{@category.id}"
  else 
    erb :'categories/new'
  end
end

#show
get '/categories/:id' do
  @category = Category.find(params[:id])
  @categories = Category.all
  erb(:"categories/show")

end

#edit 
get '/categories/:id/edit' do
  @category = Category.find(params[:id])
  @categories = Category.all
  erb :'categories/edit'
end

#update
post '/categories/:id' do
  @category = Category.find(params[:id])
  if @category.update_attributes(params[:category])
    redirect("/categories/#{@category.id}")
  else 
    erb(:"categories/edit")
  end
end

#delete 
delete '/categories/:id/delete' do
  @category = Category.find(params[:id])
  if @category.destroy
    redirect('/categories')
  else
    redirect("/categories/#{@user.id}")
  end
end

# #index
# get 'facts/:id/comments' do 
#   @comments = Fact.find(params[:id]).comments
#   erb :"comments/index"
# end

# #new
# get 'facts/:id/comments/new' do
#   @comments = Comment.all
#   erb :"comments/new"

#create

post '/facts/:id/comments/new' do
  @fact = Fact.find(params[:id])
  @comment = @fact.comments.new(params[:comment])
  @comment.save
  redirect "facts/#{@fact.id}"
end


delete '/facts/:id/comments/:comment/delete' do
  @fact = Fact.find(params[:id])
   @comment = @fact.comments.find(params[:comment])
   @comment.destroy
   @fact = Fact.find(params[:id])
  redirect("facts/#{@fact.id}")
end
#update
post '/facts/:id/comments/:c/edit' do
  @fact = Fact.find(params[:id])
    @comment = @fact.comments.find(params[:c])
   @comment.update_attributes(params[:comment])
    redirect("facts/#{@fact.id}")
end
#LIKES 
# create
post '/facts/:id/likes/new' do
  @fact = Fact.find(params[:id])
  @like = @fact.likes.new
  @like.save
  redirect "facts/#{@fact.id}"
end
post '/search' do
  @search = params[:search].to_s
  puts @search
@facts = Fact.where("body like '%#{@search}%'")
puts @facts
erb :'/search' 
end
end




