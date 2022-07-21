class User::HomesController < ApplicationController

  def top
    @plans = Plan.where(is_draft: 'false').order('id DESC').limit(5)
  end


end
