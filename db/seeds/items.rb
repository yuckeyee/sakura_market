i = 1
30.times do
  Item.create(
     name: Faker::Food.ingredient,
     description: Faker::Coffee.notes,
     price: rand(100..400),
     visibility: true,
     order: i
   )
   i += 1
end