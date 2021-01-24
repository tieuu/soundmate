class ChangeEquipmentPriceToDecimal < ActiveRecord::Migration[6.0]
  def change
    add_column :equipments, :price, :decimal, :scale => 2
  end
end
