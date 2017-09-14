class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper  #ovde e include za da go povikuvame vo site controleri
end
