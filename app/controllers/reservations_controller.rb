class ReservationsController < ApplicationController
  
  def index
    @reservations = Reservation.all
  end
  
  def new
    @reservation = Reservation.new
  end
  
  def create
    @reservation = Reservation.new(params.permit(:start_date, :end_date, :total_price, :people, :many_days, :user_id, :room_id))
    @reservation.user_id = current_user.id
    if @reservation.save
      flash[:notice] = "予約を確定しました"
      redirect_to reservation_path(@reservation)
    end
  end
  
  def show
    @reservations = Reservation.all
  end
  
  def confirm
    @reservation = Reservation.new(permit_params)
  end
  
  private
  
  def permit_params
    params.require(:reservation).permit(:start_date, :end_date, :total_price, :people, :many_days, :user_id, :room_id) 
  end
end