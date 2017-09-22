class StaticPagesController < ApplicationController
  def home
    if logged_in?  # ako e logiran na stranata stavi gi slednite instance variables Micropost.new i feed_items (site microposts od toj user)
      @micropost  = current_user.microposts.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
  end
  def help
  end
  def about
  end
  def contact
  end

end


 #vo slucajov kaj static-pages samo prazni metodi koi sto povikuvaat view - zatoa e static nema nisto dinamicko