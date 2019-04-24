class ApplicationController < ActionController::Base

def default_url_options
  { host: ENV["HOST"] || "https://scaneat.wogengapp.cn" }
end
end
