== README
                                ==========================================
                                ||  Assignment: Blogs/Posts/Messages    ||
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
    rails g model Blog name: string description: text
    rails g model Post blog: references title: string content: text
    rails g model Message post: references author: string message: text

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

<>  Then
    ----
    rake db:migrate


=========================================
[ #1 ]: Using ruby console create 5 blogs
=========================================

<>  In the VM, enter into the rails console:
    ---------------------------------------
    rail c
    Hirb.enable

    Blog.create(name:'Design & Coding in Python', description: 'Modern designs & dode patterns are placing Python...' )
    Blog.create(name:'Code Sinplicity', description: '1000 lines of code can be overated...' )
    Blog.create(name:'Java, SQL and JOOQ', description: 'Java, SQL and JOOQ is a content rich blog1 = blog full of tricks, ...' )
    Blog.create(name:'Coding is a Must-Have Job Skill', description: 'Whether you’re a newly grad, a job seeker or a career switcher...' )
    Blog.create(name:'Coding Dojo', description: 'Coding Dojo was founded on the belief that anyone can learn to code.' )

    Blog.all
    +----+----------------------------+----------------------------------+-------------------------+-------------------------+
    | id | name                       | description                      | created_at              | updated_at              |
    +----+----------------------------+----------------------------------+-------------------------+-------------------------+
    | 1  | Design & Coding in Python  | Modern designs & dode pattern... | 2018-08-02 21:30:02 UTC | 2018-08-02 21:30:02 UTC |
    | 2  | Code Sinplicity            | If you are looking for an exp... | 2018-08-02 21:31:13 UTC | 2018-08-02 21:31:13 UTC |
    | 3  | Java, SQL and JOOQ         | Java, SQL and JOOQ is a conte... | 2018-08-02 21:32:18 UTC | 2018-08-02 21:32:18 UTC |
    | 4  | Coding is a Must-Have Job  | Whether you’re a newly grad, ... | 2018-08-02 21:34:39 UTC | 2018-08-02 21:34:39 UTC |
    | 5  | Coding Dojo                | Coding Dojo was founded on th... | 2018-08-02 21:40:45 UTC | 2018-08-02 21:40:45 UTC |
    +----+----------------------------+----------------------------------+-------------------------+-------------------------+


===========================================
[ #2 ]:   Create several post for each blog
===========================================
Post.create(
    blog: Blog.first,
    title: "Python? Do not think so', content:'I rather Javascript for web development")
Post.create(
    blog: Blog.first,
    title: "Python??", content:"I personally prefer c# when it comes down to web development.")
Post.create(
    blog: Blog.first,
    title: 'Love Python!', content:'Python is a high-level, interpreted and general-purpose dynamic programming language...'
... etc.

Post.all
+----+---------+-----------------+----------------------------+-------------------------+-------------------------+
| id | blog_id | title           | content                    | created_at              | updated_at              |
+----+---------+-----------------+----------------------------+-------------------------+-------------------------+
| 1  | 1       | Why Python?     | I rather Javascript for... | 2018-08-02 23:32:39 UTC | 2018-08-02 23:32:39 UTC |
| 2  | 1       | Python??        | I personally do not lik... | 2018-08-02 23:35:23 UTC | 2018-08-02 23:35:23 UTC |
| 3  | 1       | Python???       | Well! Python is a high-... | 2018-08-02 23:38:07 UTC | 2018-08-02 23:38:07 UTC |
| 5  | 2       | Code Simplicity | Understanding Software ... | 2018-08-02 23:49:18 UTC | 2018-08-02 23:49:18 UTC |
| 6  | 2       | Code Symplicity | There’s a lot to know a... | 2018-08-02 23:54:48 UTC | 2018-08-02 23:54:48 UTC |
| 7  | 3       | Why JavaScript  | JavaScript is eating th... | 2018-08-03 00:07:54 UTC | 2018-08-03 00:07:54 UTC |
| 8  | 5       | Why Javascript  | JavaScript is a modern ... | 2018-08-03 00:13:01 UTC | 2018-08-03 00:15:54 UTC |
+----+---------+-----------------------------+----------------------------+-------------------------+-------------------------+
7 rows in set


===============================================
[ #3 ]:   Create several messages for each post
===============================================
Message.create(
    post: Post.first, author: "Juan Antonio",
    message:"I love your post. I myself planning to take some Python classes. Is there any tools you'd recommend me?")
Message.create(
    post: Post.first, author: "Jorge",
    message:"I love the post. Very informative!")
Message.create(
    post: Post.first, author: "James",
    message:"I am currently working with adruinos. Do you think Python would ne the best way to go?"
... etc.


================================================
[ #4 ]:   Retrieve all posts for the first blog.
================================================

Blog.first.posts
+----+---------+--------------+----------------------------+-------------------------+-------------------------+
| id | blog_id | title        | content                    | created_at              | updated_at              |
+----+---------+--------------+----------------------------+-------------------------+-------------------------+
| 1  | 1       | Why Python?  | I rather Javascript for... | 2018-08-02 23:32:39 UTC | 2018-08-02 23:32:39 UTC |
| 2  | 1       | Python??     | I personally do not lik... | 2018-08-02 23:35:23 UTC | 2018-08-02 23:35:23 UTC |
| 3  | 1       | Python???    | Well! Python is a high-... | 2018-08-02 23:38:07 UTC | 2018-08-02 23:38:07 UTC |
+----+---------+--------------+----------------------------+-------------------------+-------------------------+
3 rows in set


================================================
[ #5 ]:   Retrieve all posts for the first blog.
================================================

Blog.last.posts.order("title DESC")
+----+---------+-----------------+---------------------------+-------------------------+-------------------------+
| id | blog_id | title           | content                   | created_at              | updated_at              |
+----+---------+-----------------+---------------------------+-------------------------+-------------------------+
| 8  | 5       | Why Javascript? | JavaScript is a modern... | 2018-08-03 00:13:01 UTC | 2018-08-03 00:15:54 UTC |
| 9  | 5       | Coding Dojo     | It is probably one of...  | 2018-08-03 00:50:43 UTC | 2018-08-03 00:50:43 UTC |
| 10 | 5       | Best Bootcamp   | I had a very stressful... | 2018-08-03 00:55:45 UTC | 2018-08-03 00:55:45 UTC |
+----+---------+-----------------+---------------------------+-------------------------+-------------------------+
3 rows in set


======================================
[ #6 ]:   Update the first post title.
======================================

Post.first.update(title:  "Python?")

+----+---------+-----------------+----------------------------+-------------------------+-------------------------+
| id | blog_id | title           | content                    | created_at              | updated_at              |
+----+---------+-----------------+----------------------------+-------------------------+-------------------------+
| 1  | 1       | Why Python?     | I rather Javascript for... | 2018-08-02 23:32:39 UTC | 2018-08-03 01:13:25 UTC |
| 2  | 1       | Python??        | I personally do not lik... | 2018-08-02 23:35:23 UTC | 2018-08-02 23:35:23 UTC |
| 3  | 1       | Python???       | Well! Python is a high-... | 2018-08-02 23:38:07 UTC | 2018-08-02 23:38:07 UTC |
| 5  | 2       | Code Simplicity | Understanding Software ... | 2018-08-02 23:49:18 UTC | 2018-08-02 23:49:18 UTC |
| 6  | 2       | Code Symplicity | There’s a lot to know a... | 2018-08-02 23:54:48 UTC | 2018-08-02 23:54:48 UTC |
| 7  | 3       | Why JavaScript  | JavaScript is eating th... | 2018-08-03 00:07:54 UTC | 2018-08-03 00:07:54 UTC |
| 8  | 5       | Why Javascript  | JavaScript is a modern ... | 2018-08-03 00:13:01 UTC | 2018-08-03 00:15:54 UTC |
| 9  | 5       | Coding Dojo?    | It is probably one of t... | 2018-08-03 00:50:43 UTC | 2018-08-03 00:50:43 UTC |
| 10 | 5       | Best Bootcamp   | I had a very stressful ... | 2018-08-03 00:55:45 UTC | 2018-08-03 00:55:45 UTC |
+----+---------+-----------------+----------------------------+-------------------------+-------------------------+
9 rows in set



===============================
[ #7 ]:   Delete the third post
===============================
<>  (shall automatically delete all messages associated with the third post when you delete the third post).

    2.3.1 :032 > Post.third.delete

    Post Load (4.0ms)  SELECT  "posts".* FROM "posts"  ORDER BY "posts"."id" ASC LIMIT 1 OFFSET 2
    SQL (8.1ms)  DELETE FROM "posts" WHERE "posts"."id" = ?  [["id", 3]]
    +----+---------+-------------+----------------------------+-------------------------+-------------------------+
    | id | blog_id | title       | content                    | created_at              | updated_at              |
    +----+---------+-------------+----------------------------+-------------------------+-------------------------+
    | 3  | 1       | Why Python? | Well! Python is a high-... | 2018-08-02 23:38:07 UTC | 2018-08-02 23:38:07 UTC |
    +----+---------+-------------+----------------------------+-------------------------+-------------------------+
    1 row in set



============================
[ #8 ]:   Retrieve all blogs
============================

Blog.all

2.3.1 :033 > Blog.all
  Blog Load (2.6ms)  SELECT "blogs".* FROM "blogs"
+----+--------------------+--------------------------------------+-------------------------+-------------------------+
| id | name               | description                          | created_at              | updated_at              |
+----+--------------------+--------------------------------------+-------------------------+-------------------------+
| 1  | Design & Coding in | Modern designs & dode patterns...    | 2018-08-02 23:20:28 UTC | 2018-08-02 23:20:28 UTC |
| 2  | Code Sinplicity    | Understanding Software has become... | 2018-08-02 23:21:09 UTC | 2018-08-02 23:21:09 UTC |
| 3  | Java, SQL and JOOQ | Java, SQL and JOOQ is a content...   | 2018-08-02 23:21:21 UTC | 2018-08-02 23:21:21 UTC |
| 5  | Coding Dojo        | Coding Dojo...                       | 2018-08-02 23:21:45 UTC | 2018-08-02 23:21:45 UTC |
+----+--------------------+--------------------------------------+-------------------------+-------------------------+
4 rows in set


====================================================
[ #9 ]:   Retrieve all blogs whose id is less than 5
====================================================

2.3.1 :035 > Blog.where("id < ?", 5)
  Blog Load (2.6ms)  SELECT "blogs".* FROM "blogs" WHERE (id < 5)
+----+--------------------+----------------------------------------+-------------------------+-------------------------+
| id | name               | description                            | created_at              | updated_at              |
+----+--------------------+----------------------------------------+-------------------------+-------------------------+
| 1  | Design & Coding    | Modern designs & dode patterns are ... | 2018-08-02 23:20:28 UTC | 2018-08-02 23:20:28 UTC |
| 2  | Code Sinplicity    | Understanding Software has become...   | 2018-08-02 23:21:09 UTC | 2018-08-02 23:21:09 UTC |
| 3  | Java, SQL and JOOQ | Java, SQL and JOOQ is a content ric... | 2018-08-02 23:21:21 UTC | 2018-08-02 23:21:21 UTC |
+----+--------------------+----------------------------------------+-------------------------+-------------------------+
3 rows in set