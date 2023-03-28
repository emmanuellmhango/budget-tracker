class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_many :purchases
  has_many :categories

  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true
  validates :password, presence: true
end
