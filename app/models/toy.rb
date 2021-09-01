class Toy < ActiveRecord::Base
  has_many :purchases
  has_many :kids, through: :purchases

  def self.most_expensive
    Toy.all.order(:price).last
    # the method written below also works....
    # most_expensive_toy = maximum(:price)
    # find_by(price: most_expensive_toy)
  end

  def self.most_popular
    # purchases.map do |purchase|
    #   purchase.count.maximum
   all.max_by {|toy| toy.purchases.count}
    end

    # the method below also works just like the map method above.... just need to be sure to set the variable to the correct class.
    #in this case, it shouldve been set to Toy. NOT Purchase. 
  
  end

  def kids_names
    kids.pluck(:name)
  end
end
