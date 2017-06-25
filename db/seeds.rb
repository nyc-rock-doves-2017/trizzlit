User.delete_all
Round.delete_all
Card.delete_all
Guess.delete_all
Deck.delete_all

# Create User data
10.times do
  User.create({
    username: Faker::Internet.user_name,
    email: Faker::Internet.safe_email,
    password: 'password'
    })
end


# Create decks
10.times do
  Deck.create({
    category: Faker::Team.sport,
    creator_id: rand(1..10)
    })
end


# Create 20 cards for Deck 1 for testing
2.times do
  Card.create({
    deck_id: 1,
    question: Faker::Lorem.sentence,
    answer: Faker::Superhero.power
  })
end

# Create random number of cards for the other decks
30.times do
  Card.create({
    deck_id: rand(2..10),
    question: Faker::Lorem.sentence,
    answer: Faker::Superhero.power
  })
end

# Create 1 round
Round.create({
  player_id: 1,
  deck_id: 1
})


# Create guesses for all 20 cards in Deck 1
20.times do |x|
  Guess.create({
    card_id: x+1,
    round_id: 1,
    result: "No result"
  })
end
