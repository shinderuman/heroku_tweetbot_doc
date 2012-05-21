# encoding: utf-8
require 'sinatra'
require 'cgi'
require 'erb'

get '/:name' do
  @name = params[:name]
  map = {"sagabot" => "サガ スクウェア",
         "dorohedoro_bot" => "ドロヘドロ IKKI 小学館",
         "seiken3_bot" => "聖剣伝説 スクウェア",
         "eggmonster_bot" => "半熟英雄 スクウェア"}
  @str = CGI.escape(map[@name])
  erb :index
end
