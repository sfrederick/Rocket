class User < ActiveRecord::Base
  include Clearance::App::Models::User

  validates_presence_of :email
  validates_uniqueness_of :email

  attr_accessor :password_confirmation
  validates_confirmation_of :password

  validate :password_non_blank

  def self.authenticate(email, password)
    user = self.find_by_email(email)
    if user
      if user.password != password
        user = nil
      end
    end
    user
  end

  def after_destroy
    if User.count.zero?
      raise "Can't delete the last user"
    end
  end

private
  def password_non_blank
    errors.add(:password, "Missing password") if password.blank?
  end

end
