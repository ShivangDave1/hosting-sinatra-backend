class CreateTweets < ActiveRecord::Migration[6.1]
  def change
    create_table :tweets do |t|
      t.string :message
      t.belongs_to :user, foreign_key: true
    end
  end
end
