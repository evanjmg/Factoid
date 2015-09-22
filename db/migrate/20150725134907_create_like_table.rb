class CreateLikeTable < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.belongs_to :user, index: true
      t.timestamps null: false
      t.references :fact, index: true
      t.references :user, index: true

    end
  end
end
