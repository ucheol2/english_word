class MainController < ApplicationController
  def index
  end
  
  def temp
    me = current_user
    @tests = me.vocas.where(day:3, step: 3)
  end
end
