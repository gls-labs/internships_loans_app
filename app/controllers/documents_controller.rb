# frozen_string_literal: true

# Controller actions for documents
class DocumentsController < ApplicationController
  before_action :set_document, except: %i[index new create]

  def index
    @documents = Document.all
  end

  def new
    @document = Document.new
  end

  def create
    @document = Document.new(document_params)

    if @document.save
      flash[:success] = 'Document created successfully'
      redirect_to documents_path
    else
      flash.now[:error] = 'Error creating the document'
      render :new
    end
  end

  def edit; end

  def update
    if @document.update(document_params)
      flash[:success] = 'Document updated successfully'
      redirect_to documents_path
    else
      flash.now[:error] = 'Error updating the document'
      render :edit
    end
  end

  def destroy
    @document.destroy
    flash[:info] = 'The document has been deleted'
    redirect_to documents_path
  end

  private

  def set_document
    @document = Document.find(params[:id])
  end

  def document_params
    params.require(:document).permit(:title, :file)
  end
end
