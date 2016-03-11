class User < ActiveRecord::Base
  validates :name, length: { minimum: 1, maximum: 100 }, presence: true
  validates :password, presence: true, length: { minimum: 6 }, if: "password_digest.nil?"
  validates :password, length: { minimum: 6 }, allow_blank: true
  validates :email,
            presence: true,
            uniqueness: { case_sensitive: false },
            length: { minimum: 3, maximum: 254 }

  before_save :lower_case_email
  before_save :capitalize_name

  has_secure_password

  def lower_case_email
    self.email = email.downcase
  end

  def capitalize_name
    if name
      current_name = name.split(" ")
      current_name.map! { |name| name.capitalize }
      updated_name = current_name.join(" ")
      self.name = updated_name
    end
  end
end
