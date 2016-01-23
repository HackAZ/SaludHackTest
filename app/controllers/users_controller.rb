class UsersController < ApplicationController
  def profile
  end

  def appointments
    @appointments = Appointment.where(user_id: current_user.id)
  end
end
