class PropertiesController < ApplicationController

  def new
    @property = Property.new
  end

  def index
    @properties = Property.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @properties }
    end
  end

  def create
    @property = Property.new(params[:property])
    if @property.save
      flash[:success] = "New property added"
      # Added meaningless get parameter to deal with bug in Chrome
      redirect_to properties_path(chrome_bug_workaround: 177855)
    else
      render 'new'
    end
  end

  def show
    @property = Property.find(params[:id])
  end

  def update
    @property = Property.find(params[:id])
    if @property.update_attributes(params[:property])
      flash[:success] = "Property updated"
      redirect_to property_path(chrome_bug_workaround: 177855)
    else
      render 'edit'
    end
  end

  def edit
    @property = Property.find(params[:id])
  end

end
