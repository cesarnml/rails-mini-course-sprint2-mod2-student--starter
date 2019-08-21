class Product < ApplicationRecord
  def available?
    puts inventory
    inventory > 0
  end

  def reduce_inventory
    new_inventory = inventory - 1
    update(inventory: new_inventory)
  end
end
