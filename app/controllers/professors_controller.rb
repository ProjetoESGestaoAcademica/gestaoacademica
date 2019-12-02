class ProfessorsController < ApplicationController
  include SessionsHelper
  before_action :logged_in_user

  def index
    @professors= Professor.all
  end

  def show
    @professor = Professor.find(params[:id])
  end

  def new
    @professor = Professor.new
  end

  def edit
    @professor = Professor.find(params[:id])
  end

  def create
    #funcao recebe parametros tratados do professor cria um model professor
    @professor = Professor.new(professor_params)

    #model herda a funcao save
    if @professor.save
      #redireciona para o model em questao
      redirect_to @professor
    else
      render 'new'
    end
  end

  def update
    @professor = Professor.find(params[:id])
    if @professor.update(professor_params)
      redirect_to @professor
    else
      render 'edit'
    end
  end

  def destroy
    @professor = Professor.find(params[:id])
    @professor.destroy

    redirect_to professors_path
  end

  private
  #parametros para criar model professor, form :professor(nome, cpf, formacao)
  def professor_params
    params.require(:professor).permit(:nome, :cpf, :formacao)
  end
end
