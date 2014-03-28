from django.shortcuts import render, redirect, get_object_or_404
from PetShelter.models import People, Shelter, ShelterStaff, Animal, AnimalFile,\
                              Receipt, Adoption, Surrender, Donation
from PetShelter.methods import *
from PetShelter.forms import UploadFileForm
from django.contrib.auth.models import User
from django.contrib.auth import authenticate
from django.contrib.auth import login as auth_login
from django.contrib.auth import logout as auth_logout
from django.contrib.auth.decorators import login_required
from django.core.exceptions import ObjectDoesNotExist
import datetime

# url(r'^receipts/$', views.act_receipts, name='act_receipts'),
def act_receipts(request):
  context = {
    'receipts': Receipt.objects.all(),
  } # context = {...}
  return render(request, 'PetShelter/activities/receipts.html', getBaseContext(request, context))
# def act_receipts(request)

# url(r'^receipt/(?P<receipt_id>[^\s/]+)/$', views.act_receipt, name='act_receipt'),
def act_receipt(request, receipt_id):
  context = {
    'receipt': get_object_or_404(Receipt, id=receipt_id),
  } # context = {...}
  return render(request, 'PetShelter/activities/receipt.html', getBaseContext(request, context))
# def act_receipt(request, receipt_id)

# url(r'^adoptions/$', views.act_adoptions, name='act_adoptions'),
def act_adoptions(request):
  context = {
    'adoptions': Adoption.objects.all(),
  } # context = {...}
  return render(request, 'PetShelter/activities/adoptions.html', getBaseContext(request, context))
# def act_adoptions(request)

# url(r'^adoption/(?P<adoption_id>[^\s/]+)/$', views.act_adoption, name='act_adoption'),
def act_adoption(request, adoption_id):
  context = {
    'adoption': get_object_or_404(Adoption, id=adoption_id),
  } # context = {...}
  return render(request, 'PetShelter/activities/adoption.html', getBaseContext(request, context))
# def act_adoption(request, adoption_id)

# url(r'^surrenders/$', views.act_surrenders, name='act_surrenders'),
def act_surrenders(request):
  context = {
    'surrenders': Surrender.objects.all(),
  } # context = {...}
  return render(request, 'PetShelter/activities/surrenders.html', getBaseContext(request, context))
# def act_surrenders(request)

# url(r'^surrender/(?P<surrender_id>[^\s/]+)/$', views.act_surrender, name='act_surrender'),
def act_surrender(request, surrender_id):
  context = {
    'surrender': get_object_or_404(Surrender, id=surrender_id),
  } # context = {...}
  return render(request, 'PetShelter/activities/surrender.html', getBaseContext(request, context))
# def act_surrender(request, surrender_id)

# url(r'^donations/$', views.act_donations, name='act_donations'),
def act_donations(request):
  context = {
    'donations': Donation.objects.all(),
  } # context = {...}
  return render(request, 'PetShelter/activities/donations.html', getBaseContext(request, context))
# def act_donations(request)

# url(r'^donation/(?P<donation_id>[^\s/]+)/$', views.act_donation, name='act_donation'),
def act_donation(request, donation_id):
  context = {
    'donation': get_object_or_404(Donation, id=donation_id),
  } # context = {...}
  return render(request, 'PetShelter/activities/donation.html', getBaseContext(request, context))
# def act_donation(request, donation_id)

# url(r'^volunteers/$', views.act_volunteers, name='act_volunteers'),
def act_volunteers(request):
  context = {
    'volunteers': ShelterStaff.objects.filter(staff_type='VOLUNTEER', accepted=True)
  } # context = {...}
  return render(request, 'PetShelter/activities/volunteers.html', getBaseContext(request, context))
# def act_volunteers(request)

# url(r'^volunteer/(?P<volunteer_id>[^\s/]+)/$', views.act_volunteer, name='act_volunteer'),
def act_volunteer(request, volunteer_id):
  return redirect('staff', staff_id=volunteer_id)
# def act_volunteer(request, volunteer_id)

