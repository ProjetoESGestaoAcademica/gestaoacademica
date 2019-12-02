class AlunosController < ApplicationController
  include SessionsHelper
  before_action :logged_in_user

  def index
    @alunos = Aluno.all
  end

  def show
    @aluno = Aluno.find(params[:id])
  end

  def new
    @aluno = Aluno.new
  end

  def edit
    @aluno = Aluno.find(params[:id])
  end

  def create

    @aluno = Aluno.new(aluno_params)

    #model herda a funcao save
    if @aluno.save
      #redireciona para o model em questao
      redirect_to @aluno
    else
      render 'new'
    end
  end

  def update
    @aluno = Aluno.find(params[:id])
    if @aluno.update(aluno_params)
      redirect_to @aluno
    else
      render 'edit'
    end
  end

  def destroy
    @aluno = Aluno.find(params[:id])
    @aluno.destroy

    redirect_to alunos_path
  end

  private

  def aluno_params
    params.require(:aluno).permit(:nome, :cpf, :idade)
  end
end
