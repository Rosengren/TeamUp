require 'date'
class User < ActiveRecord::Base
  has_many :user_proficiencies
  has_many :user_teams
  has_and_belongs_to_many :games
  has_many :teams, through: :user_teams
  has_many :proficiencies, through: :user_proficiencies
  validates :username, presence: true, uniqueness: true
  validates :password, presence: true, length: {minimum: 7}
  validates :email, presence: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }, uniqueness: true
  has_secure_password

  validates_presence_of :slug
  attr_accessor :remember_token

  def to_param
    slug
  end

  def set_ip(address)
    update_attribute(:last_ip_address, address)
  end

  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  def remember
    self.remember_token = User.new_remember_token
    update_attribute(:remember_digest, BCrypt::Password.create(remember_token))
  end

  def forget
    update_attribute(:remember_digest, nil)
  end

  def confirmation_action
    if !self.confirmation_token
      safe_token = SecureRandom.urlsafe_base64
      update_attribute(:confirmation_token, safe_token)
      update_attribute(:confirmation_expiry, DateTime.now + 3)
      safe_token
    else
      update_attribute(:confirmation_expiry, DateTime.now + 3)
      self.confirmation_token
    end
  end

  def activate_account
    update_attribute(:confirmation_expiry, nil)
  end

end
