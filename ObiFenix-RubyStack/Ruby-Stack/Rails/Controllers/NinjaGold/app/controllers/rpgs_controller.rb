class RpgsController < ApplicationController

  @@time = Time.new

  def index
    if !session[:activities] and !session[:gold_count]
      session[:gold_count] = 0
      session[:activities] = []
    end
    render "rpgs/ninjagold"
  end

  def process_money
    # @now = '{0:%Y-%m-%d %H:%M:%S}'.format(datetime.now())
    @timestamp = @@time.strftime('%Y/%m/%d %H:%M %p')
    if 'farm' == params[:gold]
        @rand = rand(10..20)
        session[:gold_count]+= @rand
        session[:activities] << {status:"green", message:" You hav earned #{@rand} gold from the Farm! ", timer:@timestamp}
        print "\n\n\nrand_number: #{@rand}    -    activity: [ #{session[:activities]} ]\n\n\n\n"

    elsif 'cave' == params[:gold]
        @rand = rand(5..10)
        session[:gold_count]+= @rand
        session[:activities] << {status:"green", message:" You hav earned #{@rand} gold from the Cave! ", timer:@timestamp}

    elsif 'house' == params[:gold]
        @rand = rand(2..5)
        session[:gold_count]+= @rand
        session[:activities] << {status:"green", message:" You hav earned #{@rand} gold from the House! ", timer:@timestamp}

    elsif 'casino' == params[:gold]
        @luck = rand(0..2)
        @rand = rand(0..50)
        if @luck == 0
            session[:gold_count]+= @rand
            session[:activities] << {status:"green", message:" You hav earned #{@rand} gold from the casino ", timer:@timestamp}
        else
            if session[:gold_count]-@rand < 0
                session[:gold_count]= 0
                session[:activities] << {status:"red", message:" You have lost all your gold from the casino! ", timer:@timestamp}
            else
                session[:gold_count]-= @rand
                session[:activities] << {status:"red", message:" You have lost #{@rand} gold from the casino ", timer:@timestamp}
            end
        end
    end

    p 'activities', session[:activities]
    redirect_to "/"
  end

  def reset
    session.clear
    redirect_to '/'
  end
end
