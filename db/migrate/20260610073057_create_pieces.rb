class CreatePieces < ActiveRecord::Migration[8.1]
  def change
    create_table :pieces do |t|
      t.integer :position
      t.string :color

      t.timestamps
    end
  end
end
