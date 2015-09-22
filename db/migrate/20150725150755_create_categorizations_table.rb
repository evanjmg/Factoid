class CreateCategorizationsTable < ActiveRecord::Migration
  def change
    create_table :categorizations do |t|
      t.references :fact, index: true
      t.references :category, index: true
    end
  end
end
