class AddNationalityToShows < ActiveRecord::Migration[5.1]
  def change
    add_column :shows, :nationality, :string
  end
end
