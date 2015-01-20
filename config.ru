# config.ru
require 'lotus'
require_relative 'application'

run ToDoApp::Application.new
