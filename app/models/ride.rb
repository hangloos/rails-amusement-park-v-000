class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user

  

  def enough_tickets?
    if self.user.tickets < attraction.tickets
      "Sorry. You do not have enough tickets the #{attraction.name}."
    end
  end

  def tall_enough?
    if self.user.height < self.attraction.min_height
      "Sorry. You are not tall enough to ride the #{attraction.name}."
    end
  end

  def take_ride
    if enough_tickets? && tall_enough?
      "Sorry. You do not have enough tickets the #{attraction.name}. You are not tall enough to ride the Roller Coaster."
    elsif enough_tickets?
      enough_tickets?
    elsif tall_enough?
      tall_enough?
    else
      user = self.user

      new_happiness = user.happiness + self.attraction.happiness_rating
      new_nausea = user.nausea + self.attraction.nausea_rating
      new_tickets =  user.tickets - self.attraction.tickets

      user.update!(happiness: new_happiness)
      user.update!(nausea: new_nausea)
      user.update!(tickets: new_tickets)
      user.save
      "Thanks for riding the #{self.attraction.name}!"
    end
  end
end
