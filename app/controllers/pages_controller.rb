class PagesController < ApplicationController
  def home
  	# This will show the title to the associated pages
  	@title = "Home"
  end

  def contact
  	@title = "Contact"
  end

  def about
  	@title = "About"
  end

  def help
    @title = "Help"
  end
end
