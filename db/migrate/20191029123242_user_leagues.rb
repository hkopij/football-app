class UserLeagues < ActiveRecord::Migration[5.2]
  def change
    create_table :leagues_users do |t|
      t.belongs_to :league
      t.belongs_to :user
    end
  end
end
