class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_one_attached :avatar
  extend Devise::Models
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
         after_create :welcome_send

    
    has_many :events, class_name: "Event"
    has_many :attendances
    has_many :events, through: :attendencies

    def welcome_send
        UserMailer.welcome_email(self).deliver_now
      end

end
