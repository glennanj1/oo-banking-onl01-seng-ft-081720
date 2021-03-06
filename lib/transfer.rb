class Transfer
  # your code here

  attr_accessor :sender, :receiver, :amount, :status
  

  def initialize(sender, receiver, amount)
    @receiver = receiver
    @amount = amount
    @sender = sender
    @status = "pending"
  end

  def valid?
    sender.valid?
    receiver.valid?
  end

  def execute_transaction
    
    
      
    if valid? && self.status == "pending" && sender.balance > @amount
      sender.balance -= @amount
      receiver.balance += @amount
      self.status = "complete"
    else 
      @status = "rejected"
      "Transaction rejected. Please check your account balance."

    end
  end

  def reverse_transfer
    if self.status == "complete"
      receiver.balance -= @amount
      sender.balance += @amount
      self.status = "reversed"

    end

  end



end


