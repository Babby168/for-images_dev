class VipsTestController < ApplicationController
  def index
    if request.post?
      pieces = build_pieces
      mosaic = MosaicImageGenerator.new(pieces).generate

     png_data = mosaic.write_to_buffer(".png")
     @image_base64 = Base64.strict_encode64(png_data)
    end
  end

  private

  def build_pieces
    Array.new(MosaicImageGenerator::ROWS * MosaicImageGenerator::COLS).each_with_index.map do |_, i|
      if i % 3 == 0
        { filled: true, color: "#DC5050" }
      elsif i % 3 == 1
        { filled: true, color: "#50C850" }
      else
        { filled: false, color: nil }
      end
    end
  end
end
