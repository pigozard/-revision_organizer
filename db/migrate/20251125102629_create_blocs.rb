class CreateBlocs < ActiveRecord::Migration[7.1]
  def change
    create_table :blocs do |t|
      t.string :name
      t.text :content
      t.text :bloc_prompt

      t.timestamps
    end
  end
end
