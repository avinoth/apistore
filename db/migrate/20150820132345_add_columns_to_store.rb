class AddColumnsToStore < ActiveRecord::Migration
  def change
    add_column :stores, :last_accessed, :datetime
    add_column :stores, :accessed_times, :integer, default: 0
    add_column :stores, :active, :boolean, default: true
  end
end
