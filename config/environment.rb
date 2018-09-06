require 'bundler/setup'
Bundler.require

Dir["./app/models/*.rb"].each {|file| require file }