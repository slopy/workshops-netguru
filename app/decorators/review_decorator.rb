class ReviewDecorator < Draper::Decorator
  delegate_all

  def author  
  	self.user.firstname + " " + self.user.lastname
  end

  def created_at
  	object.created_at.strftime("%d-%m-%y")
  end
end
