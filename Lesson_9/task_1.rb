def machine_control(code, price)
  items = [
    {
      name: "Snickers",
      code: "A01",
      quantity: 10,
      price: 250
    }, {
      name: "Pepsi",
      code: "A02",
      quantity: 5,
      price: 350
    }, {
      name: "Orange Juice",
      code: "A03",
      quantity: 10,
      price: 400
    }, {
      name: "Bon Aqua",
      code: "A04",
      quantity: 7,
      price: 120
    }, {
      name: "Bounty",
      code: "A05",
      quantity: 10,
      price: 270
    }, {
      name: "Kit-Kat",
      code: "A06",
      quantity: 0,
      price: 175
    }
  ]

  product = items.detect do |product_data|
    product_data.has_value?(code)
  end

  return puts "#{product[:name]} ended" if product[:quantity] == 0

  if price == product[:price]
    puts product[:name]
    product[:quantity] - 1
  elsif price > product[:price]
    puts "#{product[:name]} change '#{price - product[:price]}'"
    product[:quantity] - 1
  elsif price < product[:price]
    puts "Add more '#{product[:price] - price}'"
    product[:quantity] - 1
  end
end

machine_control("A02", 240)
