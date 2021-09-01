class Kid < ActiveRecord::Base
  has_many :purchases
  has_many :toys, through: :purchases

  def make_purchase(toy, quantity)
    Purchase.create(quantity: quantity, kid: self, toy: toy)
    # ask seabags/gill if you need to use the key of kid_id or if its fine to just use kid... same thing for toy_id
    # reference the seed data for creating a purchase.
    #when writing out the method, you can request the kid_id: / toy_id:.... but it doesnt matter.
    # requesting just kid: self, toy:toy, returns the entire object. 
  end

  def all_purchase_info
    purchases.map(&:info)
    # need to map over the purchses. Then as an argument you pass the previously written method of :info from "purchase"
    # and since we're not changing any info in the table, we don't have to elaborate the map method. 
    # to test... set Andy = Kid.first
    # then i did Andy.all_purchase_info => this gave me back an array of andy's purchases.
  end

  def throw_out(toy)
    purchases.decrement_counter(:quantity, purchases.find_by(toy: toy, kid: self).id)
  # use decrement_counter
  end

  def throw_all_out(toy)
    purchases.find_by(toy: toy).destroy
  # have to use purchases, because that's where all the toys lie.
  # then you find_by a specific toy: toy, then call .destroy because we are deleting from database
  # to test you assign a variable to an instance of a Kid... in this case we did Andy = Kid.first
  # then assign the toy you want to delete to a variable... so we did, Woody = Toy.first
  # then called Andy.throw_all_out(Woody)
  end

  
end