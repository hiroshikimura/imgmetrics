#!/usr/bin/ruby
# -*- coding: utf-8 -*-

require 'rmagick'
require 'json'
require 'uri'
require 'pry'
require 'digest/sha1'

list = nil
map = {}

# まずはcatalogの読み込み
filename = ARGV[0]

File.open(filename) do |file|
  list = JSON.parse(file.read)
end

# 次にマップの読み込み
filemap = ARGV[1]
File.open(filemap) do |file|
  file.read.split("\n").each do |line|
    hash, category = line.split("\t")
    map[hash] ||= []
    map[hash] <<= category
  end
end

list.each do |imginfo|
  dig = imginfo['detail']['digest']
  imginfo[:category] = map[dig]
end

puts list.to_json
