class CreateStages < ActiveRecord::Migration
  def change
    create_table :stages do |t|
      t.string :name, null: false
    end
  end
end
