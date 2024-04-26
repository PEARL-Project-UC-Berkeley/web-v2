class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :appointments

  scope :admin, -> { where(admin: true) }
         
  def is_admin?
    return admin == true
  end

  def current_appointment
    appointments.where("start_time <= ? AND end_time >= ?", DateTime.now, DateTime.now).first
  end
end
