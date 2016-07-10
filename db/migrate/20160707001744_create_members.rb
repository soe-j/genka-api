class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :name, null: false
    end
  end
end
