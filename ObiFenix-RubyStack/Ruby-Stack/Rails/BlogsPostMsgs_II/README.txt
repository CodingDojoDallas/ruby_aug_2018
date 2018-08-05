== README
                                ==========================================
                                ||  Assignment: Blogs/Posts/Messages II ||
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
    rails g model User first_name: string last_name: string email: string
    rails g model Blog name: string description: text
    rails g model Post blog: references title: string content: text
    rails g model Message post: references author: string message: text
    rails g model Owner user: INT blog: INT

<>  Next: Edited/Modifying this way the genereated file:
    ----
    »   [ 'blog.rb' ]
        class Blog < ActiveRecord::Base
            has_many :posts, dependent: :destroy
            validates :name, :description, presence: true
        end

    »   [ 'post.rb' ]
        class Post < ActiveRecord::Base
            belongs_to :blog
            has_many   :messages, dependent: :destroy
            validates  :author, :message, presence: true
        end

    »   [ 'message.rb' ]
        class Message < ActiveRecord::Base
            belongs_to :post
            validates :author, :message, presence: true
            validates :message, :length: { minimum: 7 }
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
    User.create(first_name:'Juan Antonio', last_name:'Avoro', email:'jtf@business.com')
    User.create(first_name:'Allen', last_name:'Iverson', email:'iverson23@gmail.com')
    User.create(first_name:'Michael', last_name:'Scofield', email:'mschofield@gmail.com')

    User.all
    +----+--------------+-----------+----------------------+-------------------------+-------------------------+
    | id | first_name   | last_name | email                | created_at              | updated_at              |
    +----+--------------+-----------+----------------------+-------------------------+-------------------------+
    | 1  | Dorian       | Gringo    | dgringo@gmail.com    | 2018-08-03 16:56:53 UTC | 2018-08-03 16:56:53 UTC |
    | 2  | Deleon       | Flash     | dflash@yahoo.fr      | 2018-08-03 16:58:31 UTC | 2018-08-03 16:58:31 UTC |
    | 3  | Juan Antonio | Avoro     | jtf@business.com     | 2018-08-03 17:00:21 UTC | 2018-08-03 17:00:21 UTC |
    | 4  | Allen        | Iverson   | iverson23@gmail.com  | 2018-08-03 17:12:02 UTC | 2018-08-03 17:12:02 UTC |
    | 5  | Michael      | Scofield  | mschofield@gmail.com | 2018-08-03 17:12:50 UTC | 2018-08-03 17:12:50 UTC |
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
    Blog.create(name:"Meetup Denton, Texas", description: "Free Beers at Frystreet at 19:00 ")
    Blog.create(name:"Meetup Vegas, CA ", description: "Club Night in Vegas at 20:00")
    Blog.create(name:"CodingDojo Dallas, TX", description: "Open House (Orientation) at 18:00")
    Blog.create(name:"Meetup at CodingDojo", description: "Belt Exam Review! - 18:00 PM")

    Blog.all
    +----+------------------------------+------------------------------------+-------------------------+-------------------------+
    | id | name                         | description                        | created_at              | updated_at              |
    +----+------------------------------+------------------------------------+-------------------------+-------------------------+
    | 1  | Meetup in Barcelona, Spain   | Rihana Concert in Mar-Bella Beach! | 2018-08-03 18:22:22 UTC | 2018-08-03 18:40:37 UTC |
    | 2  | Meetup in Denton, Texas      | Free Beers at Frystreet at 19:00   | 2018-08-03 18:34:40 UTC | 2018-08-03 18:34:40 UTC |
    | 3  | Meetup in Vegas, CA          | Club Night in Vegas at 20:00       | 2018-08-03 18:35:36 UTC | 2018-08-03 18:35:36 UTC |
    | 4  | Meetup at CodingDojo Dallas  | Open House (Orientation) at 18:00  | 2018-08-03 18:37:14 UTC | 2018-08-03 18:37:14 UTC |
    | 5  | Meetup at CodingDojo Seattle | Belt Exam Review! - 18:00 PM       | 2018-08-03 18:44:31 UTC | 2018-08-03 18:44:31 UTC |
    +----+------------------------------+------------------------------------+-------------------------+-------------------------+


