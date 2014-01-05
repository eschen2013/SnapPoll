class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.references :poll, index: true
      t.string :body

      t.timestamps
    end
  end
end
