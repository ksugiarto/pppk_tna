class ImportantPeopleController < ApplicationController
  before_filter :set_important_person, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @important_people = ImportantPerson.all
    respond_with(@important_people)
  end

  def show
    respond_with(@important_person)
  end

  def new
    @important_person = ImportantPerson.new
    respond_with(@important_person)
  end

  def edit
  end

  def create
    @important_person = ImportantPerson.new(params[:important_person])
    @important_person.save
    respond_with(@important_person)
  end

  def update
    @important_person.update_attributes(params[:important_person])
    respond_with(@important_person)
  end

  def destroy
    @important_person.destroy
    respond_with(@important_person)
  end

  private
    def set_important_person
      @important_person = ImportantPerson.find(params[:id])
    end
end
