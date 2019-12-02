class Sessao
  attr_reader :ativa, :id, :senha
  private :ativa, :id, :senha

  def initialize()
    @id = "admin"
    @senha = "admin"
    @ativa = false
  end

  def logar(id, senha)
    if @id.eql?id and @senha.eql?senha
      @ativa = true
    else
      raise 'Usuario ou senha invalida'
    end
  end

  def logout
    @ativa = false
  end
end