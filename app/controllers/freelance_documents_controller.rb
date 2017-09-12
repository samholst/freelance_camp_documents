class FreelanceDocumentsController < ApplicationController
  before_action :set_freelance_document, only: [:show, :update, :destroy]

  def index
    @freelance_documents = FreelanceDocument.order('created_at DESC')

    render json: @freelance_documents
  end

  def show
    render json: @freelance_document
  end

  def create
    @freelance_document = FreelanceDocument.new(freelance_document_params)

    if @freelance_document.save
      render json: @freelance_document, status: :created, location: @freelance_document
    else
      render json: @freelance_document.errors, status: :unprocessable_entity
    end
  end

  def update
    if @freelance_document.update(freelance_document_params)
      render json: @freelance_document
    else
      render json: @freelance_document.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @freelance_document.destroy
  end

  private

    def set_freelance_document
      @freelance_document = FreelanceDocument.find(params[:id])
    end

    def freelance_document_params
      params.require(:freelance_document).permit(:title, :description, :file_url, :image_url)
    end
end
