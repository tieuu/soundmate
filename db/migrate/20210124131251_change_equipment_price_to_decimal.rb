class ChangeEquipmentPriceToDecimal < ActiveRecord::Migration[6.0]
  def change
    change_column :equipment, :price, :decimal, :precision => 8, :scale => 2
  end
end
