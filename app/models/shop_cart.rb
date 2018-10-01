class ShopCart

  delegate :totalPrice, to: :order

  def initialize(token:)
    @token = token
  end

  def order
    @order ||= Order.find_or_create_by(token: @token) do |order|
      order.totalPrice = 0
    end
  end

  def add_item(product_id:, quantity: 1)
    product = Product.find(product_id)

    order_item = order.items.find_or_initialize_by(
      product_id: product_id
    )
    order_item.save

    if all_blueray?
      order.items.each do |item|
        if Product.find(item.product_id).isBlueray
          item.price = Product.find(item.product_id).price * 0.85
          item.save
        end
      end
    elsif all_dvd?
      order.items.each do |item|
        if !Product.find(item.product_id).isBlueray
          item.price = Product.find(item.product_id).price * 0.90
          item.save
        end
      end
    else
      order_item.price = product.price
    end
    order_item.quantity = quantity

    ActiveRecord::Base.transaction do
      order_item.save
      update_totalPrice!
    end
  end

  def remove_item(id:)
    ActiveRecord::Base.transaction do
      order.items.destroy(id)
      if !all_blueray?
        order.items.each do |item|
          if Product.find(item.product_id).isBlueray
            item.price = Product.find(item.product_id).price
            item.save
          end
        end
      end
      if !all_dvd?
        order.items.each do |item|
          if !Product.find(item.product_id).isBlueray
            item.price = Product.find(item.product_id).price
            item.save
          end
        end
      end
      update_totalPrice!
    end
  end

  def all_blueray?
    order.items.exists?(product_id: 4) && order.items.exists?(product_id: 5) && order.items.exists?(product_id: 6)
  end

  def all_dvd?
    order.items.exists?(product_id: 1) && order.items.exists?(product_id: 2) && order.items.exists?(product_id: 3)
  end

  def items_count
    order.items.sum(:quantity)
  end

  private

  def update_totalPrice!
    order.totalPrice = order.items.sum('quantity * price')
    order.save
  end

  # def all_blueray?
  #    @blueray = current_cart.order.items.find(1)
  #    puts "HELLO"
  #    puts @blueray
  # end
  #
  # def all_dvd?
  #   if current_cart.order.exists?(product_id: 1) && current_cart.order.exists?(product_id: 2) && current_cart.order.exists?(product_id: 3)
  #     @dvd = true
  #   else
  #     @dvd = false
  #   end
  # end

end
