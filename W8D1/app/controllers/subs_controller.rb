class SubsController < ApplicationController
  before_action :require_moderator, only: [:edit, :update]

  def new
    @sub = Sub.new
    render :new
  end

  def create
    @sub = Sub.new(sub_params)
    @sub.user_id = current_user.id
    if @sub.save
      redirect_to sub_url(@sub)
    else
      flash.now[:errors] = @sub.errors.full_messages
      render :new
    end
  end
  
  def index
    @subs = Sub.all
    render :index
  end

  def show
    @sub = Sub.find(params[:id])
    render :show
  end

  def edit
    @sub = Sub.find(params[:id])
    render :edit
  end

  def update
    @sub = Sub.find(params[:id])
    @sub.update(sub_params)
    flash[:errors] = @sub.errors.full_messages
    redirect_to sub_url(@sub)
  end

  private
  
  def sub_params
    params.require(:sub).permit(:title, :description)
  end

  def require_moderator
    if current_user.subs.find(params[:id]) 
      # don't do anything, just carry on
    else
      flash[:errors] = "You don't own this, get lost pal!"
      redirect_to sub_url(params[:id])
    end
  end
end
