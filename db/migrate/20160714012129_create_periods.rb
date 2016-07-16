class CreatePeriods < ActiveRecord::Migration[5.0]
  def change
    create_table :periods do |t|
      t.integer :project_id
      t.integer :stage_id
      t.integer :member_id

      t.timestamps
    end
  end
end
