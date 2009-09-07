class User < ActiveRecord::Base

  include Clearance::App::Models::User

  attr_accessible :atoken, :asecret

  validates_presence_of :email
  validates_uniqueness_of :email
  validate :password_non_blank

  def authorized?
    tw_auth && (!atoken.blank? && !asecret.blank?)
  end

  def tw_oauth
    if (tw_auth)
      @tw_oauth ||= Twitter::OAuth.new(ConsumerConfig['tw_token'], ConsumerConfig['tw_secret'])
    end
  end

  def tw_client
    if (tw_auth)
      @tw_client ||= begin
        tw_oauth.authorize_from_access(atoken, asecret)
        Twitter::Base.new(tw_oauth)
      end
    end
  end


  #validates_presence_of :email
  #validates_uniqueness_of :email

  #attr_accessor :password_confirmation
  #validates_confirmation_of :password

  #validate :password_non_blank

  #def self.authenticate(email, password)
  #  user = self.find_by_email(email)
  #  if user && user.password=(password)
  #    user
  #  else
  #    user = nil
  #  end
  #end

  #def after_destroy
  #  if User.count.zero?
  #    raise "Can't delete the last user"
  #  end
  #end

private
  def password_non_blank
    errors.add(:password, "Missing password") if encrypted_password.blank?
  end

end
