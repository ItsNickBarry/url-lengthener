class LinksController < ApplicationController
  def new
    render :new
  end

  def create
    @link = Link.find_or_initialize_by link_params

    if @link.persisted? || @link.save
      flash.now.notice = "URL #{ @link.url } lengthened to #{ root_url }#{ @link.slug }"
      render :new
    else
      flash.now.notice = "Invalid URL: #{ @link.url }"
      render :new
    end
  end

  def show
    @link = Link.find_by slug: params[:slug]
    if @link
      redirect_to @link.url
    else
      flash.now.notice = "Slug not found: #{ params[:slug] }"
      render :new
    end
  end

  private

    def link_params
      params.require(:link).permit(:url)
    end
end
