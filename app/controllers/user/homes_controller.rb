class User::HomesController < ApplicationController
  
  def top
    @plans = Plan.all
  end
  
end
