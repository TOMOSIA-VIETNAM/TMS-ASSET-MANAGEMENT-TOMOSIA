class User < ApplicationRecord
  extend Enumerize

  has_many :requests 
  has_many :delivers
  has_many :projects
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :name, :phone_number, presence: true
  validates :email, format: { with:  /\A[a-z0-9\+\-_\.]+@[a-z\d\-.]+\.[a-z]+\z/i }, uniqueness: true,  presence: true

  enumerize :role, :in => {
    user: 0,
    manage: 1, 
    admin: 2
  }

end
