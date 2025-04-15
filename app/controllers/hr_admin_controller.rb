class HrAdminController < ApplicationController
  def index

    render inertia: 'HrAdmin/Index'
  end
end
