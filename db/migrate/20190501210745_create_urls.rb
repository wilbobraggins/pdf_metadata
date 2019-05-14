class CreateUrls < ActiveRecord::Migration[5.2]
  def change
    create_table :urls do |t|
      t.string  :http_site
      t.timestamps
    end
  end
end
