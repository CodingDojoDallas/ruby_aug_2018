require 'date'
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
    earned_gold = Random.rand(20..50)
    session[:gold] += earned_gold
    session[:activities] << {color: "green", msg: "You earned #{earned_gold} gold from the farm. Nice! (#{DateTime.now.strftime('%Y/%m/%d %I:%M %P')})"}
    redirect_to root_path
  end

  def cave
    earned_gold = Random.rand(51..100)
    session[:gold] += earned_gold
    session[:activities] << {color: "green", msg: "You earned #{earned_gold} gold from the cave. Nice! (#{DateTime.now.strftime('%Y/%m/%d %I:%M %P')})"}
    redirect_to root_path
  end

  def house
    earned_gold = Random.rand(25..200)
    session[:gold] += earned_gold
    session[:activities] << {color: "green", msg: "You earned #{earned_gold} gold from the house. Nice! (#{DateTime.now.strftime('%Y/%m/%d %I:%M %P')})"}
    redirect_to root_path
  end

  def casino
    earned_gold = Random.rand(-1000..1000)
    session[:gold] += earned_gold
    if earned_gold > 0
      session[:activities] << {color: "green", msg: "You earned #{earned_gold} gold from the casino. Nice! (#{DateTime.now.strftime('%Y/%m/%d %I:%M %P')})"}
    else
      session[:activities] << {color: "red", msg: "You lost #{earned_gold} gold from the casino. Oh no!  (#{DateTime.now.strftime('%Y/%m/%d %I:%M %P')})"}
    end
    redirect_to root_path
  end

  def reset
    session[:gold] = nil
    session[:activities] = nil
    redirect_to root_path
  end
end
