class CashRegister
    attr_accessor :discount, :items, :total, :last_transaction
  
    def initialize(discount = 0)
      @total = 0
      @discount = discount
      @items = []
      @last_transaction = 0
    end
  
    def add_item(title, price, quantity = 1)
      transaction_amount = price * quantity
      self.total += transaction_amount
      quantity.times { @items << title }
      self.last_transaction = transaction_amount
    end
  
    def apply_discount
      if discount > 0
        self.total -= (self.total * discount / 100).to_i
        "After the discount, the total comes to $#{total}."
      else
        "There is no discount to apply."
      end
    end
  
    def void_last_transaction
      self.total -= last_transaction
      items.pop
      self.last_transaction = items.empty? ? 0 : items[-1]
    end
  end
  