class User < ApplicationRecord
  extend Enumerize

  has_many :projects
  has_many :requests
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enumerize :role, :in => {
    user: 0,
    manage: 1, 
    admin: 2
  }
end
