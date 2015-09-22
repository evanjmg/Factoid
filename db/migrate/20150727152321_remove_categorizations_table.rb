class RemoveCategorizationsTable < ActiveRecord::Migration
  def change
    drop_table :categorizations
  end
end
