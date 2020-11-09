class UserNotificationsController < ApplicationController
  def index
    @user_id = current_user.id
    @swap_requests = Swap.where(other_id: @user_id, status: "pending")
    @swaps_other = Swap.where(other_id: @user_id, status: "accepted")
    @swaps_user = Swap.where(user_id: @user_id, status: "accepted")
  end
end
