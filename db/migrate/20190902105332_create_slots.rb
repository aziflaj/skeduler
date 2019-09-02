class CreateSlots < ActiveRecord::Migration[6.0]
  def change
    create_table :slots do |t|
      t.datetime :scheduled_at
      t.references :user, null: false, foreign_key: true
      t.text :notes
      t.string :guest_email

      t.timestamps
    end
  end
end
