class AddChefRefToReciepes < ActiveRecord::Migration
  
  def change
    add_reference :reciepes, :chef, index: true, foreign_key: true
  end
end
