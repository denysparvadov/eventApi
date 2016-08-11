class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.text :title
      t.integer :tickets_amount
      t.datetime :date_start
      t.date :date_end

      t.timestamps
    end
  end
end
