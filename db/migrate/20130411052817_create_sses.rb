class CreateSses < ActiveRecord::Migration
  def change
    create_table :sses do |t|
      t.string :key
      t.string :event
      t.text :data

      t.timestamps
    end
  end
end
