class SpacesController < ApplicationController
  def index
    @user = User.create
    @stores = Store.all
  end
end
