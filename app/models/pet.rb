class Pet < ApplicationRecord
  validates :name,presence: true
  SPECIES = ["Cat", "Dog", "Cameleon", "Koala", "Kangoroo", "Crabe"]
  validates :species, presence: true, inclusion: { in: SPECIES } 

  after_validation :today_is_the_day

  private

  def today_is_the_day
    return if self.found_on.present?
    self.found_on = Time.zone.now
  end

  # def self.species
  #   SPECIES
  # end

end
