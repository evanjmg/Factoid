class AddFactId < ActiveRecord::Migration
  def change
  	add_column :comments, :fact_id, :integer
  end
end
