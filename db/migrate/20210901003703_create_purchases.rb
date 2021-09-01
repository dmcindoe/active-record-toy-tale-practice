class CreatePurchases < ActiveRecord::Migration[6.1]
  def change
    create_table :purchases do |t|
      t.integer :quantity
      t.integer :kid_id
      t.integer :toy_id
    end
  end
end


# to test the information in the console.... 
# once you migrate, and then run db:seed.... try doing Purchase.all, Kid.all, Toy.all