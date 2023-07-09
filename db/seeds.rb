puts "Seeding..."

Savings.destroy_all

x = 0
cards = ['coop', 'equity', 'barclays']
3.times do
    Card.create(name: cards[x], balance: (3000*(x+1)), user_id: 1)
    x += 1
end

# x = 0
# sims = ['telcom', 'airtel', 'saf']
# 3.times do
#     Sim.create(name: sims[x], balance: (3000*(x+1)), user_id: 1)
#     x += 1
# end

x = 0
cat = ['food', 'clothes', 'electronics', 'household', 'other', 'transport', 'health', 'education', 'entertainment', 'recreation']
cat.each{|y| 
    SimTransaction.create!(category: y, amount: (100*(x+1)), sim_id: 2)
    x += 1
}


x = 0
categ = ['food', 'clothes', 'electronics', 'household', 'other', 'transport', 'health', 'education', 'entertainment', 'recreation']
categ.each{|y| 
    CardTransaction.create!(category: y, amount: (100*(x+1)), card_id: 2)
    x += 1
}


Saving.create!(name: "Shoes", goal: 5000, duration: 12, saved_amount: 0, user_id: 1)


SaveSim.create!(goalName: "Shoes", amount: 500, saving_id: 3, sim_id: 1)
SaveCard.create!(goalName: "Shoes", amount: 500, saving_id: 4, card_id: 1)

puts "...Done!"