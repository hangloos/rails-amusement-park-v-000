Notes:

--no-test-framework

1. look at model tests to set your database

Attraction model - name:string, tickets:integer, nausea_rating:integer, happiness_rating:integer min_height:integer

has_many :rides
has_many users, through rides



User Model:

not valid without a password
admin defaults to false
has_many :rides
has_many attractions, through rides


def mood
returns sad when user is more nauseous than happy
happy the other way
end

Ride

valid with user_id and attratcion_id
belongs to attraction
belongs to user

def take_ride
if users doesnt have enought tickets or not
updates the number
updates nausea and happy number based on that rides number
end

2. can use generators and scallfolds

3. has_secure_password ( user model) , bcrypt gem , password_digest - user model 