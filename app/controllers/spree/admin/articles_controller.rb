class Spree::Admin::ArticlesController < Spree::Admin::ResourceController
  class Article < ActiveRecord::Base
  end
  before_filter :rdr, :only => :new
  #after_filter :back, :only => :new

  def rdr
    session[:return_to] = request.referer
  end

  def back
    #test = session.delete([:return_to])
    render :json => { alert: test}, :status => 403
  end

  def create
    test = session[:return_to]
    #render :json => { alert: test}, :status => 403
    redirect_to test
  end


end