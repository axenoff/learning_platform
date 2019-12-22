class CreateGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :groups do |t|
      t.references :course, foreign_key: true
      t.date :date_start
      t.date :date_finish

      t.timestamps
    end
  end
end