================================================================
[ #3 ]:   Have the 1st three blogs to be owned by the first user
================================================================

    Owner.create(user_id:User.first.id, blog_id:Blog.first.id)
    Owner.create(user_id:User.first.id, blog_id:Blog.second.id)
    Owner.create(user_id:User.first.id, blog_id:Blog.third.id)

    Owner.all
    +----+---------+---------+-------------------------+-------------------------+
    | id | user_id | blog_id | created_at              | updated_at              |
    +----+---------+---------+-------------------------+-------------------------+
    | 1  | 1       | 1       | 2018-08-03 19:02:15 UTC | 2018-08-03 19:02:15 UTC |
    | 2  | 1       | 2       | 2018-08-03 19:02:33 UTC | 2018-08-03 19:02:33 UTC |
    | 3  | 1       | 3       | 2018-08-03 19:02:39 UTC | 2018-08-03 19:02:39 UTC |
    +----+---------+---------+-------------------------+-------------------------+



==========================================================
[ #4 ]:   Have the 4th blog to be owned by the second user
==========================================================

    Owner.create(user_id: User.second.id, blog_id:Blog.fourth.id)
    +----+---------+---------+-------------------------+-------------------------+
    | id | user_id | blog_id | created_at              | updated_at              |
    +----+---------+---------+-------------------------+-------------------------+
    | 4  | 2       | 4       | 2018-08-03 20:06:58 UTC | 2018-08-03 20:06:58 UTC |
    +----+---------+---------+-------------------------+-------------------------+
    1 row in set


========================================================
[ #5 ]:   Have the 5th blog to be owned by the last user
========================================================

    Owner.create(user_id: User.last.id, blog_id:Blog.fifth.id)
    +----+---------+---------+-------------------------+-------------------------+
    | id | user_id | blog_id | created_at              | updated_at              |
    +----+---------+---------+-------------------------+-------------------------+
    | 5  | 5       | 5       | 2018-08-03 20:05:42 UTC | 2018-08-03 20:05:42 UTC |
    +----+---------+---------+-------------------------+-------------------------+
    1 row in set


=================================================================
[ #6 ]:   Have the third user own all the blogs that were created
=================================================================

    Blog.all.each { |blog| Owner.create(user: User.third, blog: blog) }

    Owner.where("user_id =?", User.third.id)
    +----+---------+---------+-------------------------+-------------------------+
    | id | user_id | blog_id | created_at              | updated_at              |
    +----+---------+---------+-------------------------+-------------------------+
    | 6  | 3       | 1       | 2018-08-04 18:19:00 UTC | 2018-08-04 18:19:00 UTC |
    | 7  | 3       | 2       | 2018-08-04 18:19:00 UTC | 2018-08-04 18:19:00 UTC |
    | 8  | 3       | 3       | 2018-08-04 18:19:00 UTC | 2018-08-04 18:19:00 UTC |
    | 9  | 3       | 4       | 2018-08-04 18:19:01 UTC | 2018-08-04 18:19:01 UTC |
    | 10 | 3       | 5       | 2018-08-04 18:19:01 UTC | 2018-08-04 18:19:01 UTC |
    +----+---------+---------+-------------------------+-------------------------+
    5 rows in set


==========================================================================
[ #7 ]:   Have the first user create 3 posts for the blog with an id of 2.
==========================================================================

    could have used a loop as such...
    { |i| Post.create(title: "Post ##{i}", content: "This is the content for post ##{i}", user: User.first, blog: Blog.find(2)) }

    or
    ------------------------------------------------------------------
    Hoever, I wanted to go ahead and initilized the posts with content.
    So, since there's only 3 I decided to statically created the first three posts.
    ------------------------------------------------------------------------------
    Post.create(
           blog: Blog.find(2),
           user: User.first,
          title: "In Denton?",
        content: "I might not be able to make it at that time. I shall try though!"
    )
    Post.create(
           blog: Blog.find(2),
           user: User.first,
          title: "You got me at Free Beers?",
        content: "Damn! I have not been down there in forever."
    )
    Post.create(
           blog: Blog.find(2),
           user: User.first,
          title: "Frystreet and Free Beers... Yeat!",
        content: "I will see y'all there...!"
    )


===============================================================
[ #8 ]:   Have the second user create 5 posts for the last blog
===============================================================

    Post.create(
           blog: Blog.last,
           user: User.second,
          title: "Requesting Information!",
        content: "How soon after orientation do we start with the bootcam?"
    )
    Post.create(
           blog: Blog.last,
           user: User.second,
          title: "In Seattle??",
        content: "I might not be able to make it. I live in Atlanta, GA."
    )
    Post.create(
           blog: Blog.last,
           user: User.second,
          title: "Another Opening House?",
        content: "It is great that thy are hosting again; I missed the last one."
    )
    Post.create(
           blog: Blog.last,
           user: User.second,
          title: "Inquiry About Python!",
        content: "I love Python! I was wondering if it shall be the first programming lang. to learn.."
    )
    Post.create(
           blog: Blog.last,
           user: User.second,
          title: "Inquiry About Tuition",
        content: "Do you provide any payment plan?"
    )


====================================================================
[ #9 ]:   Have the 3rd user create several posts for different blogs.
====================================================================

Post.create(
      title: "Is Previous Coding Experience Needed?",
    content: "I do not have previous experience in programming. Yet I want to learn!",
       user: User.third,
       blog: Blog.third
)
Post.create(
      title: "Inquiry About PHP",
    content: "Does This bootcamp offer PHP courses?",
       user: User.third,
       blog: Blog.fourth
)
Post.create(
      title: "Why Python?",
    content: "I personally prefer c# when it comes to web development.",
       user: User.third,
       blog: Blog.fifth
)


======================================================
[ #10 ]:   Have the 3rd user do the following:
------------------------------------------------------
<>  create 2 messages for the first post
<>  created and 3 messages for the second post created
======================================================

Messsage.create(
       post: Post.first,
       user: User.third,
     author: "#{User.third.first_name} #{User.third.last_name}",
    message: "I love the post. Very informative!"
)
Messsage.create(
       post: Post.first,
       user: User.third,
     author: "#{User.third.first_name} #{User.third.last_name}",
    message: "I am currently working with adruinos. Do you think Python would ne the best way to go?"
)
Messsage.create(
       post: Post.second,
       user: User.third,
     author: "#{User.third.first_name} #{User.third.last_name}",
    message: "I am not interpreted... Thanks!"
)
Messsage.create(
       post: Post.second,
       user: User.third,
     author: "#{User.third.first_name} #{User.third.last_name}",
    message: "I don't really know if I even like coding that much. Yet I am intrigued!"
)
Messsage.create(
       post: Post.second,
       user: User.third,
     author: "#{User.third.first_name} #{User.third.last_name}",
    message: "I myself was already planning to take some Python classes. Is there any tools you'd recommend me?"
)


==============================================
[ #11 ]:   Have the 4rd user do the following:
----------------------------------------------
<>  create 3 messages for the last post
==============================================

Messsage.create(
       post: Post.last,
       user: User.fourth,
     author: "#{User.fourth.first_name} #{User.fourth.last_name}",
    message: "Am I required to know Python to join the bootcamp?"
)
Messsage.create(
       post: Post.last,
       user: User.fourth,
     author: "#{User.fourth.first_name} #{User.fourth.last_name}",
    message: "I am definitely intrigued!"
)
Messsage.create(
       post: Post.last,
       user: User.fourth,
     author: "#{User.fourth.first_name} #{User.fourth.last_name}",
    message: "I am not interpreted... Thanks!"
)
... etc.


===========================================================
[ #12 ]:   Change the owner of the 2nd post to the last user
===========================================================

Post.second.update(user: User.last)

  Post Load (2.7ms)  SELECT  "posts".* FROM "posts"  ORDER BY "posts"."id" ASC LIMIT 1 OFFSET 1
  User Load (2.4ms)  SELECT  "users".* FROM "users"  ORDER BY "users"."id" DESC LIMIT 1
   (0.1ms)  begin transaction
  SQL (4.3ms)  UPDATE "posts" SET "user_id" = ?, "updated_at" = ? WHERE "posts"."id" = ?  [["user_id", 5], ["updated_at", "2018-08-04 20:37:52.125091"], ["id", 2]]
    (2.1ms)  commit transaction
 => true


========================================================
[ #13 ]:   Change the 2nd post content to something else
========================================================

Post.second.update(content: "The Content Has Changed!")

  Post Load (3.1ms)  SELECT  "posts".* FROM "posts"  ORDER BY "posts"."id" ASC LIMIT 1 OFFSET 1
   (0.1ms)  begin transaction
  SQL (5.5ms)  UPDATE "posts" SET "content" = ?, "updated_at" = ? WHERE "posts"."id" = ?  [["content", "The Content Has Changed!"], ["updated_at", "2018-08-04 20:42:41.506759"], ["id", 2]]
   (2.6ms)  commit transaction
 => true


=======================================================
[ #14 ]:   Retrieve all blogs owned by the 3rd user
-------------------------------------------------------
<>  make this work by simply doing: User.find(3).blogs)
=======================================================

User.find(3).blogs
+----+----------------------------+------------------------------------+-------------------------+-------------------------+
| id | name                       | description                        | created_at              | updated_at              |
+----+----------------------------+------------------------------------+-------------------------+-------------------------+
| 1  | Meetup in Barcelona, Spain | Rihana Concert in Mar-Bella Beach! | 2018-08-04 18:07:21 UTC | 2018-08-04 18:07:21 UTC |
| 2  | Meetup Denton, Texas       | Free Beers at Frystreet at 19:00   | 2018-08-04 18:07:35 UTC | 2018-08-04 18:07:35 UTC |
| 3  | Meetup Vegas, CA           | Club Night in Vegas at 20:00       | 2018-08-04 18:07:48 UTC | 2018-08-04 18:07:48 UTC |
| 4  | CodingDojo Dallas, TX      | Open House (Orientation) at 18:00  | 2018-08-04 18:07:58 UTC | 2018-08-04 18:07:58 UTC |
| 5  | Meetup at CodingDojo       | Belt Exam Review! at 18:00 PM      | 2018-08-04 18:08:07 UTC | 2018-08-04 18:08:07 UTC |
+----+----------------------------+------------------------------------+-------------------------+-------------------------+
5 rows in set


===========================================================
[ #15 ]:   Retrieve all posts that were created by 3rd user
===========================================================

User.find(3).posts
+----+---------+---------+-----------------------+---------------------------------+-------------------------+-------------------------+
| id | blog_id | user_id | title                 | content                         | created_at              | updated_at              |
+----+---------+---------+-----------------------+---------------------------------+-------------------------+-------------------------+
|  9 | 3       | 3       | Is Previous Coding... | I do not have previous exper... | 2018-08-04 01:40:49 UTC | 2018-08-04 01:40:49 UTC |
| 10 | 4       | 3       | Inquiry About PHP.    | Does This bootcamp offer PHP... | 2018-08-04 01:41:03 UTC | 2018-08-04 01:41:03 UTC |
| 11 | 5       | 3       | Why Python?           | I personally prefer c# when...  | 2018-08-04 01:41:13 UTC | 2018-08-04 01:41:13 UTC |
+----+---------+---------+-----------------------+---------------------------------+-------------------------+-------------------------+
3 rows in set


=================================================
[ #16 ]:   Retrieve all messages left by 3rd user
=================================================

User.third.messsages
+----+---------+---------+---------------+-----------------------------+-------------------------+-------------------------+
| id | post_id | user_id | author        | message                     | created_at              | updated_at              |
+----+---------+---------+---------------+-----------------------------+-------------------------+-------------------------+
| 2  | 1       | 3       | Juan A. Avoro | I love the post. Very In... | 2018-08-03 21:46:23 UTC | 2018-08-03 21:46:23 UTC |
| 3  | 1       | 3       | Juan A. Avoro | I am currently working w... | 2018-08-03 21:47:50 UTC | 2018-08-03 21:47:50 UTC |
| 4  | 2       | 3       | Juan A. Avoro | I am not interested... T... | 2018-08-03 21:48:24 UTC | 2018-08-03 21:48:24 UTC |
| 5  | 2       | 3       | Juan A. Avoro | I don't really know if I... | 2018-08-03 21:48:42 UTC | 2018-08-03 21:48:42 UTC |
| 9  | 2       | 3       | Juan A. Avoro | I myself was already pla... | 2018-08-03 22:04:17 UTC | 2018-08-03 22:04:17 UTC |
+----+---------+---------+---------------+-----------------------------+-------------------------+-------------------------+
6 rows in set


================================================================================================
[ #17 ]:   Retrieve all all posts associated with the blog id 5 as well as who left these posts.
================================================================================================
Post.joins(:user, :blog).where("blogs.id = ?", Blog.last.id).select("*")    # Display all associated columns in this join
or
Post.joins(:user, :blog).where("blogs.id = ?", Blog.last.id).select("first_name, last_name,blog_id,user_id,title,content")
+----+---------+---------+------------------------+------------------------------------------+--------------+-----------+
| id | blog_id | user_id | title                  | content                                  | first_name   | last_name |
+----+---------+---------+------------------------+------------------------------------------+--------------+-----------+
| 4  | 5       | 2       | Need Information!      | How soon after orientation do we start...| Deleon       | Flash     |
| 5  | 5       | 2       | In Seattle??           | I might not be able to make it. I live...| Deleon       | Flash     |
| 6  | 5       | 2       | Another Opening House? | It is great that thy are hosting again...| Deleon       | Flash     |
| 7  | 5       | 2       | Inquiry About Python!  | I love Python! I was wondering if itl... | Deleon       | Flash     |
| 8  | 5       | 2       | Inquiry About Tuition! | Do you provide any payment plan?         | Deleon       | Flash     |
| 6  | 5       | 3       | Why Python?            | I personally prefer c# when it comes...  | Juan Antonio | Avoro     |
+----+---------+---------+------------------------+------------------------------------------+--------------+-----------+
6 rows in set


===============================================================================================
[ #18 ]:   Retrieve all messages associated with the blog id 5 as well as who left these posts.
===============================================================================================

Messsage.joins(:user).where(post: Blog.fifth.posts).select("*")             # Display all associated columns in this join
or
Messsage.joins(:user).where(post: Blog.fifth.posts)                         # Exclude some columns...
+----+---------+---------+-------------+----------------------------------------------------------------------+
| id | post_id | user_id | author      | message                                                              |
+----+---------+---------+-------------+----------------------------------------------------------------------+
| 6  |  8      | 4       | Allen Avoro | I am currently working with adruinos. Do you think Python would...   |
| 7  |  2      | 4       | Allen Avoro | I am not interpreted... Thanks!                                      |
| 8  |  2      | 4       | Allen Avoro | I don't really know if I even like programming that muvh. Yet I am...|
+----+---------+---------+-------------+----------------------------------------------------------------------+
3 rows in set


============================================================================================================================
[ #19 ]:   Grab all user information of those that own the first blog (make this work by allowing Blog.first.owners to work)
============================================================================================================================

Blog.first.users
+----+--------------+-----------+-------------------+-------------------------+-------------------------+
| id | first_name   | last_name | email             | created_at              | updated_at              |
+----+--------------+-----------+-------------------+-------------------------+-------------------------+
| 1  | Dorian       | Gringo    | dgringo@gmail.com | 2018-08-04 18:11:08 UTC | 2018-08-04 18:11:08 UTC |
| 3  | Juan Antonio | Avoro     | jtf@business.com  | 2018-08-04 18:11:25 UTC | 2018-08-04 18:11:25 UTC |
+----+--------------+-----------+-------------------+-------------------------+-------------------------+
2 rows in set

also

Blog.first.owners
+----+---------+---------+-------------------------+-------------------------+
| id | user_id | blog_id | created_at              | updated_at              |
+----+---------+---------+-------------------------+-------------------------+
| 20 | 1       | 1       | 2018-08-04 18:15:10 UTC | 2018-08-04 18:15:10 UTC |
| 25 | 3       | 1       | 2018-08-04 18:19:00 UTC | 2018-08-04 18:19:00 UTC |
+----+---------+---------+-------------------------+-------------------------+
2 rows in set



================================================================================
[ #20 ]:   Change it so that the first blog is no longer owned by the first user
================================================================================

Owner.where("id = ? AND user_id = ?", 1, 1,).update_all("user_id = 2")

or

Owner.where("user_id =? and blog_id =?", User.first.id, Blog.first.id).update_all("user_id = #{User.second.id}")