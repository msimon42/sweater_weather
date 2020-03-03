class User < ApplicationRecord
  has_secure_password

  validates_uniqueness_of :email
  validates_presence_of :email

  def generate_api_key
    key = ApikeyGenerator.generate
    self.update(api_key: key)
  end
end
