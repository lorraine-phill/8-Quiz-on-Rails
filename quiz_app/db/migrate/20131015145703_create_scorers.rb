class CreateScorers < ActiveRecord::Migration
  def change
    create_table :scorers do |t|
      t.integer :answer_id

      t.timestamps
    end
  end
end
