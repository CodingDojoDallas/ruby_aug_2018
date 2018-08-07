players = Player.limit(10).order("RANDOM()")
players.each do |player|
  puts player.team.name
  puts player.team.mascot
  puts player.team.stadium
end
#N+1 QUERIES, WHERE N IS NUMBER OF ALL PLAYERS

players = Player.includes(:team).limit(10).order("RANDOM()")
players.each do |player|
    puts player.team.name
    puts player.team.mascot
    puts player.team.stadium
end
#It only took 1 Query because it grabbed the team data with the Player data at the same time

#Retrieve all players from the "chicago bulls" by using .include
Player.includes(:team).where("teams.name = 'Chicago Bulls'").references(:team)

#Retrieve all players along with the team name htat play at the Staples Center
Player.joins(:team).select("teams.name, players.name as player_name").where("teams.stadium = 'Staples Center'")

#Retrieve all teams that have any player that start their name with the letter 'Z' by using .includes and .joins
Team.includes(:players).where("players.name LIKE 'Z%'").references(:player)
Team.joins(:players).where("players.name LIKE 'Z%'")
