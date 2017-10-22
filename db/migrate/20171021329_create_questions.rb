class CreateQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :questions do |t|
      t.string :title
			t.string :body
			t.integer :user_id
      t.integer :view_count, default: 0
      # t.integer :view_count, :default => 0

      t.timestamps null: false
    end
  end
end
