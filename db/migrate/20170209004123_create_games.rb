class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :content
      t.integer :user_id
    end
  end
end
