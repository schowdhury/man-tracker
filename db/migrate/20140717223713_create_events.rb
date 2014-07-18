class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :account_id
      t.string :user_agent
      t.string :ip

      t.timestamps
    end
  end
end
