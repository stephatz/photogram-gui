class PhotosController < ApplicationController
  def index
    @list_all_photos = Photo.all.order({:created_at => :desc})

    render({ :template => "photo_templates/index" })
  end

  def create
    @the_photo = Photo.new

    @the_photo.caption = params.fetch("input_caption")
    @the_photo.image = params.fetch("input_image")
    @the_photo.owner_id = params.fetch("input_owner_id")

    if @the_photo.valid?
      @the_photo.save
      redirect_to("/photos", { :notice => "Photo created successfully." })
    else
      redirect_to("/photos", { :notice => "Photo failed to create successfully." })
    end
  end

  def show
    the_id = params.fetch("photo_id")

    @the_photo = Photo.where({:id => the_id}).at(0)

    @all_comments = @the_photo.comments.all

    render({ :template => "photo_templates/show" })
  end

  def update
    the_id = params.fetch("photo_id")
    
    @the_photo = Photo.where({:id => the_id}).at(0)

    @the_photo.image = params.fetch("input_image")
    @the_photo.caption = params.fetch("input_caption")
    
    if @the_photo.valid?
      @the_photo.save
      redirect_to("/photos/#{@the_photo.id}", { :notice => "Photo updated successfully." })
    else
      redirect_to("/photos/#{@the_photo.id}", { :notice => "Photo failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("photo_id")
    @the_photo = Photo.where({ :id => the_id }).at(0)

    @the_photo.destroy

    redirect_to("/photos", { :notice => "Photo deleted successfully."} )
  end
end
