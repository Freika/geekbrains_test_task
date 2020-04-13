# frozen_string_literal: true

class CreateParticipations < ActiveRecord::Migration[6.0]
  def change
    create_table :participations do |t|
      t.integer :user_id
      t.integer :group_id

      t.timestamps
    end
    add_index :participations, :user_id
    add_index :participations, :group_id
  end
end
