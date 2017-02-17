require 'RMagick'

ARGV.each do |f|
  #img = Magick::Image.read(f).first
  img = Magick::ImageList.new(f)
  img.strip!
  img.write(img.filename)

end
