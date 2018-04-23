class CreateUrls < ActiveRecord::Migration[5.2]
  def change
    create_table :urls do |t|
      t.string :link, null: false
      t.string :short

      t.timestamps
    end
    add_index :urls, :short
  end
end
