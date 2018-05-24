class Team < ApplicationRecord
  has_many :team_users	
  has_many :projects
  has_many :users, through: :team_users
  has_many :tasks, through: :projects
end
