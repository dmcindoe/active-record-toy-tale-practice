class Purchase < ActiveRecord::Base
  belongs_to :toy
  belongs_to :kid

  def info
    "#{kid.name} bought #{quantity} #{toy.name} toys."
    # kid2 = purchase.first => kid2.info => this gives the string above.
  end
end

