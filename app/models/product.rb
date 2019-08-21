class Product < ApplicationRecord
  def available?
    inventory.positive?
  end

  def reduce_inventory
    new_inventory = inventory - 1
    update(inventory: new_inventory)
  end
end
