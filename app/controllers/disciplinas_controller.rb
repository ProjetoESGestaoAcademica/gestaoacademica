class DisciplinasController < ApplicationController
  include SessionsHelper
  before_action :logged_in_user

  def index
    @disciplinas = Disciplina.all
  end

  def show
    @disciplina = Disciplina.find(params[:id])
  end

  def new
    @disciplina = Disciplina.new
  end

  def edit
    @disciplina = Disciplina.find(params[:id])
  end

  def create

    @disciplina = Disciplina.new(disciplina_params)

    #model herda a funcao save
    if @disciplina.save
      #redireciona para o model em questao
      redirect_to @disciplina
    else
      render 'new'
    end
  end

  def update
    @disciplina = Disciplina.find(params[:id])
    if @disciplina.update(disciplina_params)
      redirect_to @disciplina
    else
      render 'edit'
    end
  end

  def destroy
    @disciplina = Disciplina.find(params[:id])
    @disciplina.destroy

    redirect_to disciplinas_path
  end

  private

  def disciplina_params
    params.require(:disciplina).permit(:nome, :ementa, :horas)
  end
end
