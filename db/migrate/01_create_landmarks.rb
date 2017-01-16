class CreateLandmarks < ActiveRecord::Migration #file provided by Flatiron at start of lab
  #raise "Write CreateLandmarks migration here"
  def change
    create_table :landmarks do |t|
      t.string :name
      t.integer :figure_id
      t.integer :year_completed
      t.timestamps
    end
  end
end
