class User < ActiveRecord::Base
  has_many :reviews
  has_many :reviewed_businesses, through: :reviews, source: :business

  validates_presence_of :name, :email, :password_hash
  validates_format_of :email, :with => /.+@.+\..+/i
  validates :email, :uniqueness=>true

  def password
    @password ||= BCrypt::Password.new(password_hash)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.password_hash = @password
  end

  def authenticate(email, sign_in_password)
    if self.email == email && password == sign_in_password
      return true
    end
  end
end
