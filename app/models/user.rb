class User < ApplicationRecord
  has_many :blogs, dependent: :destroy
  has_many :comments, dependent: :destroy
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable


  after_create :assign_default_role

  def assign_default_role
    self.add_role(:user) if self.roles.blank?
  end

  attr_writer :login

  def login
    @login || self.name ||self.email
  end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if (login = conditions.delete(:login))
      where(conditions.to_h).where(["lower(name) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    elsif conditions.has_key?(:name) || conditions.has_key?(:email)
      where(conditions.to_h).first
    end
  end
end
