class RemoveWindowsCounterFromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :windows_counter, :integer
  end
end
