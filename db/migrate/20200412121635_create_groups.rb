# frozen_string_literal: true

class CreateGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :groups do |t|
      t.datetime :starts_on, null: false
      t.integer :course_id, null: false

      t.timestamps
    end
    add_index :groups, :course_id
  end
end
