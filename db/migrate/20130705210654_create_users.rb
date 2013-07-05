class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, :null => false
      t.string :phone_number
      t.string :status

      t.timestamps
    end
  end
end
