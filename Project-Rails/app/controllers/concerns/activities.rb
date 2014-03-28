module Activities
  extend ActiveSupport::Concern

  # get 'activities/receipts' => 'petshelter#act_receipts'
  def act_receipts
    prepareBaseContext
    @receipts = Receipt.all
    render 'petshelter/activities/receipts'
  end # def act_receipts

  # get 'activities/receipt/:receipt_id' => 'petshelter#act_receipt'
  def act_receipt
    prepareBaseContext
    @receipt = Receipt.find(params[:receipt_id])
    @receiver = People.find(@receipt.people_id)
    @animal = Animal.find(@receipt.animal)
    render 'petshelter/activities/receipt'
  end # def act_receipt

  # get 'activities/adoptions' => 'petshelter#act_adoptions'
  def act_adoptions
    prepareBaseContext
    @adoptions = Adoption.all
    render 'petshelter/activities/adoptions'
  end # def act_adoptions

  # get 'activities/adoption/:adoption_id' => 'petshelter#act_adoption'
  def act_adoption
    prepareBaseContext
    @adoption = Adoption.find(params[:adoption_id])
    @adopter = People.find(@adoption.people)
    @animal = Animal.find(@adoption.animal)
    render 'petshelter/activities/adoption'
  end # def act_adoption

  # get 'activities/surrenders' => 'petshelter#act_surrenders'
  def act_surrenders
    prepareBaseContext
    @surrenders = Surrender.all
    render 'petshelter/activities/surrenders'
  end # def act_surrenders

  # get 'activities/surrender/:surrender_id' => 'petshelter#act_surrender'
  def act_surrender
    prepareBaseContext
    @surrender = Surrender.find(params[:surrender_id])
    @surrenderer = People.find(@surrender.people)
    @animal = Animal.find(@surrender.animal)
    render 'petshelter/activities/surrender'
  end # def act_surrender

  # get 'activities/donations' => 'petshelter#act_donations'
  def act_donations
    prepareBaseContext
    @donations = Donation.all
    render 'petshelter/activities/donations'
  end # def act_donations

  # get 'activities/donation/:donation_id' => 'petshelter#act_donation'
  def act_donation
    prepareBaseContext
    @donation = Donation.find(params[:donation_id])
    @donator = People.find(@donation.people)
    @animal = (@donation.animal == nil) ? nil : Animal.find(@donation.animal)
    render 'petshelter/activities/donation'
  end # def act_donation

  # get 'activities/volunteers' => 'petshelter#act_volunteers'
  def act_volunteers
    prepareBaseContext
    @volunteers = ShelterStaff.where('staff_type = ?', 'VOLUNTEER')
    render 'petshelter/activities/volunteers'
  end # def act_volunteers

  # get 'activities/volunteer/:volunteer_id' => 'petshelter#act_volunteer'
  def act_volunteer
    redirect_to action: 'staff', staff_id: People.find(params[:volunteer_id])
  end # def act_volunteer

end # ﻿module Activities

