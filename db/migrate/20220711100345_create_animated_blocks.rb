class CreateAnimatedBlocks < ActiveRecord::Migration[7.0]
  def change
    create_table :animated_blocks do |t|
      t.references :animated_gif, null: false, foreign_key: true
      t.string :block_word, :limit => 9
      t.string :block_style, :limit => 15
      t.timestamps
    end
  end
end