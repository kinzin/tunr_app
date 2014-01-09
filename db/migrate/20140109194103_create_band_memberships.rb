class CreateBandMemberships < ActiveRecord::Migration
  def change
    create_table :band_memberships do |t|
      t.string :instrument
      t.integer :musician_id
      t.integer :band_id

      t.timestamps
    end
  end
end
