class DojosController < ApplicationController
  def index
    @all_dojos = Dojo.all
  end
  def new
  end
end
