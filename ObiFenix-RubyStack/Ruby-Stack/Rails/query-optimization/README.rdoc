== README
                                ==========================================
                                ||  Assignment: Query Optimization II   ||
                                ==========================================

rails new blog-post-messages1
cd blog-post-messages1

<>  Added some packages, modifying this way the genereated file 'Gemfile'
    ---------------------------------------------------------------------
    gem 'hirb'                  # Using hirb (0.7.3)
    gem install nokogiri

<> Then run in the console:
    ----------------------
    'bundle install'


========================================
[ #0 ]: Create appropriate tables/models
========================================

<>  First:
    ----
    rails g model Tema name:string mascot:string stadium:string
    rails g model Player name:string team:references

<>  Next: Edited/Modifying this way the genereated file:
    ----
    »   [ 'team.rb' ]
        class Team < ActiveRecord::Base
            has_many    :players
            validates   :name, :mascot, :stadium, presence: true
            validates   :name, length: { minimum: 3 }
        end

    »   [ 'player.rb' ]
        class Player < ActiveRecord::Base
            belongs_to :team
            validates  :name, presence: true, length: { minimum: 3 }
        end

<>  Then
    ----
    rake db:migrate


================================================
[ #1 ]: Using ruby console  Retrieve all players
------------------------------------------------
<>  Write a program that will loop through each player and display their team:
    o   name
    o   mascot
    o   stadium.
    ============================================

    How many queries have we done? ONE, see bellow

    players = Player.all
    players.each {|player| print"Team Name:\t#{player.team.name}\nTeam Mascot:\t#{player.team.mascot}\nTeam Stadium:\t#{player.team.stadium}\n\n"}



===============================================
[ #2 ]: Using ruby console Retrieve all players
-----------------------------------------------
<>  Wrrite a program that will loop through each player and display their team:
    o   name
    o   mascot
    o   stadium.
    ===============================================

    How many queries have we done? ONE, se bellow

    players = Player.includes(:team)
    players.each {|player| print"Team Name:\t#{player.team.name}\nTeam Mascot:\t#{player.team.mascot}\nTeam Stadium:\t#{player.team.stadium}\n\n"}


=========================================================================
[ #3 ]:  Retrieve all players from the 'Chicago Bulls' by using .includes
=========================================================================

players = Player.includes(:team).where("teams.name = 'Chicago Bulls'").references(":team")

+----+--------------------+---------+-------------------------+-------------------------+
| id | name               | team_id | created_at              | updated_at              |
+----+--------------------+---------+-------------------------+-------------------------+
| 74 | Rawle Alkins       | 5       | 2018-08-03 02:12:54 UTC | 2018-08-03 02:12:54 UTC |
| 75 | Ryan Arcidiacono   | 5       | 2018-08-03 02:12:54 UTC | 2018-08-03 02:12:54 UTC |
| 76 | Omer Asik          | 5       | 2018-08-03 02:12:54 UTC | 2018-08-03 02:12:54 UTC |
| 77 | Antonio Blakeney   | 5       | 2018-08-03 02:12:54 UTC | 2018-08-03 02:12:54 UTC |
| 78 | Wendell Carter Jr. | 5       | 2018-08-03 02:12:54 UTC | 2018-08-03 02:12:54 UTC |
| 79 | Antonius Cleveland | 5       | 2018-08-03 02:12:54 UTC | 2018-08-03 02:12:54 UTC |
| 80 | Kris Dunn          | 5       | 2018-08-03 02:12:54 UTC | 2018-08-03 02:12:54 UTC |
| 81 | Cristiano Felicio  | 5       | 2018-08-03 02:12:54 UTC | 2018-08-03 02:12:54 UTC |
| 82 | Justin Holiday     | 5       | 2018-08-03 02:12:54 UTC | 2018-08-03 02:12:54 UTC |
| 83 | Chandler Hutchison | 5       | 2018-08-03 02:12:54 UTC | 2018-08-03 02:12:54 UTC |
| 84 | Zach LaVine        | 5       | 2018-08-03 02:12:54 UTC | 2018-08-03 02:12:54 UTC |
| 85 | Robin Lopez        | 5       | 2018-08-03 02:12:54 UTC | 2018-08-03 02:12:54 UTC |
| 86 | Lauri Markkanen    | 5       | 2018-08-03 02:12:54 UTC | 2018-08-03 02:12:54 UTC |
| 87 | Jabari Parker      | 5       | 2018-08-03 02:12:54 UTC | 2018-08-03 02:12:54 UTC |
| 88 | Cameron Payne      | 5       | 2018-08-03 02:12:54 UTC | 2018-08-03 02:12:54 UTC |
| 89 | Bobby Portis       | 5       | 2018-08-03 02:12:54 UTC | 2018-08-03 02:12:54 UTC |
| 90 | Denzel Valentine   | 5       | 2018-08-03 02:12:54 UTC | 2018-08-03 02:12:54 UTC |
+----+--------------------+---------+-------------------------+-------------------------+
17 rows in set



=========================================================================================
[ #4 ]:   Retrieve all players along with the team name that play at the 'Staples Center'
=========================================================================================

players = Player.includes(:team).where("teams.stadium = 'Staples Center'").references(":team")

+-----+--------------------------+---------+-------------------------+-------------------------+
| id  | name                     | team_id | created_at              | updated_at              |
+-----+--------------------------+---------+-------------------------+-------------------------+
| 216 | Patrick Beverley         | 13      | 2018-08-03 02:12:56 UTC | 2018-08-03 02:12:56 UTC |
| 217 | Avery Bradley            | 13      | 2018-08-03 02:12:56 UTC | 2018-08-03 02:12:56 UTC |
| 218 | Sam Dekker               | 13      | 2018-08-03 02:12:56 UTC | 2018-08-03 02:12:56 UTC |
| 219 | Jawun Evans              | 13      | 2018-08-03 02:12:56 UTC | 2018-08-03 02:12:56 UTC |
| 220 | Danilo Gallinari         | 13      | 2018-08-03 02:12:56 UTC | 2018-08-03 02:12:56 UTC |
| 221 | Shai Gilgeous-Alexander  | 13      | 2018-08-03 02:12:56 UTC | 2018-08-03 02:12:56 UTC |
| 222 | Marcin Gortat            | 13      | 2018-08-03 02:12:56 UTC | 2018-08-03 02:12:56 UTC |
| 223 | Montrezl Harrell         | 13      | 2018-08-03 02:12:56 UTC | 2018-08-03 02:12:56 UTC |
| 224 | Tobias Harris            | 13      | 2018-08-03 02:12:56 UTC | 2018-08-03 02:12:56 UTC |
| 225 | Wesley Johnson           | 13      | 2018-08-03 02:12:56 UTC | 2018-08-03 02:12:56 UTC |
| 226 | Boban Marjanovic         | 13      | 2018-08-03 02:12:56 UTC | 2018-08-03 02:12:56 UTC |
| 227 | Luc Mbah a Moute         | 13      | 2018-08-03 02:12:56 UTC | 2018-08-03 02:12:56 UTC |
| 228 | Johnathan Motley         | 13      | 2018-08-03 02:12:56 UTC | 2018-08-03 02:12:56 UTC |
| 229 | Jerome Robinson          | 13      | 2018-08-03 02:12:56 UTC | 2018-08-03 02:12:56 UTC |
| 230 | Mike Scott               | 13      | 2018-08-03 02:12:56 UTC | 2018-08-03 02:12:56 UTC |
| 231 | Renaldas Seibutis        | 13      | 2018-08-03 02:12:56 UTC | 2018-08-03 02:12:56 UTC |
| 232 | Milos Teodosic           | 13      | 2018-08-03 02:12:56 UTC | 2018-08-03 02:12:56 UTC |
| 233 | Sindarius Thornwell      | 13      | 2018-08-03 02:12:56 UTC | 2018-08-03 02:12:56 UTC |
| 234 | Tyrone Wallace           | 13      | 2018-08-03 02:12:56 UTC | 2018-08-03 02:12:56 UTC |
| 235 | Lou Williams             | 13      | 2018-08-03 02:12:56 UTC | 2018-08-03 02:12:56 UTC |
| 236 | Lonzo Ball               | 14      | 2018-08-03 02:12:56 UTC | 2018-08-03 02:12:56 UTC |
| 237 | Michael Beasley          | 14      | 2018-08-03 02:12:56 UTC | 2018-08-03 02:12:56 UTC |
| 238 | Joel Berry II            | 14      | 2018-08-03 02:12:56 UTC | 2018-08-03 02:12:56 UTC |
| 239 | Isaac Bonga              | 14      | 2018-08-03 02:12:56 UTC | 2018-08-03 02:12:56 UTC |
| 240 | Kentavious Caldwell-Pope | 14      | 2018-08-03 02:12:57 UTC | 2018-08-03 02:12:57 UTC |
| 241 | Jeffrey Carroll          | 14      | 2018-08-03 02:12:57 UTC | 2018-08-03 02:12:57 UTC |
| 242 | Alex Caruso              | 14      | 2018-08-03 02:12:57 UTC | 2018-08-03 02:12:57 UTC |
| 243 | Luol Deng                | 14      | 2018-08-03 02:12:57 UTC | 2018-08-03 02:12:57 UTC |
| 244 | Josh Hart                | 14      | 2018-08-03 02:12:57 UTC | 2018-08-03 02:12:57 UTC |
| 245 | Andre Ingram             | 14      | 2018-08-03 02:12:57 UTC | 2018-08-03 02:12:57 UTC |
| 246 | Brandon Ingram           | 14      | 2018-08-03 02:12:57 UTC | 2018-08-03 02:12:57 UTC |
| 247 | LeBron James             | 14      | 2018-08-03 02:12:57 UTC | 2018-08-03 02:12:57 UTC |
| 248 | Kyle Kuzma               | 14      | 2018-08-03 02:12:57 UTC | 2018-08-03 02:12:57 UTC |
| 249 | JaVale McGee             | 14      | 2018-08-03 02:12:57 UTC | 2018-08-03 02:12:57 UTC |
| 250 | Sviatoslav Mykhailiuk    | 14      | 2018-08-03 02:12:57 UTC | 2018-08-03 02:12:57 UTC |
| 251 | Gary Payton II           | 14      | 2018-08-03 02:12:57 UTC | 2018-08-03 02:12:57 UTC |
| 252 | Rajon Rondo              | 14      | 2018-08-03 02:12:57 UTC | 2018-08-03 02:12:57 UTC |
| 253 | Lance Stephenson         | 14      | 2018-08-03 02:12:57 UTC | 2018-08-03 02:12:57 UTC |
| 254 | Moritz Wagner            | 14      | 2018-08-03 02:12:57 UTC | 2018-08-03 02:12:57 UTC |
| 255 | Travis Wear              | 14      | 2018-08-03 02:12:57 UTC | 2018-08-03 02:12:57 UTC |
| 256 | Johnathan Williams       | 14      | 2018-08-03 02:12:57 UTC | 2018-08-03 02:12:57 UTC |
| 257 | Ivica Zubac              | 14      | 2018-08-03 02:12:57 UTC | 2018-08-03 02:12:57 UTC |
+-----+--------------------------+---------+-------------------------+-------------------------+
42 rows in set


==================================================================
[ #4 ]:   Retrieve all teams that have any player that start their
          name with the letter 'Z' by using .includes and .joins
==================================================================

Player.joins(:team).where("players.name like 'z%'")

+-----+---------------+---------+-------------------------+-------------------------+
| id  | name          | team_id | created_at              | updated_at              |
+-----+---------------+---------+-------------------------+-------------------------+
| 84  | Zach LaVine   | 5       | 2018-08-03 02:12:54 UTC | 2018-08-03 02:12:54 UTC |
| 160 | Zaza Pachulia | 9       | 2018-08-03 02:12:55 UTC | 2018-08-03 02:12:55 UTC |
| 198 | Zhou Qi       | 11      | 2018-08-03 02:12:56 UTC | 2018-08-03 02:12:56 UTC |
| 430 | Zhaire Smith  | 23      | 2018-08-03 02:12:59 UTC | 2018-08-03 02:12:59 UTC |
| 452 | Zach Collins  | 25      | 2018-08-03 02:13:00 UTC | 2018-08-03 02:13:00 UTC |
| 482 | Zach Randolph | 26      | 2018-08-03 02:13:00 UTC | 2018-08-03 02:13:00 UTC |
+-----+---------------+---------+-------------------------+-------------------------+
6 rows in set