module Management
  extend ActiveSupport::Concern

  # get 'management' => 'petshelter#management'
  def management
    prepareBaseContext
  end # def management

  # get 'management/receive' => 'petshelter#man_receive'
  def man_receive
    prepareBaseContext
    @animal = Animal.take!
    render 'petshelter/management/receive'
  end # def man_receive

  # get 'management/shelters' => 'petshelter#man_shelters'
  def man_shelters
    prepareBaseContext
    @shelters = Shelter.all
    render 'petshelter/management/shelters'
  end # def man_shelters

  # get 'management/shelter/:shelter_id' => 'petshelter#man_shelter'
  def man_shelter
    prepareBaseContext
    @shelter = Shelter.find(params[:shelter_id])
    @members = ShelterStaff.where('staff_type = ? AND shelter_id = ?', 'MEMBER', @shelter)
    @volunteers = ShelterStaff.where('staff_type = ? AND shelter_id = ?', 'VOLUNTEER', @shelter)
    @people = People.take!
    render 'petshelter/management/shelter'
  end # def man_shelter

  # get 'management/staffs' => 'petshelter#man_staffs'
  def man_staffs
    prepareBaseContext
    @members = ShelterStaff.where('staff_type = ?', 'MEMBER')
    @volunteers = ShelterStaff.where('staff_type = ?', 'VOLUNTEER')
    render 'petshelter/management/staffs'
  end # def man_staffs

  # get 'management/staff/:staff_id' => 'petshelter#man_staff'
  def man_staff
    prepareBaseContext
    @staff = ShelterStaff.find(params[:staff_id])
    @people = People.find(@staff.people_id)
    @shelters = Shelter.all
    render 'petshelter/management/staff'
  end # def man_staff

  # get 'management/requests' => 'petshelter#man_requests'
  def man_requests
    prepareBaseContext
    @adoptions = Adoption.where('adoption_date IS NULL').order('adoption_date').take(5)
    @surrenders = Surrender.where('surrender_date IS NULL').order('surrender_date').take(5)
    @donations = Donation.where('donation_date IS NULL').order('donation_date').take(5)
    @volunteers = ShelterStaff.where('staff_type = ? AND start_date IS NULL', 'VOLUNTEER') \
                              .order('start_date').take(5)
    render 'petshelter/management/requests'
  end # def man_requests

  # get 'management/requests/adoptions' => 'petshelter#man_req_adoptions'
  def man_req_adoptions
    prepareBaseContext
    @adoptions = Adoption.where('adoption_date IS NULL').order('adoption_date')
    render 'petshelter/management/requests/adoptions'
  end # def man_req_adoptions

  # get 'management/requests/adoption/:adoption_id' => 'petshelter#man_req_adoption'
  def man_req_adoption
    prepareBaseContext
    @adoption = Adoption.find(params[:adoption_id])
    render 'petshelter/management/requests/adoption'
  end # def man_req_adoption

  # get 'management/requests/surrenders' => 'petshelter#man_req_surrenders'
  def man_req_surrenders
    prepareBaseContext
    @surrenders = Surrender.where('surrender_date IS NULL').order('surrender_date')
    render 'petshelter/management/requests/surrenders'
  end # def man_req_surrenders

  # get 'management/requests/surrender/:surrender_id' => 'petshelter#man_req_surrender'
  def man_req_surrender
    prepareBaseContext
    @surrender = Surrender.find(params[:surrender_id])
    render 'petshelter/management/requests/surrender'
  end # def man_req_surrender

  # get 'management/requests/donations' => 'petshelter#man_req_donations'
  def man_req_donations
    prepareBaseContext
    @donations = Donation.where('donation_date IS NULL').order('donation_date')
    render 'petshelter/management/requests/donations'
  end # def man_req_donations

  # get 'management/requests/donation/:donation_id' => 'petshelter#man_req_donation'
  def man_req_donation
    prepareBaseContext
    @donation = Donation.find(params[:donation_id])
    render 'petshelter/management/requests/donation'
  end # def man_req_donation

  # get 'management/requests/volunteers' => 'petshelter#man_req_volunteers'
  def man_req_volunteers
    prepareBaseContext
    @volunteers = ShelterStaff.where('staff_type = ? AND start_date IS NULL', 'VOLUNTEER')
    render 'petshelter/management/requests/volunteers'
  end # def man_req_volunteers

  # get 'management/requests/volunteer/:volunteer_id' => 'petshelter#man_req_volunteer'
  def man_req_volunteer
    prepareBaseContext
    redirect_to action: 'man_staff', staff_id: params[:volunteer_id]
  end # def man_req_volunteer

end # ﻿module Management

