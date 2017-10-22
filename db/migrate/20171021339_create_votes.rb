class CreateVotes < ActiveRecord::Migration[5.0]
  def change
    create_table :votes do |t|
      t.integer :user_id
      t.references :votable, polymorphic: true, index: true

      t.timestamps null: false
    end
  end
end
