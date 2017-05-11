class Member < ActiveRecord::Base
  include EmailAddressChecker

  validates :number, presence: true,
    numericality: { 
      only_integer:true,
      greater_than: 0,
      less_than: 100,
      allow_blank: true
    },
    uniqueness: true

  validates :name, presence: true,
    format: {with: /¥A[A-Za-z]¥w*¥z/, allow_blank:true},
    length: {minimum: 2, maximum: 20, allow_blank: true},
    uniqueness: {case_sensitive: false}

  validates :full_name, length: {maximum: 20}

  validate :check_email

  validates :password, presence: {on: :create},
    confirmation: {allow_blank: true}

  # 　bcrypt old ver ?  
  attr_accessor :password, :password_confirmation

  def password=(val)
    if val.present?
      self.hashed_password = BCrypt::Password.create(val)
    end
    @password = val
  end
  # new bcrypt ver?
  # has_secure_password

  private
  def check_email
    if email.present?
      errors.add(:email, :invalid) unless well_formed_as_email_address(email)
    end
  end

  class << self
    def search(query)
      rel = order("number")
      if query.present?
        rel = rel.where("name LIKE ? OR full_name LIKE ?", "%#{query}%", "%#{query}%")
      end
      rel
    end
  end
end
