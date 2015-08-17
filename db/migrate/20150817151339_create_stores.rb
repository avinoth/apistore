class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.string :name, index: true, null: false
      t.jsonb :content
      t.uuid :token, index: true, null: false
      t.datetime :expiry, index: true, null: false

      t.timestamps null: false
    end
  end
end
