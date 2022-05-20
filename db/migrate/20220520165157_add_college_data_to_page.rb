class AddCollegeDataToPage < ActiveRecord::Migration[6.0]
  def change
    add_column :pages, :am_college_id, :bigint
  end
end
