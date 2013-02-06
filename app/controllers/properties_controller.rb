class PropertiesController < ApplicationController

  def index
    @properties = Property.all.sort

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @properties }
    end
  end

end
