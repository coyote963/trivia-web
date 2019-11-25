class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :hosted_rooms, :class_name => 'Room', :foreign_key => 'host_id'
  has_many :joined_rooms, :class_name => 'Room', :foreign_key => 'guest_id'
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
