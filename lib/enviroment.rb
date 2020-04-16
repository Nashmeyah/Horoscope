 require 'bundler'
 Bundler.require

 require 'pry'
 require 'httparty'
 require 'json'
 require 'colorize'
 require 'tty-font'

require_relative './zodiac/cli'
require_relative './zodiac/api'
require_relative './zodiac/horoscope'
