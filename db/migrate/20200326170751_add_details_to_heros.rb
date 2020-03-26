class AddDetailsToHeros < ActiveRecord::Migration[5.0]
  def change
    add_column :heros, :gold, :integer
    add_column :heros, :user_id, :integer
  end
end
