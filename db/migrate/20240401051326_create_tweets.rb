class CreateTweets < ActiveRecord::Migration[7.0]
  def change
    create_table :tweets do |t|
      t.string :name, null: false
      t.string :title, null: false
      t.string :recipe, null: false
      t.timestamps
    end
  end
end