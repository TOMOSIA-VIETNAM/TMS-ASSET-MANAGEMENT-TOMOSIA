class User < ApplicationRecord
  has_many :projects
  has_many :requests

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
