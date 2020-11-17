class MakeEmailsCaseSensitive < ActiveRecord::Migration
  def change
    change_column :users, :email, :string, presence: true, uniqueness: { case_sensitive: false }
  end
end
