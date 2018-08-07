# Create 5 users
Example:
User.create(first_name:"micah",last_name:"wu",email:"mnw247@gmail.com")
User.create(first_name:"michael",last_name:"jordan",email:"his_airness@gmail.com")
User.create(first_name:"michael",last_name:"jackson",email:"king_of_pop@gmail.com")
User.create(first_name:"michael",last_name:"johnsonn",email:"400mgoldmedalist@gmail.com")
User.create(first_name:"michael",last_name:"phelps",email:"swimminggoldmedalist@gmail.com")
User.create(first_name:"michael",last_name:"peterson",email:"americannovelist@gmail.com")
# Create 5 blogs
Example:
Blog.create(name:"Goals",description:"How to accomplish the goals you set")
Blog.create(name:"Finances",description:"How to accomplish the financial goals you set")
Blog.create(name:"Colors",description:"What is your favorite color?")
Blog.create(name:"Destinations",description:"What is the best vacation spot you've been to")
Blog.create(name:"Movies",description:"What is the best movie you've seen")

# Have the first 3 blogs be owned by the first user
User = User.find(1)
Blogs = Blog.where(id: [1..3])
User.owning_blogs << Blogs
#or
User.first.owning_blogs << Blog.second

# Have the 4th blog you create be owned by the second user
User.find(2).owning_blogs << Blog.find(4)
# Have the 5th blog you create be owned by the last user
User.find(5).owning_blogs << Blog.last
# Have the third user own all of the blogs that were created.
Blogs = Blog.where(id:[1..5])
Owner.create(user: User.find(2), blog: Blogs)

# Have the first user create 3 posts for the blog with an id of 2. Remember that you shouldn't do Post.create(user: User.first, blog_id: 2) but more like Post.create(user: User.first, blog: Blog.find(2)). Again, you should never reference the foreign key in Rails.
Post.create(user:User.first,blog:Blog.find(2),title:"How Micah accomplishes and sets financial goals",content:"How i achieved all my financial goals that i set out")
Post.create(user:User.first,blog:Blog.find(2),title:"How Micah accomplishes and sets financial goals",content:"How i made my first million dollars")
Post.create(user:User.first,blog:Blog.find(2),title:"How Micah accomplishes and sets financial goals",content:"How i made my first billion dollars")

# Have the second user create 5 posts for the last Blog.
Post.create(user:User.find(2),blog:Blog.last,title:"Avenger's Assemble",content:"1st Marvel Team-up Movie")
Post.create(user:User.find(2),blog:Blog.last,title:"Avenger's Age of Ultron",content:"2nd Marvel Team-up Movie")
Post.create(user:User.find(2),blog:Blog.last,title:"Avenger's Civil War",content:"3rd Marvel Team-up Movie")
Post.create(user:User.find(2),blog:Blog.last,title:"Avenger's Infinity War",content:"4th Marvel Team-up Movie")
Post.create(user:User.find(2),blog:Blog.last,title:"Avenger's Infinity Wars 2",content:"5th Marvel Team-up Movie")

# Have the 3rd user create several posts for different blogs.
Post.create(user:User.find(3),blog:Blog.find(3),title:"My Favorite Color",content:"My favorite color is red")
Post.create(user:User.find(3),blog:Blog.find(3),title:"My Favorite Color",content:"Changed my mind its blue")
Post.create(user:User.find(3),blog:Blog.find(4),title:"My Favorite Destination",content:"I love Germany")

# Have the 3rd user create 2 messages for the first post created and 3 messages for the second post created
Message.create(post:Post.find(1), user:User.find(3), author:"Michael Jackson", message:"Message1")
Message.create(post:Post.find(1), user:User.find(3), author:"Michael Jackson", message:"Message2")

# Have the 4th user create 3 messages for the last post you created.
Message.create(post:Post.last, user:User.find(4), author:"Michael Johnson", message:"Message1")
Message.create(post:Post.last, user:User.find(4), author:"Michael Johnson", message:"Message2")
Message.create(post:Post.last, user:User.find(4), author:"Michael Johnson", message:"Message3")

# Change the owner of the 2nd post to the last user.
Owner.find(2).update(user:User.last)
#or
currentPost = Post.last
currentPost.user = User.last
currentPost.save

# Change the 2nd post's content to be something else.
Post.find(2).update(content:"I'm rich")
#or
currentPost = Post.second
currentPost.title = "Harry"
currentPost.save

# Retrieve all blogs owned by the 3rd user (make this work by simply doing: User.find(3).blogs).
User.find(3).blogs_owned
#or
User.find(3).owning_blogs

# Retrieve all posts that were created by the 3rd user
User.find(3).posts

# Retrieve all messages left by the 3rd user
User.find(3).messages

# Retrieve all posts associated with the blog id 5 as well as who left these posts.
#Part 1
Blog5 = Blog.find(5)
Blog5.posts
# Part 2
Currentblogposts = Blog.find(5).posts
Currentblogposts.each do |posts|
    puts posts.user.first_name
end
# Part 2 optimal solution
Currentblogposts = Blog.includes(:users).find(5).posts.references(:users)
Currentblogposts.each do |posts|
    puts posts.user.first_name
end

# Retrieve all messages associated with the blog id 5 along with all the user information of those who left the messages
#To retreve all messages
messages = Message.where(post: Post.where(blog: Blog.find(5)))
#Retrieve information from users
messages.each do |message|
    puts message.user.first_name
    puts message.user.last_name
end

# Grab all user information of those that own the first blog (make this work by allowing Blog.first.owners to work)
#To retreve all owners from first blog
Blog1= Blog.first
owners = Blog1.owners
#Retrieve each user's information
owners.each do |i|
    puts i.user.first_name
    puts i.user.last_name
    puts i.user.email
end

# Change it so that the first blog is no longer owned by the first user.
currentOwner = Owner.find(User.find(1) && Blog.find(1))
currentOwner.destroy