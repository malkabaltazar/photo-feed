class StaticPagesController < ApplicationController
 require 'flickraw'
 FlickRaw.api_key = ENV["FLICKRAW_API_KEY"]
 FlickRaw.shared_secret = ENV["FLICKRAW_SHARED_SECRET"]
 flickr = FlickRaw::Flickr.new

  def home
    unless params[:user].nil?
      @flickr_id = params[:user][:flickr_id]
      @photos = flickr.people.getPhotos user_id: @flickr_id
    end
  end
end
