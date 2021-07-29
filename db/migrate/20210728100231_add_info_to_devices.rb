class AddInfoToDevices < ActiveRecord::Migration[6.1]
  def change
    add_column :devices, :description, :text
    add_column :devices, :availability, :boolean
  end
end
