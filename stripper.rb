require 'RMagick'

ARGV.each do |f|
  #img = Magick::Image.read(f).first
  puts "processing ... [#{f}]"

#  begin
#    img = Magick::ImageList.new(f)
#    img.strip!
#    img.write(img.filename)
#  rescue => e
#  end

end
