== README

[ First Test ]: user_spec

===============================================
BEFORE satisfying the <model> test requirements
===============================================

| => rspec spec/

Failures:

  1) User with valid attributes email as lowercase
     Failure/Error: expect(create(:user, email: 'EMAIL@GMAIL.COM').email).to eq('email@gmail.com')

       expected: "email@gmail.com"
            got: "EMAIL@GMAIL.COM"

       (compared using ==)
     # ./spec/models/user_spec.rb:16:in `block (3 levels) in <top (required)>'

  2) User with invalid attributes should not save if name is blank
     Failure/Error: expect(build(:user, name: '')).to be_invalid
       expected `#<User id: nil, name: "", email: "miguel.obiang@codingdojo.com", password_digest: "$2a$04$yexh0kLKXUvdjRINtz1IB.A5D38xAWdLtLcWkgkZIFx...", created_at: nil, updated_at: nil>.invalid?` to return true, got false
     # ./spec/models/user_spec.rb:27:in `block (3 levels) in <top (required)>'

  3) User with invalid attributes should not save if email is blank
     Failure/Error: expect(build(:user, email: '')).to be_invalid
       expected `#<User id: nil, name: "Miguel Obiang", email: "", password_digest: "$2a$04$Xt5pCknmYcGNOLf3mvU4xeawXtOUVUITJoE/N/LC3l1...", created_at: nil, updated_at: nil>.invalid?` to return true, got false
     # ./spec/models/user_spec.rb:32:in `block (3 levels) in <top (required)>'

  4) User with invalid attributes should not save if email format is wrong
     Failure/Error: expect(build(:user, email: email)).to be_invalid
       expected `#<User id: nil, name: "Miguel Obiang", email: "@user", password_digest: "$2a$04$4NwSNvXEbmXKiDEbzp2/oO2zUq8ZQpZ.TGfL6PfKXpQ...", created_at: nil, updated_at: nil>.invalid?` to return true, got false
     # ./spec/models/user_spec.rb:39:in `block (4 levels) in <top (required)>'
     # ./spec/models/user_spec.rb:38:in `each'
     # ./spec/models/user_spec.rb:38:in `block (3 levels) in <top (required)>'

  5) User with invalid attributes should not save if email is not unique
     Failure/Error: expect(build(:user)).to be_invalid
       expected `#<User id: nil, name: "Miguel Obiang", email: "miguel.obiang@codingdojo.com", password_digest: "$2a$04$lHou/wB7b3PLdaBWsr4FdOBey51acttuM4QWLErMx3....", created_at: nil, updated_at: nil>.invalid?` to return true, got false
     # ./spec/models/user_spec.rb:46:in `block (3 levels) in <top (required)>'

Finished in 0.28542 seconds (files took 8.93 seconds to load)
9 examples, 5 failures

Failed examples:

rspec ./spec/models/user_spec.rb:15 # User with valid attributes email as lowercase
rspec ./spec/models/user_spec.rb:26 # User with invalid attributes should not save if name is blank
rspec ./spec/models/user_spec.rb:31 # User with invalid attributes should not save if email is blank
rspec ./spec/models/user_spec.rb:36 # User with invalid attributes should not save if email format is wrong
rspec ./spec/models/user_spec.rb:44 # User with invalid attributes should not save if email is not unique


==============================================
AFTER satisfying the <model> test requirements
==============================================
| => rspec spec/
.........

Finished in 0.21777 seconds (files took 9.19 seconds to load)
9 examples, 0 failures
