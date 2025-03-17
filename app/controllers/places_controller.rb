class PlacesController < ApplicationController

  def index
    @places = Place.all
    @current_user = User.find_by({"id" => session["user_id"]})
  end

  def show
    @place = Place.find_by({ "id" => params["id"] })
    @entries = Entry.where({ "place_id" => @place["id"], "user_id" => session["user_id"] }) #changed from:     @entries = Entry.where({ "place_id" => @place["id"] })
  end

  def new
  end

  def create
    @user = User.find_by({ "id" => session["user_id"] })
    if @user != nil
      @place = Place.new
      @place["name"] = params["name"]
      @place.save
    else
      flash["notice"] = "Login first."
    end
      redirect_to "/places"
    end
  end
#system didn't want to have final "end" here-- caused error. Not sure why.