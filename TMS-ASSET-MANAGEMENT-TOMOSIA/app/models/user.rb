class User < ApplicationRecord
  has_many :projects
  has_many :requests
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: {
    user: 0,
    manage: 1, 
    admin: 2,
  }
end
