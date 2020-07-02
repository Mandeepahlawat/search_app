class CreateHeadings < ActiveRecord::Migration[6.0]
  def change
    create_table :headings do |t|
      t.string :title
      t.references :website, null: false, foreign_key: true

      t.timestamps
    end
  end
end
