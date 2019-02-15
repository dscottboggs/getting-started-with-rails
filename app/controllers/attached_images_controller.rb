class AttachedImagesController < ApplicationController
  before_action :authenticate!, except: [ :show, :index ]

  def new
    @image = AttachedImage.new
  end

  def create
    @image = AttachedImage.new
    @image.uploader = current_user
    @image.file = params[:file]
  end
end
