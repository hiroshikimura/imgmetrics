#!/usr/bin/ruby
# -*- coding: utf-8 -*-

require 'RMagick'
require 'json'
require 'URI'
require 'pry'

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
  cw = (img.rows < img.columns)? img.rows : img.columns
  cx = cw / 2
  cy = cx
  list << {
    id: "image-#{idx}",
    detail: {
      url: img.filename.force_encoding('UTF-8'),
      rect: {
        width: img.columns,
        height: img.rows
      },
      view: {
        center: {x: cy, y: cx},
        width: cw
      }
    }
  }
end

puts "JSON>>>#{list.to_json}"
