class ApikeyGenerator
  def self.generate
    letters = ('a'..'z').to_a
    numbers = (0..9).to_a
    (letters + numbers).shuffle.join
  end
end
