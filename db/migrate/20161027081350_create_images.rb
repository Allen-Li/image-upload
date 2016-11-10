class CreateImages < ActiveRecord::Migration[5.0]
  def change
    create_table :images do |t|
      t.attachment :asset
      t.text :html

      t.timestamps
    end
  end
end
