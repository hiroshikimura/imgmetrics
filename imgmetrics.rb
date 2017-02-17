require 'RMagick'
require 'json'

list = []

ARGV.each do |f|
  #img = Magick::Image.read(f).first
  img = Magick::ImageList.new(f)
  img.strip!
  p "FILENAME  : #{img.filename}"
  p "FORMAT    : #{img.format}"
  p "HEIGHT    : #{img.rows} px"
  p "WIDTH     : #{img.columns} px"
  p "CLASSTYPE : #{img.class_type}"
  p "DEPTH     : #{img.depth} bits/px"
  p "COLORS    : #{img.number_colors}"
  p "FILESIZE  : #{img.filesize} bytes"
  p "RESOL.    : #{img.x_resolution.to_i}x#{img.y_resolution.to_i} " +"pixels/#{img.units==Magick::PixelsPerInchResolution ? "inch":"cm"}"
  if img.properties.length > 0
    p "PROPERTIES:"
    img.properties do |name,value|
      p "#{name} = #{value}"
    end
  end
  list << {
    name: img.filename,
    width: img.columns,
    height: img.rows
  }
end

p list.to_json
