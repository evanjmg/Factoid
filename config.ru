require 'sinatra'
require 'bundler'
Bundler.require
#Controllers
require './app'
#Models
require './models/comment'
require './models/fact'
require './models/user'
require './models/like'
require './models/category'

run App