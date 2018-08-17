# Sets up your testing environment. It tells rails to import the "/spec/rails_helper.rb" file when running your rspec test.
require 'rails_helper'

RSpec.describe User do
    # This is our control
    context "With valid attributes" do
        it "should save" do
            user = User.new(
                first_name: 'shane',
                last_name: 'chang',
                email: 'schang@codingdojo.com'
            )
            expect(user).to be_valid #be_valid is an RSpec method that checks whether our new User instance passes all of the validations provided. If it passes these validations, be_valid returns true.
        end
    end

    context "With invalid attributes" do
        it "should not save if first_name field is blank" do
            user = User.new(
                first_name: '',
                last_name: 'chang',
                email: 'schang@codingdojo.com'
            )
            expect(user).to be_invalid
        end
    end

    context "With valid attributes" do
        it "should save" do
            user = User.new(
                first_name: 'shane',
                last_name: 'chang',
                email: 'schang@codingdojo.com'
            )
            expect(user).to be_valid
        end
    end

    context "With invalid attributes" do
        it "should not save if last_name field is blank" do
            user = User.new(
                first_name: 'shane',
                last_name: '',
                email: 'schang@codingdojo.com'
            )
            expect(user).to be_invalid
        end
    end

    context "With valid attributes" do
        it "should save" do
            user = User.new(
                first_name: 'shane',
                last_name: 'chang',
                email: 'schang@codingdojo.com'
            )
            expect(user).to be_valid
        end
    end

    context "With invalid attributes" do
        it "should not save if email already exists" do
            user = User.new(
                first_name: 'shane',
                last_name: 'chang',
                email: 'schang@codingdojo.com'
            )
            expect(user).to be_invalid
        end
    end

    context "With valid attributes" do
        it "should save" do
            user = User.new(
                first_name: 'shane',
                last_name: 'chang',
                email: 'schang@codingdojo.com'
            )
            expect(user).to be_valid
        end
    end

    context "With invalid attributes" do
        it "should not save if invalid email format" do
            user = User.new(
                first_name: 'shane',
                last_name: 'chang',
                email: 'schang@codingdojo'
            )
            expect(user).to be_invalid
        end
    end
end

# RSpec.describe ... do is a grouping that tells rails thats you are going to be describing a set of tests that you want to run, which will be included within the RSpec.describe block

# User tells us that the set of tests in the RSpec.describe ... do block relate to testing the User class. This is a developer designated description though and it could say pikachu if you wanted (even if you weren't testing a Pikachu class).

# type: :model tells rails that the tests are model specs (as opposed to say a feature or controller spec). This is important because depending on the type of spec test, sometimes different methods are available.

# pending "add some examples ..." is the test itself. The part in quotations is a developer designated description of the test, again it could say "pikachu" if you wanted. pending tells rails that the test is currently marked as pending, meaning you're not done writing the test yet. It should neither be considered a passing or a failing test, and tells rails that it can skip over that test when running your spec tests.
