class User < ApplicationRecord
  has_secure_password

  validates_uniqueness_of :email
  validates_presence_of :email

  def self.valid_api_key?(key)
    where(api_key: key).any?
  end

  def generate_api_key
    key = ApikeyGenerator.generate
    self.update(api_key: key)
  end
end
