class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

        def is_admin? 
          has_role? :admin
        end
         
  
  after_create :send_welcome_email

  private

  def send_welcome_email
    UserRagistationMailer.welcome_email(self).deliver_now
  end

end
