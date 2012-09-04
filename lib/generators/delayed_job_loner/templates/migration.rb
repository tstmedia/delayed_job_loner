class AddLonerHashColumnToDelayedJobs < ActiveRecord::Migration
  def self.up
    add_column :delayed_jobs, :loner_hash, :string
    add_index :delayed_jobs, :loner_hash
  end
  
  def self.down
    remove_index :delayed_jobs, :loner_hash
    remove_column :delayed_jobs, :loner_hash
  end
end