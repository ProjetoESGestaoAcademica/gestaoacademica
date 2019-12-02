class Professor < ApplicationRecord
  validates :nome, presence: true
  validates :cpf, presence: true, length: { minimum: 11 }
end
