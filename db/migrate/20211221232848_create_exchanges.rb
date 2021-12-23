class CreateExchanges < ActiveRecord::Migration[6.0]
  def change
    create_table :exchanges do |t|
      t.string :code
      t.decimal :rate

      t.index :code, unique: true
    end
  end
end
