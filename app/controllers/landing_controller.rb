class LandingController < ApplicationController
  def index
    @providers = Provider.all
  end
end
