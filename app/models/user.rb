class User < ApplicationRecord
  validates_uniqueness_of :email
  has_secure_password

  def generate_api_key
    key = ApikeyGenerator.generate
    self.update(api_key: key)
  end
end
