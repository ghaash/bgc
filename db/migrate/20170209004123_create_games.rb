class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :title
      t.string :players
      t.string :description
      t.string :mechanics

      t.integer :user_id
    end
  end
end
