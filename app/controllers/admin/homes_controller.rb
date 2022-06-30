class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!
 
  def top
    @plans = Plan.all
  end
  
end
