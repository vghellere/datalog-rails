class CreateTemperatureSamples < ActiveRecord::Migration[7.2]
  def change
    create_table :temperature_samples do |t|
      t.float :value
      t.datetime :event_timestamp

      t.timestamps
    end
    add_index :temperature_samples, :event_timestamp
  end
end
