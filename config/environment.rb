require 'bundler'
Bundler.require
require 'rest-client'
require 'json'
require 'pry'
require 'colorize'

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')
ActiveRecord::Base.logger = nil
require_all 'lib'
