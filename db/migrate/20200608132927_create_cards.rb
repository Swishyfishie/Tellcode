class CreateCards < ActiveRecord::Migration[6.0]
  def change
    create_table :cards do |t|
      t.string :youtube_link
      t.string :codewars_link
      t.string :article_link
      t.string :question
      t.belongs_to :user
      t.belongs_to :day

      t.timestamps
    end
  end
end
