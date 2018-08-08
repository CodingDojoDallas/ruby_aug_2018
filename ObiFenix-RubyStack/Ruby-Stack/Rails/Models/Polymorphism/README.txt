== README
                                ==========================================
                                ||  Assignment: Blogs/Posts/Messages II ||
                                ------------------------------------------
                                || <> Applying Polymorphism...          ||
                                ==========================================

rails new blog-post-messages1
cd blog-post-messages1

<>  Added some packages, modifying this way the genereated file 'Gemfile'
    ---------------------------------------------------------------------
    gem 'hirb'                  # Using hirb (0.7.3)

<> Then run in the console:
    ----------------------
    'bundle install'


========================================
[ #0 ]: Create appropriate tables/models
========================================
<>  First:
    ----
    rails g model User first_name:string last_name:string email:string
    rails g model Blog name:string description:text
    rails g model Post blog:references title:string content:text
    rails g model Message post:references author:string message:text
    rails g model Owner user:INT blog:INT
    rails g model Comment content:text imageable:references{polymorphic}

<>  Next: Edited/Modifying this way the genereated file:
    ----
    »   [ 'blog.rb' ]
        class Blog < ActiveRecord::Base
            has_many  :comments, as: :imageable  # Polymorphic Relationship
            has_many  :posts, dependent: :destroy
            validates :name, :description, presence: true
        end

    »   [ 'post.rb' ]
        class Post < ActiveRecord::Base
            belongs_to :blog
            has_many   :comments, as: :imageabl  # Polymorphic Relationship
            has_many   :messages, dependent: :destroy
            validates  :author, :message, presence: true
        end

    »   [ 'message.rb' ]
        class Message < ActiveRecord::Base
            belongs_to :post
            has_many   :comments, as: :imageabl  # Polymorphic Relationship
            validates  :author, :message, presence: true
            validates  :message, :length: { minimum: 7 }
        end

    »   [ 'owner.rb' ]
        class Owner < ActiveRecord::Base
            belongs_to :user
            belongs_to :blog
        end

    »   [ 'user.rb' ]
        class User < ActiveRecord::Base
            EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
            has_many  :posts, dependent: :destroy
            has_many  :messages, dependent: :destroy
            has_many  :owners, dependent: :destroy
            validates :first_name, :last_name, :email, presence: true, length: { in: 2..20 }
            validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
        end
<>  Then
    ----
    rake db:migrate


=========================================
[ #1 ]: Using ruby console create 5 users
=========================================

<>  In the VM, enter into the rails console:
    ---------------------------------------
    rail c
    Hirb.enable

    User.create(first_name:'Dorian', last_name:'Gringo', email:'dgringo@gmail.com')
    User.create(first_name:'Deleon', last_name:'Flash', email:'dflash@yahoo.fr')

    User.all
    +----+--------------+-----------+----------------------+-------------------------+-------------------------+
    | id | first_name   | last_name | email                | created_at              | updated_at              |
    +----+--------------+-----------+----------------------+-------------------------+-------------------------+
    | 1  | Dorian       | Gringo    | dgringo@gmail.com    | 2018-08-03 16:56:53 UTC | 2018-08-03 16:56:53 UTC |
    | 2  | Deleon       | Flash     | dflash@yahoo.fr      | 2018-08-03 16:58:31 UTC | 2018-08-03 16:58:31 UTC |
    +----+--------------+-----------+----------------------+-------------------------+-------------------------+
    5 rows in set


=========================================
[ #2 ]: Using ruby console create 5 blogs
=========================================

<>  In the VM, enter into the rails console:
    ---------------------------------------
    rail c
    Hirb.enable

    Blog.create(name:"Meetup in Barcelona, Spain", description: "Rihana Concert in Mar-Bella Beach!")
    Blog.create(name:"CodingDojo Dallas, TX", description: "Open House (Orientation) at 18:00")

    Blog.all
    +----+------------------------------+------------------------------------+-------------------------+-------------------------+
    | id | name                         | description                        | created_at              | updated_at              |
    +----+------------------------------+------------------------------------+-------------------------+-------------------------+
    | 1  | Meetup in Barcelona, Spain   | Rihana Concert in Mar-Bella Beach! | 2018-08-03 18:22:22 UTC | 2018-08-03 18:40:37 UTC |
    | 2  | Meetup at CodingDojo Dallas  | Open House (Orientation) at 18:00  | 2018-08-03 18:37:14 UTC | 2018-08-03 18:37:14 UTC |
    +----+------------------------------+------------------------------------+-------------------------+-------------------------+

... Basically, including all previous queries made from BlogPostMessage II Assignment

======================
[ #3 ]:   Testing CRUD
======================


# =========================================================================== ADD / CREATE
# Content Imageable for 1st Items
    Comment.create(content:"User    #1 Content", imageable:User.first)
    Comment.create(content:"Blog    #1 Content", imageable:Blog.first)
    Comment.create(content:"Post    #1 Content", imageable:Post.first)
    Comment.create(content:"Message #1 Content", imageable:Messsage.first)

# Content Imageable for 2nd Items
    Comment.create(content:"User    #2 Content", imageable:User.second)
    Comment.create(content:"Blog    #2 Content", imageable:Blog.second)
    Comment.create(content:"Post    #2 Content", imageable:Post.second)
    Comment.create(content:"Message #2 Content", imageable:Messsage.second)


# =========================================================================== VIEW / SHOW (Details)
  User.first.comments
  +----+--------------------+--------------+----------------+-------------------------+-------------------------+
  | id | content            | imageable_id | imageable_type | created_at              | updated_at              |
  +----+--------------------+--------------+----------------+-------------------------+-------------------------+
  | 1  | User    #1 Content | 1            | User           | 2018-08-05 00:20:47 UTC | 2018-08-05 00:20:47 UTC |
  +----+--------------------+--------------+----------------+-------------------------+-------------------------+

   User.second.comments
  +----+--------------------+--------------+----------------+-------------------------+-------------------------+
  | id | content            | imageable_id | imageable_type | created_at              | updated_at              |
  +----+--------------------+--------------+----------------+-------------------------+-------------------------+
  | 5  | User    #2 Content | 2            | User           | 2018-08-05 00:21:12 UTC | 2018-08-05 00:21:12 UTC |
  +----+--------------------+--------------+----------------+-------------------------+-------------------------+
  1 row in set
                                                ...
  or

  Comments.all
  +----+--------------------+--------------+----------------+-------------------------+-------------------------+
  | id | content            | imageable_id | imageable_type | created_at              | updated_at              |
  +----+--------------------+--------------+----------------+-------------------------+-------------------------+
  | 1  | User    #1 Content | 1            | User           | 2018-08-05 00:20:47 UTC | 2018-08-05 00:20:47 UTC |
  | 2  | Blog    #1 Content | 1            | Blog           | 2018-08-05 00:20:53 UTC | 2018-08-05 00:20:53 UTC |
  | 3  | Post    #1 Content | 2            | Post           | 2018-08-05 00:20:59 UTC | 2018-08-05 00:20:59 UTC |
  | 4  | Message #1 Content | 2            | Messsage       | 2018-08-05 00:21:05 UTC | 2018-08-05 00:21:05 UTC |
  | 5  | User    #2 Content | 3            | User           | 2018-08-05 00:21:12 UTC | 2018-08-05 00:21:12 UTC |
  | 6  | Blog    #2 Content | 3            | Blog           | 2018-08-05 00:21:18 UTC | 2018-08-05 00:21:18 UTC |
  | 7  | Post    #2 Content | 4            | Post           | 2018-08-05 00:21:27 UTC | 2018-08-05 00:21:27 UTC |
  | 8  | Message #2 Content | 4            | Messsage       | 2018-08-05 00:21:35 UTC | 2018-08-05 00:21:35 UTC |
  +----+--------------------+--------------+----------------+-------------------------+-------------------------+


# =========================================================================== EDIT / UPDATE
  Comment.first.update(content: "User    #1 content Updated")

  Comment.first
  +----+----------------------------+--------------+----------------+-------------------------+-------------------------+
  | id | content                    | imageable_id | imageable_type | created_at              | updated_at              |
  +----+----------------------------+--------------+----------------+-------------------------+-------------------------+
  | 1  | User    #1 content Updated | 6            | User           | 2018-08-05 00:20:47 UTC | 2018-08-05 01:32:21 UTC |
  +----+----------------------------+--------------+----------------+-------------------------+-------------------------+
  1 row in set



# =========================================================================== DELETE / DESTROY
  Comment.first.destroy

  Comment Load (2.3ms)  SELECT  "comments".* FROM "comments"  ORDER BY "comments"."id" ASC LIMIT 1
    (0.1ms)  begin transaction
  SQL (3.4ms)  DELETE FROM "comments" WHERE "comments"."id" = ?  [["id", 21]]
    (3.1ms)  commit transaction
  +----+----------------------------+--------------+----------------+-------------------------+-------------------------+
  | id | content                    | imageable_id | imageable_type | created_at              | updated_at              |
  +----+----------------------------+--------------+----------------+-------------------------+-------------------------+
  | 21 | User    #1 content Updated | 6            | User           | 2018-08-05 00:20:47 UTC | 2018-08-05 01:32:21 UTC |
  +----+----------------------------+--------------+----------------+-------------------------+-------------------------+

  Comment.all
  +----+--------------------+--------------+----------------+-------------------------+-------------------------+
  | id | content            | imageable_id | imageable_type | created_at              | updated_at              |
  +----+--------------------+--------------+----------------+-------------------------+-------------------------+
  | 2  | Blog    #1 Content | 1            | Blog           | 2018-08-05 00:20:53 UTC | 2018-08-05 00:20:53 UTC |
  | 3  | Post    #1 Content | 2            | Post           | 2018-08-05 00:20:59 UTC | 2018-08-05 00:20:59 UTC |
  | 4  | Message #1 Content | 2            | Messsage       | 2018-08-05 00:21:05 UTC | 2018-08-05 00:21:05 UTC |
  | 5  | User    #2 Content | 3            | User           | 2018-08-05 00:21:12 UTC | 2018-08-05 00:21:12 UTC |
  | 6  | Blog    #2 Content | 3            | Blog           | 2018-08-05 00:21:18 UTC | 2018-08-05 00:21:18 UTC |
  | 7  | Post    #2 Content | 4            | Post           | 2018-08-05 00:21:27 UTC | 2018-08-05 00:21:27 UTC |
  | 8  | Message #2 Content | 4            | Messsage       | 2018-08-05 00:21:35 UTC | 2018-08-05 00:21:35 UTC |
  +----+--------------------+--------------+----------------+-------------------------+-------------------------+ 