class DeleteConditionInEquipment < ActiveRecord::Migration[6.0]
  def change
    remove_column :equipment, :condition
  end
end
