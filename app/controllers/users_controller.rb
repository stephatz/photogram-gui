class UsersController < ApplicationController
  def index
    @list_all_users = User.all.order({:username => :asc})

    render({ :template => "user_templates/index" })
  end

  def create
    @the_user = User.new
    @the_user.username = params.fetch("query_username")

    if @the_user.valid?
      @the_user.save
      redirect_to("/users", { :notice => "User created successfully." })
    else
      redirect_to("/users", { :notice => "User failed to create successfully." })
    end

  end
  
  def show
    the_username = params.fetch("a_username")

    @the_user = User.where({:username => the_username}).at(0)

    @user_photos = Photo.where({:owner_id => @the_user.id}).all

    render({ :template => "user_templates/show" })
  end

  def update
    the_id = params.fetch("user_id")

    @the_user = User.where({:id => the_id}).at(0)

    @the_user.username = params.fetch("input_username")

    if @the_user.valid?
      @the_user.save
      redirect_to("/users/#{@the_user.username}", { :notice => "User updated successfully." })
    else
      redirect_to("/users/#{@the_user.username}", { :notice => "User failed to update successfully." })
    end
  end
end
