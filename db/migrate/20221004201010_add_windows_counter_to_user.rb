class AddWindowsCounterToUser < ActiveRecord::Migration[5.1]
  def change
    change_table :users do |t|
      t.integer :windows_counter, default: 0, null: false
    end
  end
end
