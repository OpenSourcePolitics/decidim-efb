class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  $filepath = '/home/mako/decidim-efb/.file.json'

  $country = File.read($filepath)

  $tab_word = JSON.parse($country)
end
