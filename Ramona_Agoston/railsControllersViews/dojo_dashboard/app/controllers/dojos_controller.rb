class DojosController < ApplicationController
    def index
        @dojos = Dojo.all
    end
end
