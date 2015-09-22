class AddAssociationToFactsTable < ActiveRecord::Migration
  def change
   change_table :facts do |t|
    t.belongs_to :user
  end
end
end
