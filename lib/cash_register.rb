class CashRegister

  attr_accessor :total, :discount



  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @shopping_cart_items = []
    @item_totals = []
  end

  def add_item(item,price,quantity = 1)
    @total += price * quantity
    x = 0
    while x < quantity
      @shopping_cart_items << item
      x+=1
    end
    @item_totals << price*quantity

  end

  def apply_discount
    if @discount > 0
      @total = @total * (100 - @discount)/100
      return "After the discount, the total comes to $#{@total}."
    else
      return "There is no discount to apply."
    end
  end

  def items
    @shopping_cart_items
  end

  def void_last_transaction
    @shopping_cart_items = @shopping_cart_items.shift
    @total = @total - @item_totals[@item_totals.length - 1]

  end

end
