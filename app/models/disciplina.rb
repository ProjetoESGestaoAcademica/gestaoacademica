class Disciplina < ApplicationRecord
  validates :nome, presence: true
  validates :ementa, presence: true, length: { maximum: 200 }
end
