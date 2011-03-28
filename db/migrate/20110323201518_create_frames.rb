class CreateFrames < ActiveRecord::Migration
  def self.up
    create_table :frames do |t|
      t.integer :session_id
      t.integer :first_frame
      t.integer :second_frame
      t.integer :turn
      
      t.timestamps
    end
  end

  def self.down
    drop_table :frames
  end
end
