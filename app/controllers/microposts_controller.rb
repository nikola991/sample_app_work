class MicropostsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user, only: :destroy

  def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      flash[:success] = "Micropost created"   #nas ni e povrzan micropost so current_user, plus da go zacuvame vo baza
      redirect_to root_path
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end
  def destroy
    @micropost.destroy
    flash[:success] = "Micropost deleted"
    redirect_to request.referrer || root_url
  end

  private

  def micropost_params
    params.require(:micropost).permit(:content, :picture)
  end
  def correct_user
    @micropost = current_user.microposts.find_by(id: params[:id]) # ako mikropostot so toj ide e na current user
    redirect_to root_url if @micropost.nil?                       #- stavi go vo mikropost ako go nema (nill) redirect

  end
end

