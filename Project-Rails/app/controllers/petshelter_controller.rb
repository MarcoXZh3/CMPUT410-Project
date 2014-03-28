class PetshelterController < ApplicationController
  layout 'base'
  include Activities, Applications, Management

  # root 'petshelter#events'
  def events
    prepareBaseContext
    @receipts = Receipt.order('received_date').take(5)
    @adoptions = Adoption.order('adoption_date').take(5)
    @surrenders = Surrender.order('surrender_date').take(5)
    @donations = Donation.order('donation_date').take(5)
    @volunteers = ShelterStaff.where('staff_type = ?', 'VOLUNTEER').order('start_date').take(5)
  end # def events

  # get 'animals' => 'petshelter#animals'
  # get 'animals/:species' => 'petshelter#animals'
  def animals
    prepareBaseContext
    @species = params[:species]
    @animals = (@species == nil) ? Animal.all : Animal.where('species = ? ', @species)
    @files = Array.new
    for a in @animals
      @files.push((AnimalFile.find_by animal: a))
    end
  end # def animals

  # get 'animal/:species/:animal_id' => 'petshelter#animal'
  def animal
    prepareBaseContext
    @species = params[:species]
    @animal = Animal.where('animal_id = ?', params[:animal_id]).first
    @files = AnimalFile.where('animal_id = ?', @animal)
  end # def animal

  # get 'animal/:species/:animal_id/:file_id' => 'petshelter#animal_file'
  def animal_file
    prepareBaseContext
    @species = params[:species]
    @animal = Animal.where('animal_id = ?', params[:animal_id]).first
    @file = AnimalFile.find(params[:file_id])
    puts params[:file_id]
    puts @file.file_type
    puts @file.path
  end # def animal_file

  # get 'shelters' => 'petshelter#shelters'
  def shelters
    prepareBaseContext
    @shelters = Shelter.all
  end # def shelters

  # get 'shelter/:shelter_id' => 'petshelter#shelter'
  def shelter
    prepareBaseContext
    @shelter = Shelter.find(params[:shelter_id])
    @shetler_staffs = ShelterStaff.where('shelter_id = ? AND staff_type = ?', params[:shelter_id], 'MEMBER')
    @volunteers = ShelterStaff.where('shelter_id = ? AND staff_type = ? AND accepted = ?',
                                     params[:shelter_id], 'VOLUNTEER', true)
  end # def shelter

  # get 'staffs' => 'petshelter#staffs'
  def staffs
    prepareBaseContext
    @shetler_staffs = ShelterStaff.where('staff_type = ?', 'MEMBER')
    @volunteers = ShelterStaff.where('staff_type = ?', 'VOLUNTEER')
  end # def staffs

  # get 'staff/:staff_id' => 'petshelter#staff'
  def staff
    prepareBaseContext
    @staff = ShelterStaff.find(params[:staff_id])
    @shelter = Shelter.find(@staff.shelter)
    @user = People.find(params[:staff_id])
    render 'user'
  end # def staff

  # get 'users' => 'petshelter#users'
  def users
    if current_user == nil
      render :status => :forbidden, :text => "Forbidden"
      return
    end
    prepareBaseContext
    @users = People.all
  end # def users

  # get 'user/:user_id' => 'petshelter#user'
  def user
    if current_user == nil
      render :status => :forbidden, :text => "Forbidden"
      return
    end
    prepareBaseContext
    @staff = nil
    @shelter = nil
    @user = People.find(params[:user_id])
  end # def user

  # get 'login' => 'petshelter#login'
  def login
    prepareBaseContext
  end # def login

  private
    def prepareBaseContext
      @all_species = Animal.all.pluck('species').uniq
      @login = (current_user == nil) ? nil : ShelterStaff.find_by(people: People.find_by(e_mail: current_user.email))
    end
  # private

end # class PetshelterController < ApplicationController

