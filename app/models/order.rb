class Order < ApplicationRecord
  def products
    product_ids = OrderProduct.where(order_id: id).pluck(:product_id)
    Product.find(product_ids)
  end

  def shippable?
    !(OrderProduct.where(order_id: id).blank? || status == 'shipped')
  end

  def ship
    if shippable?
      if update(status: 'shipped')
        true
      else
        false
      end
    else
      false
    end
  end
end
