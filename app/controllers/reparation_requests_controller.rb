class ReparationRequestsController < ApplicationController
  def new
    @reparation_request = ReparationRequest.new
  end
end
