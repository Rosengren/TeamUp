class PagesController < ApplicationController
  def activate
    render template: "pages/#{params[:hpage]}"
  end
end
