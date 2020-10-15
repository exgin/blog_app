# This is where we can establish relationships in ROR
# A Post can have many comments N:M
# 'rails g migration AddPostIdToComments' to offically create a migration file. Then run 'rails db:migrate' to apply changes
class Post < ApplicationRecord
    has_many :comments
end
