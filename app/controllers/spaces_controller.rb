class SpacesController < ApplicationController
  before_action :authenticate_manager!

  before_action :set_space, only: [:inquire, :submit_inquiry, :show, :edit, :destroy, :update]
  def inquire
  end

  def index
    @spaces = current_manager.spaces
  end

  def edit
  end

  def new
    @space = current_manager.spaces.new
    render 'list_space'
  end 

  def create
    @space = current_manager.spaces.new(space_params)
    if @space.save
      redirect_to @space
    else
      render :new
    end
  end

  def update 
    if @space.update(space_params)
      redirect_to spaces_path
    else
      redirect_to spaces_path
    end
  end
  
  def destroy
    if @space.destroy
      redirect_to spaces_path
    else
      redirect_to spaces_path
    end
  end

  def show
    @space = Space.friendly.find(params[:slug])
  end

  def submit_inquiry
    redirect_to space_path(@space), notice: "Your inquiry has been submitted!"
  end

  private
  def space_params
    params.require(:space).permit(:name, :per_hour, :location, :capacity, :area, :description, images: [])
  end

  def set_space
    @space = current_manager.spaces.friendly.find(params[:slug])
  end
end
