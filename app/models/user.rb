class User < ActiveRecord::Base
  before_save { self.email = email.downcase }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  has_many :notes

  validates :email, presence: true, length: { maximum: 105 },
            uniqueness: { case_sensitive: false },
            format: { with: VALID_EMAIL_REGEX }
  validates :first_name, length: { maximum: 25 }
  validates :last_name, length: { maximum: 25 }

  has_secure_password

  def name
    (first_name || last_name) ? [first_name, last_name].join(' ').titleize : email
  end
end
