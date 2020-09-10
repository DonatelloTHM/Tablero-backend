# frozen_string_literal: true

class AddUnformattedToJournals < ActiveRecord::Migration[6.0]
  def change
    add_column :journals, :unformatted, :text
  end
end
