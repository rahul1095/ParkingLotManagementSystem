class TicketsController < ApplicationController
  def create
    @ticket = Ticket.new(ticket_params)
    if @ticket.save
      render json: @ticket, status: :created
    else
      render json: @ticket.errors, status: :unprocessable_entity
    end
  end

  def by_registration_number
    @ticket = Ticket.find_by(car_id: Car.find_by(registration_number: params[:registration_number])&.id)
    if @ticket
      render json: { ticket_number: @ticket.spot_number }
    else
      render json: { error: "No car found with the provided registration number." }, status: :not_found
    end
  end

  def by_color
    @tickets = Ticket.joins(:car).where(cars: { color: params[:color] })
    render json: @tickets.pluck(:spot_number)
  end

  private

  def ticket_params
    params.require(:ticket).permit(:car_id, :spot_number)
  end
end
