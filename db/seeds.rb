# Model
# Migration
    # Test it
# Route / Controller
# Methods
    # Test it


puts "🌱 Seeding spices..."

# Seed your database here
u1 = User.create(username: 'Ash', password: 'pikachu')

t1 = Tweet.create(
    message: 'I choose you pikachu',
    user_id: u1.id
)


t2 = Tweet.create(
    message: "I'm the best trainer of all time..",
    user_id: u1.id
)

u2 = User.create(username: 'Brock', password: 'nursejoy')

t3 = Tweet.create(
    message: 'I like cooking',
    user_id: u2.id
)

puts "✅ Done seeding!"
