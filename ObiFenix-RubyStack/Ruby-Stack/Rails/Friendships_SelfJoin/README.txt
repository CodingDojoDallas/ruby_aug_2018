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

2.3.1 :003 > Friendship.new
+----+----------+------------+------------+------------+
| id | user_id  | friend_id  | created_at | updated_at |
+----+----------+------------+------------+------------+
|    |          |            |            |            |
+----+----------+------------+------------+------------+
1 row in set


=============================
[ Step 2 ]  Create some users
=============================

User.create(first_name:"Miguel", last_name:"Obiang")
User.create(first_name:"Deleon", last_name:"Flash")
User.create(first_name:"Dorian", last_name:"Gringo")
User.create(first_name:"Dwyane", last_name:"Wade")

User.all
+----+------------+-----------+-------------------------+-------------------------+
| id | first_name | last_name | created_at              | updated_at              |
+----+------------+-----------+-------------------------+-------------------------+
| 7  | Miguel     | Obiang    | 2018-08-05 06:41:05 UTC | 2018-08-05 06:41:05 UTC |
| 8  | Deleon     | Flash     | 2018-08-05 06:41:13 UTC | 2018-08-05 06:41:13 UTC |
| 9  | Dorian     | Gringo    | 2018-08-05 06:41:15 UTC | 2018-08-05 06:41:15 UTC |
| 10 | Dwyane     | Wade      | 2018-08-05 06:54:36 UTC | 2018-08-05 06:54:36 UTC |
+----+------------+-----------+-------------------------+-------------------------+
4 rows in set


================================================
[ Step 3 ]  Having a user to friend another user
================================================

-------------- Here 2nd user shall friend 1st and  3rd user
Friendship.create(user_id: User.second.id, friend_id: User.first.id)
Friendship.create(user_id: User.second.id, friend_id: User.third.id)
Friendship.create(user_id: User.third.id,  friend_id: User.first.id)

-------------- Also, we can habe a user follow another using the  << notation
User.first.friending << User.last

-------------- Also we can store the ids of items in a collection (e.g using 'pluck')
followed_by_1st = User.first.friending.pluck(:id)
=> this returns an array [2,3]


=========================================
Displaying the users friended by 2nd user
=========================================

User.second.friending
+----+------------+-----------+-------------------------+-------------------------+
| id | first_name | last_name | created_at              | updated_at              |
+----+------------+-----------+-------------------------+-------------------------+
| 1  | Miguel     | Obiang    | 2018-08-05 06:41:05 UTC | 2018-08-05 06:41:05 UTC |
| 3  | Dorian     | Gringo    | 2018-08-05 06:41:15 UTC | 2018-08-05 06:41:15 UTC |
+----+------------+-----------+-------------------------+-------------------------+
2 rows in set


=======================================
Displaying the users friending 1st user
=======================================

User.first.friended_by
+----+------------+-----------+-------------------------+-------------------------+
| id | first_name | last_name | created_at              | updated_at              |
+----+------------+-----------+-------------------------+-------------------------+
| 2  | Deleon     | Flash     | 2018-08-05 06:41:13 UTC | 2018-08-05 06:41:13 UTC |
| 3  | Dorian     | Gringo    | 2018-08-05 06:41:15 UTC | 2018-08-05 06:41:15 UTC |
+----+------------+-----------+-------------------------+-------------------------+
2 rows in set


=========================================
Displaying the users friended by 1st user
=========================================

User.first.friending
+----+------------+-----------+-------------------------+-------------------------+
| id | first_name | last_name | created_at              | updated_at              |
+----+------------+-----------+-------------------------+-------------------------+
| 4  | Dwyane     | Wade      | 2018-08-05 06:54:36 UTC | 2018-08-05 06:54:36 UTC |
+----+------------+-----------+-------------------------+-------------------------+



=============================================
Displaying the users NOT friended by 1st user
=============================================

User.where.not(id: User.first.friending)                              #  Includes itself
+----+------------+-----------+-------------------------+-------------------------+
| id | first_name | last_name | created_at              | updated_at              |
+----+------------+-----------+-------------------------+-------------------------+
| 1  | Miguel     | Obiang    | 2018-08-05 03:27:07 UTC | 2018-08-05 03:27:07 UTC |
| 2  | Deleon     | Flash     | 2018-08-05 03:27:20 UTC | 2018-08-05 03:27:20 UTC |
| 3  | Dorian     | Gringo    | 2018-08-05 03:27:28 UTC | 2018-08-05 03:27:28 UTC |
+----+------------+-----------+-------------------------+-------------------------+

User.where.not(id: User.first.friending).where.not(id: User.first.id) #  Excludes itself
+----+------------+-----------+-------------------------+-------------------------+
| id | first_name | last_name | created_at              | updated_at              |
+----+------------+-----------+-------------------------+-------------------------+
| 2  | Deleon     | Flash     | 2018-08-05 03:27:20 UTC | 2018-08-05 03:27:20 UTC |
| 3  | Dorian     | Gringo    | 2018-08-05 03:27:28 UTC | 2018-08-05 03:27:28 UTC |
+----+------------+-----------+-------------------------+-------------------------+