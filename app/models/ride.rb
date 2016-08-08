class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user

  
  def enough_tickets?
    user.tickets >= attraction.tickets
  end

  def tall_enough?
    user.height >= attraction.min_height
  end

  def take_ride
    if !enough_tickets? && !tall_enough?
      return "Sorry. You do not have enough tickets the #{attraction.name}. You are not tall enough to ride the Roller Coaster."
    elsif !enough_tickets?
      return "Sorry. You do not have enough tickets the #{attraction.name}."
    elsif !tall_enough?
      return "Sorry. You are not tall enough to ride the #{attraction.name}."
    else
      user = self.user

      new_happiness = user.happiness + attraction.happiness_rating
      new_nausea = user.nausea + attraction.nausea_rating
      new_tickets =  user.tickets - attraction.tickets

      user.update!(happiness: new_happiness)
      user.update!(nausea: new_nausea)
      user.update!(tickets: new_tickets)
      user.save
      return "Thanks for riding the #{attraction.name}!"
    end
  end
end
