class RpgController < ApplicationController
    def index
        unless session[:gold]
            session[:gold] = 0
        end

        unless session[:activities]
            session[:activities] = []
        end
    end

    def farm
        earned_gold = Random.rand(10..20)
        session[:gold] += earned_gold
        session[:activities] << {color: "green", msg: "You earned #{earned_gold} gold from the farm.(#{DateTime.now.strftime('%Y/%m/%d %I:%M %P')})"}
        redirect_to root_path
    end

    def cave
        earned_gold = Random.rand(5..10)
        session[:gold] += earned_gold
        session[:activities] << {color: "green", msg: "You earned #{earned_gold} gold from the cave.(#{DateTime.now.strftime('%Y/%m/%d %I:%M %P')})"}
        redirect_to root_path
    end

    def house
        earned_gold = Random.rand(2..5)
        session[:gold] += earned_gold
        session[:activities] << {color: "green", msg: "You earned #{earned_gold} gold from the house.(#{DateTime.now.strftime('%Y/%m/%d %I:%M %P')})"}
        redirect_to root_path
    end

    def casino
        earned_gold = Random.rand(-50..50)
        session[:gold] += earned_gold
        if earned_gold > 0
            session[:activities] << {color: "green", msg: "You earned #{earned_gold} gold from the casino.(#{DateTime.now.strftime('%Y/%m/%d %I:%M %P')})"}
        else
            session[:activities] << {color: "red", msg: "You lost #{earned_gold} gold from the casino. Ouch!  (#{DateTime.now.strftime('%Y/%m/%d %I:%M %P')})"}
        end
        redirect_to root_path
    end
end
