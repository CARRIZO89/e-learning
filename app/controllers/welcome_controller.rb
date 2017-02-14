class WelcomeController < ApplicationController
  layout "landing"
  
  def index
  	@last_courses = Course.last(3)
  end
end
