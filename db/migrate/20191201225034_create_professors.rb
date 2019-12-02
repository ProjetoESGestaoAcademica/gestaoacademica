class CreateProfessors < ActiveRecord::Migration[5.1]
  def change
    create_table :professors do |t|
      t.string :nome
      t.string :cpf
      t.string :formacao

      t.timestamps
    end
  end
end
