class CloudinaryTestController < ApplicationController
  def index
    if request.post?
      file = params[:image]
      result = Cloudinary::Uploader.upload(file.tempfile.path)
      @image_url = result['secure_url']
    end
  end
end
