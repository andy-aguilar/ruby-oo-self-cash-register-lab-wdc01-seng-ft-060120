require 'pry'
class CashRegister
    attr_accessor :total, :discount, :title, :price, :items, :transactions
    def initialize(discount = 0)
        @discount = discount
        @total = 0
        @items = []
        @transactions = []
    end

    def add_item (title, price, quantity=1)
        self.total += price*quantity
        quantity.times do
        @items << title
        end
        @transactions << price*quantity
    end

    def apply_discount
        self.total -= self.total*(discount*0.01)
        if discount != 0
            return "After the discount, the total comes to $#{self.total.to_i}."
        else
            return "There is no discount to apply."
        end
    end

    def items 
        @items
    end

    def void_last_transaction
        self.total -= @transactions.last()
        @transactions.pop
    end
end