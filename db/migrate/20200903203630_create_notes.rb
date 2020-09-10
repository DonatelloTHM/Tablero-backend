# frozen_string_literal: true

class CreateNotes < ActiveRecord::Migration[6.0]
  def change
    create_table :notes do |t|
      t.string :title
      t.text :content
      t.string :label
      t.boolean :pinned
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
