class LinksController < ApplicationController
  def new
    render :new
  end

  def create
    @link = Link.find_or_initialize_by link_params

    if @link.persisted? || @link.save
      redirect_to root_path, notice: "URL #{ @link.url } lengthened to #{ root_url }links/#{ @link.slug }"
    else
      redirect_to root_path, notice: "Invalid URL: #{ @link.url }"
    end
  end

  def show
    @link = Link.find_by slug: params[:slug]
    if @link
      redirect_to @link.url
    else
      redirect_to root_path, notice: "Slug not found: #{ params[:slug] }"
    end
  end

  private

    def link_params
      params.require(:link).permit(:url)
    end
end
