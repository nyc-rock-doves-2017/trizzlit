class User < ApplicationRecord
  has_many :decks, foreign_key: :creator_id
  has_many :rounds, foreign_key: :player_id

  validates :username, presence:true
  validates :email, presence:true
  validates :password_hash, presence:true

  def self.authenticate(login_credentials)
    user = User.find_by(username: login_credentials[:username])
    if user
      user.password == login_credentials[:password]
    else
      false
    end
  end

  def password
    @password ||= BCrypt::Password.new(password_hash)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.password_hash = @password
  end

end
