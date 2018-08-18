== Testing


===========================================================
[ Step 1 ]  Make sure the models are properly loaded and
            have no issues creating instances of the models
===========================================================

2.3.1 :002 > User.new
+----+------------+-----------+------------+------------+
| id | first_name | last_name | created_at | updated_at |
+----+------------+-----------+------------+------------+
|    |            |           |            |            |
+----+------------+-----------+------------+------------+
1 row in set

2.3.1 :003 > Follow.new
+----+-------------+-------------+------------+------------+
| id | follower_id | followee_id | created_at | updated_at |
+----+-------------+-------------+------------+------------+
|    |             |             |            |            |
+----+-------------+-------------+------------+------------+
1 row in set


=============================
[ Step 2 ]  Create some users
=============================

User.create(first_name:"Miguel", last_name:"Obiang")
User.create(first_name:"Deleon", last_name:"Flash")
User.create(first_name:"Dorian", last_name:"Gringo")

User.all
+----+------------+-----------+-------------------------+-------------------------+
| id | first_name | last_name | created_at              | updated_at              |
+----+------------+-----------+-------------------------+-------------------------+
| 1  | Miguel     | Obiang    | 2018-08-05 03:27:07 UTC | 2018-08-05 03:27:07 UTC |
| 2  | Deleon     | Flash     | 2018-08-05 03:27:20 UTC | 2018-08-05 03:27:20 UTC |
| 3  | Dorian     | Gringo    | 2018-08-05 03:27:28 UTC | 2018-08-05 03:27:28 UTC |
+----+------------+-----------+-------------------------+-------------------------+


================================================
[ Step 3 ]  Having a user to follow another user
================================================

-------------- Here 2nd user shall follow 1st and  3rd user
Follow.create(follower_id: User.second.id, followee_id: User.first.id)
Follow.create(follower_id: User.second.id, followee_id: User.third.id)
Follow.create(follower_id: User.third.id,  followee_id: User.first.id)

-------------- Also, we can habe a user follow another using the  << notation
User.first.following << User.second
User.first.following << User.third

-------------- Also we can store the ids of items in a collection (e.g using 'pluck')
followed_by_1st = User.first.following.pluck(:id)
=> this returns an array


=========================================
Displaying the users followed by 2nd user
=========================================

User.second.following
+----+------------+-----------+-------------------------+-------------------------+
| id | first_name | last_name | created_at              | updated_at              |
+----+------------+-----------+-------------------------+-------------------------+
| 3  | Dorian     | Gringo    | 2018-08-05 03:27:28 UTC | 2018-08-05 03:27:28 UTC |
| 1  | Miguel     | Obiang    | 2018-08-05 03:27:07 UTC | 2018-08-05 03:27:07 UTC |
+----+------------+-----------+-------------------------+-------------------------+
2 rows in set


=======================================
Displaying the users following 1st user
=======================================

User.first.followed
+----+------------+-----------+-------------------------+-------------------------+
| id | first_name | last_name | created_at              | updated_at              |
+----+------------+-----------+-------------------------+-------------------------+
| 2  | Deleon     | Flash     | 2018-08-05 03:27:20 UTC | 2018-08-05 03:27:20 UTC |
| 3  | Dorian     | Gringo    | 2018-08-05 03:27:28 UTC | 2018-08-05 03:27:28 UTC |
+----+------------+-----------+-------------------------+-------------------------+
2 rows in set


=========================================
Displaying the users followed by 1st user
=========================================

User.first.following
+----+------------+-----------+-------------------------+-------------------------+
| id | first_name | last_name | created_at              | updated_at              |
+----+------------+-----------+-------------------------+-------------------------+
| 3  | Dorian     | Gringo    | 2018-08-05 03:27:28 UTC | 2018-08-05 03:27:28 UTC |
| 2  | Deleon     | Flash     | 2018-08-05 03:27:20 UTC | 2018-08-05 03:27:20 UTC |
+----+------------+-----------+-------------------------+-------------------------+



=============================================
Displaying the users NOT followed by 1st user
=============================================

User.where.not(id: User.first.following)                            #  Includes itself
+----+------------+-----------+-------------------------+-------------------------+
| id | first_name | last_name | created_at              | updated_at              |
+----+------------+-----------+-------------------------+-------------------------+
| 3  | Dorian     | Gringo    | 2018-08-05 03:27:28 UTC | 2018-08-05 03:27:28 UTC |
| 2  | Deleon     | Flash     | 2018-08-05 03:27:20 UTC | 2018-08-05 03:27:20 UTC |
+----+------------+-----------+-------------------------+-------------------------+

User.where.not(id: User.first.following).where(id: User.first.id)   #  Excludes itself
+----+------------+-----------+-------------------------+-------------------------+
| id | first_name | last_name | created_at              | updated_at              |
+----+------------+-----------+-------------------------+-------------------------+
| 1  | Miguel     | Obiang    | 2018-08-05 03:27:07 UTC | 2018-08-05 03:27:07 UTC |
+----+------------+-----------+-------------------------+-------------------------+