
def machine_control(code, price)
  items = [{name: "Snickers", code: "A01", quantity: 10, price: 250},

           {name: "Pepsi", code: "A02", quantity: 5, price: 350},

           {name: "Orange Juice", code: "A03", quantity: 10, price: 400},

           {name: "Bon Aqua", code: "A04", quantity: 7, price: 120},

           {name: "Bounty", code: "A05", quantity: 10, price: 270},

           {name: "Kit-Kat", code: "A06", quantity: 0, price: 175}]

  items.each do |product_data|
    if product_data.has_value?(code)
      case
      when product_data[:quantity] == 0
        puts "#{product_data[:name]} ended"
      when price == product_data[:price]
        puts product_data[:name]
        product_data[:quantity] - 1
      when price > product_data[:price]
        puts "#{product_data[:name]} change '#{price - product_data[:price]}'"
        product_data[:quantity] - 1
      when price < product_data[:price]
        puts "Add more '#{product_data[:price] - price}'"
        product_data[:quantity] - 1
      end
    end
  end
end

machine_control("A02", 250)
