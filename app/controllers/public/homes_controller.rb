class Public::HomesController < ApplicationController
  
  def top
    @admin =Admin.find(1)
  end
  
end
