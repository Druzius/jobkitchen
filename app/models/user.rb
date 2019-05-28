class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable

  validates :terms_of_service, acceptance: true

  has_many :jobs

  after_create :send_admin_mail
  def send_admin_mail
    UserMailer.welcome(self).deliver_now
  end
end
