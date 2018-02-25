class AddYearCompletedToLandmarks < ActiveRecord::Migration[5.1]
  def change
    add_column :landmarks, :year_completed, :integer
  end
end
