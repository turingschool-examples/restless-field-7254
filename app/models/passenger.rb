class Passenger < ApplicationRecord
  has_many :flight_passengers
  has_many :flights, through: :flight_passengers 
  has_many :airlines, through: :flights 

  def adult? 
    age >= 18 
  end

  def self.adults_only
    where('age >= ?', 18)
  end

  def self.unique_passengers
   select(:name).distinct.pluck(:name)
  # select(:name).distinct
  # select(:name, :age).distinct
  # select(:name, :age).distinct.pluck(:name, :age)
  # select(:name, :age).group(:name)
  # select(:name, :age).distinct
  # order(:name, :age).distinct
  # order(:name).distinct
  # order(:name).distinct(:name)
  # distinct(:name)
  # group(:name)
  # group(:name).order(:name)
  # group(:name).distinct(:name)
  # group(:name).order(:name).distinct
  # group(:name).order(:name).distinct(:name)
  end
end
