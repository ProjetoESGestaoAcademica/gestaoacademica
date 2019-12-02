class CreateAlunos < ActiveRecord::Migration[5.1]
  def change
    create_table :alunos do |t|
      t.string :nome
      t.string :cpf
      t.integer :idade

      t.timestamps
    end
  end
end
