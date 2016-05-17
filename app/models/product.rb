class Product < ActiveRecord::Base

TAX_RATE = 0.09

def sale_message
  if price < 11
    "Discount item"
  else
    "On sale"
  end
end

def tax
  price * TAX_RATE
end

def total
  price + (price * TAX_RATE)
end

end