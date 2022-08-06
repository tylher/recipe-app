class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :foods
  has_many :recipes


  Roles = [:default,:admin]

  def is?(requested_role)
    self.role == requested_role.to_s
  end
  
end
