class CreateValidationlessObjects < ActiveRecord::Migration
  def change
    create_table :validationless_objects do |t|
      t.string :field

      t.timestamps
    end
  end
end
