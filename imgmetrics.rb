require 'RMagick'
require 'json'
require 'URI'

list = []

ARGV.each_with_index do |f, idx|
#  #img = Magick::Image.read(f).first
  img = Magick::ImageList.new(f)
puts "reading #{f}"
#  img.strip!
#  puts "FILENAME  : #{img.filename}"
#  puts "FORMAT    : #{img.format}"
#  puts "HEIGHT    : #{img.rows} px"
#  puts "WIDTH     : #{img.columns} px"
#  puts "CLASSTYPE : #{img.class_type}"
#  puts "DEPTH     : #{img.depth} bits/px"
#  puts "COLORS    : #{img.number_colors}"
#  puts "FILESIZE  : #{img.filesize} bytes"
#  puts "RESOL.    : #{img.x_resolution.to_i}x#{img.y_resolution.to_i} " +"pixels/#{img.units==Magick::PixelsPerInchResolution ? "inch":"cm"}"
#  if img.properties.length > 0
#    puts "PROPERTIES:"
#    img.properties do |name,value|
#      puts "#{name} = #{value}"
#    end
#  end
  list << {
    index: idx,
    name: img.filename.unpack('U*').map{|i| "\\u" + i.to_s(16).rjust(4,'0')}.join,
    width: img.columns,
    height: img.rows
  }
end

puts "JSON>>>#{list.to_json}"
