== README

=============================================================================
[ #1 ]: Start a new project (the name of the project should be 'dojo_ninjas')
=============================================================================
rails new dojo-ninjas
cd dojo-ninjas

<>  Added some packages, modifying this way the genereated file 'Gemfile'
    ---------------------------------------------------------------------
    gem 'hirb'                  # Using hirb (0.7.3)

<> Then run in the console:
    ----------------------
    'bundle install'


========================================
[ #2 ]: Create appropriate tables/models
========================================
<>  First:
    ----
    rails g model Dojo name:string city:string state:string
    rails g model Ninja first_name:string last_name:string dojo:references

<>  Next: edited the generated dojo file 'dojo.rb'
    ----
    class Dojo < ActiveRecord::Base
        has_many :ninjas    # Set to many
    end

<>  Then
    ----
    rake db:migrate

=========================================
[ #3 ]: Using ruby console create 3 dojos
=========================================

<>  In the VM, cd dojo-ninjas and enter console:
    -------------------------------------------
    rail c
    Hirb.enable()

    Dojo.create(name: "CodingDojo Silicon Valley", city: "Mountain View", state: "CA")
    Dojo.create(name: "CodingDojo Seattle", city: "Seattle", state: "WA")
    Dojo.create(name: "CodingDojo New York", city: "New York", state: "NY")

    Dojo.all
    +----+---------------------------+---------------+-------+-------------------------+-------------------------+
    | id | name                      | city          | state | created_at              | updated_at              |
    +----+---------------------------+---------------+-------+-------------------------+-------------------------+
    | 1  | CodingDojo Silicon Valley | Mountain View | CA    | 2018-08-02 15:53:54 UTC | 2018-08-02 15:53:54 UTC |
    | 2  | CodingDojo Seattle        | Seattle       | WA    | 2018-08-02 15:54:33 UTC | 2018-08-02 15:54:33 UTC |
    | 3  | CodingDojo New York       | New York      | NY    | 2018-08-02 15:54:47 UTC | 2018-08-02 15:54:47 UTC |
    +----+---------------------------+---------------+-------+-------------------------+-------------------------+


====================================================================
[ #4 ]: Change your models so that it does the following validations
        o   Dojo model shall require
            »  the presence of the name, city, and state
            »  the state to be two characters long
        o   Ninja model shall require
            »  the presence of the first name and last name
====================================================================

<>  Modifying this way the genereated file 'dojo.rb'
    ------------------------------------------------
        o   validates :name, :city, :state, presence: true
        o   validates :state, length: { is: 2 }, numericality: false

<>  Modifying this way the genereated file 'ninja.rb'
    -------------------------------------------------
        o   validates :first_name, :last_name, presence: true

<>  Then:
    -----
    reload!
    dojo = Dojo.new
    dojo.valid?
    dojo.errors.full_messages
    => ["Name can't be blank", "City can't be blank", "State can't be blank", "State is the wrong length (should be 2 characters)" ]

    ninja = Ninja.new
    ninja.valid?
    ninja.errors.full_messages

<>  ["First name can't be blank", "Last name can't be blank"]


===================================================================
[ #5 ]: Make sure that your ninja model belongs to the dojo
        (specify this in the model for both the dojo and the ninja)
===================================================================
<>  Alreadty cover this step in step #2 while creatin the models.


==========================
[ #6 ]:   Use ruby console
==========================

------------------------------------------------------------------------
[ #6.1 ]:   Delete the three dojos you created...
            (e.g. Dojo.find(1).destroy; also look up destroy_all method)
------------------------------------------------------------------------
Dojo.all
Dojo.destroy_all()
Dojo.all
=> #<ActiveRecord::Relation []>


---------------------------------------------------------
[ #6.2 ]:   Create 3 additional dojos by using Dojo.new()
---------------------------------------------------------
dojo01 = Dojo.create(name: "CodingDojo Silicon Valley", city: "Mountain View", state: "CA")
dojo02 = Dojo.create(name: "CodingDojo Seattle", city: "Seattle", state: "WA")
dojo03 = Dojo.create(name: "CodingDojo New York", city: "New York", state: "NY")

Dojo.all
+----+---------------------------+---------------+-------+-------------------------+-------------------------+
| id | name                      | city          | state | created_at              | updated_at              |
+----+---------------------------+---------------+-------+-------------------------+-------------------------+
| 4  | CodingDojo Silicon Valley | Mountain View | CA    | 2018-08-02 18:15:38 UTC | 2018-08-02 18:15:38 UTC |
| 5  | CodingDojo Seattle        | Seattle       | WA    | 2018-08-02 18:16:07 UTC | 2018-08-02 18:16:07 UTC |
| 6  | CodingDojo New York       | New York      | NY    | 2018-08-02 18:16:50 UTC | 2018-08-02 18:16:50 UTC |
+----+---------------------------+---------------+-------+-------------------------+-------------------------+


--------------------------------------------------------------------------------------
[ #6.3 ]:   Try to create a few more dojos but without specifying some of the required
            fields. Make sure that the validation works and generates the errors.
--------------------------------------------------------------------------------------
dojo04 = Dojo.new
dojo04.valid?
dojo04.errors.full_messages
=> ["Name can't be blank", "City can't be blank", "State can't be blank", "State is the wrong length (should be 2 characters)"]

dojo05 = Dojo.new(name: "CodingDojo Austin")
dojo05.valid?
dojo05.errors.full_messages
=> ["City can't be blank", "State can't be blank", "State is the wrong length (should be 2 characters)"]

dojo06 = Dojo.new(name: "CodingDojo Austin", city: "Austin")
dojo06.valid?
dojo06.errors.full_messages
=> ["State can't be blank", "State is the wrong length (should be 2 characters)"]


-------------------------------------------------------------------
[ #6.4 ]: Create 3 ninjas that belong to the first dojo you created
-------------------------------------------------------------------
Ninja.create(first_name: "Ramona", last_name: "Valdez", dojo_id: 4)
Ninja.create(first_name: "Matt", last_name: "Tucker", dojo_id: 4)
Ninja.create(first_name: "Martin", last_name: "Nguema", dojo_id: 4)

Ninja.all
+----+------------+-----------+---------+-------------------------+-------------------------+
| id | first_name | last_name | dojo_id | created_at              | updated_at              |
+----+------------+-----------+---------+-------------------------+-------------------------+
| 1  | Ramona     | Valdez    | 4       | 2018-08-02 18:25:05 UTC | 2018-08-02 18:29:39 UTC |
| 2  | Matt       | Tucker    | 4       | 2018-08-02 18:25:54 UTC | 2018-08-02 18:25:54 UTC |
| 3  | Martin     | Nguema    | 4       | 2018-08-02 18:26:11 UTC | 2018-08-02 18:26:11 UTC |
+----+------------+-----------+---------+-------------------------+-------------------------+


----------------------------------------------------------------------------------
[ #6.5 ]: Create 3 more ninjas and have them belong to the second dojo you created
----------------------------------------------------------------------------------
Ninja.create(first_name: "Leandro", last_name: "Obama", dojo_id: 5)
Ninja.create(first_name: "Santhia", last_name: "Perez", dojo_id: 5)
Ninja.create(first_name: "Michael", last_name: "Scott", dojo_id: 5)

Ninja.all
+----+------------+--------------+---------+-------------------------+-------------------------+
| id | first_name | last_name    | dojo_id | created_at              | updated_at              |
+----+------------+--------------+---------+-------------------------+-------------------------+
| 1  | Ramona     | Valdez       | 4       | 2018-08-02 18:25:05 UTC | 2018-08-02 18:29:39 UTC |
| 2  | Matt       | Tucker       | 4       | 2018-08-02 18:25:54 UTC | 2018-08-02 18:25:54 UTC |
| 3  | Martin     | Nguema Scott | 4       | 2018-08-02 18:26:11 UTC | 2018-08-02 18:41:38 UTC |
| 4  | Leandro    | Obama        | 5       | 2018-08-02 18:32:13 UTC | 2018-08-02 18:32:13 UTC |
| 5  | Santhia    | Perez        | 5       | 2018-08-02 18:32:53 UTC | 2018-08-02 18:32:53 UTC |
| 6  | Michael    | Scott        | 5       | 2018-08-02 18:33:27 UTC | 2018-08-02 18:33:27 UTC |
+----+------------+--------------+---------+-------------------------+-------------------------+


---------------------------------------------------------------------------------
[ #6.6 ]: Create 3 more ninjas and have them belong to the third dojo you created
---------------------------------------------------------------------------------
Ninja.create(first_name: "Mary", last_name: "Norway", dojo_id: 6)
Ninja.create(first_name: "Olivia", last_name: "Pain", dojo_id: 6)
Ninja.create(first_name: "Queen", last_name: "Rose", dojo_id: 6)

Ninja.all
+----+--------------+--------------+---------+-------------------------+-------------------------+
| id | first_name   | last_name    | dojo_id | created_at              | updated_at              |
+----+--------------+--------------+---------+-------------------------+-------------------------+
| 1  | Ramona       | Valdez       | 4       | 2018-08-02 18:25:05 UTC | 2018-08-02 18:29:39 UTC |
| 2  | Matt         | Tucker       | 4       | 2018-08-02 18:25:54 UTC | 2018-08-02 18:25:54 UTC |
| 3  | Martin       | Nguema Scott | 4       | 2018-08-02 18:26:11 UTC | 2018-08-02 18:41:38 UTC |
| 4  | Leandro      | Obama        | 5       | 2018-08-02 18:32:13 UTC | 2018-08-02 18:32:13 UTC |
| 5  | Santhia      | Perez        | 5       | 2018-08-02 18:32:53 UTC | 2018-08-02 18:32:53 UTC |
| 6  | Michael      | Scott        | 5       | 2018-08-02 18:33:27 UTC | 2018-08-02 18:33:27 UTC |
| 7  | Isidoro      | Obiang       | 6       | 2018-08-02 18:45:31 UTC | 2018-08-02 18:45:31 UTC |
| 8  | Teresa       | Avoro        | 6       | 2018-08-02 18:45:53 UTC | 2018-08-02 18:45:53 UTC |
| 9  | Juan Antonio | Obiang       | 6       | 2018-08-02 18:46:15 UTC | 2018-08-02 18:46:15 UTC |
+----+--------------+--------------+---------+-------------------------+-------------------------+


----------------------------------------------------------------------------
[ #6.7 ]: Make sure you understand how to get all of the ninjas for any dojo
          (e.g. get all the ninjas for the first dojo, second dojo, etc)
----------------------------------------------------------------------------
Dojo.find(4).ninjas                                                 # Find by <ID>
Dojo.find_by(:name => "CodingDojo Silicon Valley").ninjas           # Find by <name>
+----+--------------+--------------+---------+-------------------------+-------------------------+
| id | first_name   | last_name    | dojo_id | created_at              | updated_at              |
+----+--------------+--------------+---------+-------------------------+-------------------------+
| 1  | Ramona       | Valdez       | 4       | 2018-08-02 18:25:05 UTC | 2018-08-02 18:29:39 UTC |
| 2  | Matt         | Tucker       | 4       | 2018-08-02 18:25:54 UTC | 2018-08-02 18:25:54 UTC |
| 3  | Martin       | Nguema Scott | 4       | 2018-08-02 18:26:11 UTC | 2018-08-02 18:41:38 UTC |
+----+--------------+--------------+---------+-------------------------+-------------------------+

Dojo.find(5).ninjas                                                 # Find by <ID>
Dojo.find_by(:city => "Seattle").ninjas                             # Find by <city>
+----+--------------+--------------+---------+-------------------------+-------------------------+
| id | first_name   | last_name    | dojo_id | created_at              | updated_at              |
+----+--------------+--------------+---------+-------------------------+-------------------------+
| 4  | Leandro      | Obama        | 5       | 2018-08-02 18:32:13 UTC | 2018-08-02 18:32:13 UTC |
| 5  | Santhia      | Perez        | 5       | 2018-08-02 18:32:53 UTC | 2018-08-02 18:32:53 UTC |
| 6  | Michael      | Scott        | 5       | 2018-08-02 18:33:27 UTC | 2018-08-02 18:33:27 UTC |
+----+--------------+--------------+---------+-------------------------+-------------------------+

Dojo.find(6).ninjas                                                 # Find by <ID>
Dojo.find_by(:state => "NY").ninjas                                 # Find by <state>
+----+--------------+--------------+---------+-------------------------+-------------------------+
| id | first_name   | last_name    | dojo_id | created_at              | updated_at              |
+----+--------------+--------------+---------+-------------------------+-------------------------+
| 7  | Isidoro      | Obiang       | 6       | 2018-08-02 18:45:31 UTC | 2018-08-02 18:45:31 UTC |
| 8  | Teresa       | Avoro        | 6       | 2018-08-02 18:45:53 UTC | 2018-08-02 18:45:53 UTC |
| 9  | Juan Antonio | Obiang       | 6       | 2018-08-02 18:46:15 UTC | 2018-08-02 18:46:15 UTC |
+----+--------------+--------------+---------+-------------------------+-------------------------+


---------------------------------------------------------------------------------
[ #6.8 ]:   How would you only retrieve the first_names of the ninja that belongs
            to the second dojo and order the result by created_at DESC order?
---------------------------------------------------------------------------------

Dojo.find(6).ninjas.select("first_name").order("first_name DESC")
+----+------------+
| id | first_name |
+----+------------+
| 5  | Santhia    |
| 6  | Michael    |
| 4  | Leandro    |
+----+------------+


------------------------------------------------------------------------------
[ #6.9 ]:   Delete the second dojo. How could you adjust your model so that it
            automatically removes all of the ninjas associated with that dojo?
------------------------------------------------------------------------------
=> Added back-end validation, modifying this way the genereated file 'dojo.rb'
    o  has_many :ninjas, :dependent => :destroy

reload!
Dojo.find(5).destroy

   (2.8ms)  commit transaction
    +----+--------------------+---------+-------+-------------------------+-------------------------+
    | id | name               | city    | state | created_at              | updated_at              |
    +----+--------------------+---------+-------+-------------------------+-------------------------+
    | 6  | CodingDojo Seattle | Seattle | WA    | 2018-08-02 18:16:07 UTC | 2018-08-02 18:16:07 UTC |
    +----+--------------------+---------+-------+-------------------------+-------------------------+

    1 row in set
    2.3.1 :008 > Dojo.all
    Dojo Load (2.7ms)  SELECT "dojos".* FROM "dojos"
    +----+---------------------------+---------------+-------+-------------------------+-------------------------+
    | id | name                      | city          | state | created_at              | updated_at              |
    +----+---------------------------+---------------+-------+-------------------------+-------------------------+
    | 5  | CodingDojo Silicon Valley | Mountain View | CA    | 2018-08-02 18:15:38 UTC | 2018-08-02 18:15:38 UTC |
    | 7  | CodingDojo New York       | New York      | NY    | 2018-08-02 18:16:50 UTC | 2018-08-02 18:16:50 UTC |
    +----+---------------------------+---------------+-------+-------------------------+-------------------------+