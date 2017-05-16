class AddShowToPerformance < ActiveRecord::Migration[5.1]
  def change
    add_reference :performances, :show, foreign_key: true
  end
end
