class CreateSessions < ActiveRecord::Migration
  def self.up
    create_table :sessions do |t|
      t.integer :game_id
      t.integer :player_id

      t.timestamps
    end
  end

  def self.down
    drop_table :sessions
  end
end
