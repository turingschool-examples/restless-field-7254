class Airline < ApplicationRecord
  has_many :flights


  def only_adults
    passengers.where('passengers.age >= 18')
  end
end