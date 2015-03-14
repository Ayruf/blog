class CreateContenus < ActiveRecord::Migration
  def change
    create_table :contenus do |t|
      t.text :texte
      t.string :type
      t.references :article, index: true

      t.timestamps null: false
    end
    add_foreign_key :contenus, :articles
  end
end
