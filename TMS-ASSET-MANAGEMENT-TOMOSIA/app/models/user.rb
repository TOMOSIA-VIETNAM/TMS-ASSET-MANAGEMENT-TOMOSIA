class User < ApplicationRecord
  has_many :projects
  has_many :requests
end
