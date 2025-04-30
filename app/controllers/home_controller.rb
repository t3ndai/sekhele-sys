class HomeController < ApplicationController
  skip_before_action :authenticate, only: [ :landing ]

  def index
  end

  def landing
    render inertia: "Home/Index"
  end
end
