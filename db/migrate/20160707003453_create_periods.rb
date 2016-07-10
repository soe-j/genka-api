class CreatePeriods < ActiveRecord::Migration
  def change
    create_table :periods do |t|
      t.integer :project_id
      t.integer :process_id
      t.integer :member_id
      t.datetime :start_at
    end
  end
end
