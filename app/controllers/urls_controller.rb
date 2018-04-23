class UrlsController < ApplicationController
  before_action :set_url, only: %i[show redirect]

  # GET /:short
  def redirect
    redirect_to @url.link #(a es el id)
  end

  # GET /urls/1
  def show
    @new_url = Url.new
  end

  # GET /urls/new
  def new
    @url = Url.new
  end


  def create
    @url = Url.new(url_params)

    respond_to do |format|
      if @url.save
        format.html { redirect_to view_path(@url.short), notice: 'Url was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  private
    # Set Url object with Short
    def set_url
      @url = Url.find_by(short: params[:short])
    end

    def url_params
      params.require(:url).permit(:link, :short)
    end
end
