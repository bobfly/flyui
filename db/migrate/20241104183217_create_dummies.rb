class CreateDummies < ActiveRecord::Migration[8.0]
  def change
    create_table :dummies do |t|
      t.string :name
      t.date :started_at
      t.datetime :completed_at
      t.boolean :active, default: false
      t.string :status

      t.timestamps
    end
  end
end
