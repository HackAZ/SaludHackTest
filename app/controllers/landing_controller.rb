class LandingController < ApplicationController
  def index
    @providers = Provider.all
  end
  
  def afterlogin
  end
end
