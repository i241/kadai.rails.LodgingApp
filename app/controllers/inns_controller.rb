class InnsController < ApplicationController
  def index
    @inns = Inn.search(params[:search])
  end

  def show
    @inn = Inn.find(params[:id])
    @reservation = Reservation.new
  end

  def new
    @inn = Inn.new
  end
  
  def create
    @inn = Inn.new(inn_params)
    @inn.user_id = current_user.id
    @inn.save
    flash[:notice] = "部屋の投稿が完了しました！"
    redirect_to inn_path(@inn)
  end

  def edit
    @inn = Inn.find(params[:id])
  end
  
  def update
    @inn = Inn.find(params[:id])
    @inn.update(inn_params)
    redirect_to inn_path(@inn)
  end
  
  def destroy
    @inn = Inn.find(params[:id])
    @inn.destroy
    redirect_to inn_path
  end
  
  private
  def inn_params
    params.require(:inn).permit(:title, :body, :price, :address, :image)
  end
end
