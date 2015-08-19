class CreateStores < ActiveRecord::Migration
  def change
    enable_extension "uuid-ossp"
    create_table :stores, id: :uuid do |t|
      t.string :name, index: true, null: false
      t.jsonb :content
      t.uuid :token, index: true, null: false

      t.timestamps null: false
    end
  end
end
