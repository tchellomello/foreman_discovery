class CreateDiscoveryAttributeSets < ActiveRecord::Migration[4.2]
  def change
    create_table :discovery_attribute_sets do |t|
      t.references :host
      t.integer :memory, :limit => 8, :default => 0
      t.integer :cpu_count, :default => 0
      t.integer :disk_count, :default => 0
      t.integer :disks_size, :limit => 8, :default => 0
      t.timestamps :null => false
    end
    add_index :discovery_attribute_sets, :host_id
    add_foreign_key "discovery_attribute_sets", "hosts", name: "discovery_attribute_sets_host_id_fk"
  end
end
