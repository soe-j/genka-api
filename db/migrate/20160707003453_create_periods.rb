class CreatePeriods < ActiveRecord::Migration
  def change
    create_table :periods do |t|
      t.integer :project_id, null: false
      t.integer :stage_id,   null: false
      t.integer :member_id,  null: false
      t.datetime :start_at,  null: false
    end
  end
end
