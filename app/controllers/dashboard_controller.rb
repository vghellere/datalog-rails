class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    @temperature_samples = TemperatureSample.order(event_timestamp: :desc).limit(100).all.reverse
  end
end
