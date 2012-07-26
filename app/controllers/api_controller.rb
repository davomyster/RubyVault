class ApiController < ApplicationController
  require "rexml/document"
  skip_before_filter :verify_authenticity_token
  respond_to :xml

  #This method does pretty much nothing at this point
  def index
  if params[:xml]
    doc = REXML::Document.new(params[:xml])
    doc.elements.each("test/subsection") {|element| puts element }
  end

    respond_to do |response|
      response.xml { render :xml => {result => "OK"}.to_xml }
    end
  end
end
