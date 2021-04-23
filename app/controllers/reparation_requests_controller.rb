class ReparationRequestsController < ApplicationController
  def index
    return redirect_to new_reparation_request_path new unless current_user

    @store = Store.find(current_user[:store_id])
    @reparation_requests = @store.reparation_requests
  end

  def new
    @reparation_request = ReparationRequest.new
  end

  def create
    store = Store.find_by(priority: store_with_major_priority)
    @reparation_request = ReparationRequest.new(reparation_request_params)
    @reparation_request.store = store
    if @reparation_request.save
      redirect_to new_reparation_request_path, notice: 'Your request was sent successfully!'
    else
      flash.now[:alert] = 'You must complete all the required fields (*)!'
      render 'new'
    end
  end

  private

  def store_with_major_priority
    device = Device.find_by(id: reparation_request_params[:device])
    return unless device

    sorted_stores_by_priority = device.stores.map(&:priority).sort
    sorted_stores_by_priority.first
  end

  def reparation_request_params
    params.require(:reparation_request).permit(:device, :purchase_installation_date,
                                               :issue_description, :model_number,
                                               :requester_first_name, :requester_last_name,
                                               :requester_zip_code, :requester_address,
                                               :requester_email, :requester_telephone,
                                               :requester_country, :requester_state,
                                               :requester_city, :price)
  end
end
