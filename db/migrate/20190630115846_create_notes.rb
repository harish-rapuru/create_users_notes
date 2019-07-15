class CreateNotes < ActiveRecord::Migration[5.2]
  def change
    create_table :notes do |t|
      t.string :title, null: false
      t.text :description
      t.belongs_to :user
      t.timestamps
    end
  end
end
