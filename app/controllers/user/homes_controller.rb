class User::HomesController < ApplicationController
  
  def top
    @plans = Plan.order('id DESC').limit(5)
  end

  
end
