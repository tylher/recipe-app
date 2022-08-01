class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    has_many :foods, class_name: "food", foreign_key: "user_id"
    has_many :foods, class_name: "food", foreign_key: "user_id"
end