class DigTopController < ApplicationController
  layout 'digtop'
  
  def home
  end

  def help
  end
  
  def setumei
    render layout: 'setumei'
  end  
end
