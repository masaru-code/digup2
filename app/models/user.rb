class User < ApplicationRecord
  has_many :tasks
  has_many :comments
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,:trackable,
         :lockable, :timeoutable
  
  validates :name, uniqueness: true

  def email_required?
    false
  end
          
  def email_changed?
    false
  end      
end
