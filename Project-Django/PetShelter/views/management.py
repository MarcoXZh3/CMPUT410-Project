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

# url(r'^management/$', views.management, name='management'),
@login_required
def management(request):
  context = {
    'adoptions': Adoption.objects.filter(adoption_date=None).order_by('adoption_date')[:5],
    'surrenders': Surrender.objects.filter(surrender_date=None).order_by('surrender_date')[:5],
    'donations': Donation.objects.filter(accepted_date=None).order_by('accepted_date')[:5],
    'volunteers': ShelterStaff.objects.filter(start_date=None).order_by('start_date')[:5],
  } # context = {...}
  if request.method == 'POST':
    # do something
    return redirect('management')
  return render(request, 'PetShelter/management.html', getBaseContext(request, context))
# def management(request)

# url(r'^management/receive/$', views.man_receive, name='man_receive'),
@login_required
def man_receive(request):
  context = {
    'animal': Animal.objects.all()[0],
  } # context = {...}
  if request.method == 'POST':
    # do something
    return redirect('management')
  return render(request, 'PetShelter/management/receive.html', getBaseContext(request, context))
#def man_receive(request)

# url(r'^management/shelters/$', views.man_shelters, name='man_shelters'),
@login_required
def man_shelters(request):
  shelters = Shelter.objects.all()
  context = {
    'shelters': Shelter.objects.all(),
  } # context = {...}
  return render(request, 'PetShelter/management/shelters.html', getBaseContext(request, context))
# def man_shelters(request)

# url(r'^management/shelter/(?P<shelter_id>[^\s/]+)/$', views.man_shelter, name='man_shelter'),
@login_required
def man_shelter(request, shelter_id):
  context = {
    'shelter': get_object_or_404(Shelter, shelter_id=shelter_id),
    'users': People.objects.all(),
  } # context = {...}
  return render(request, 'PetShelter/management/shelter.html', getBaseContext(request, context))
# def man_shelter(request, shelter_id)

# url(r'^management/staffs/$', views.man_staffs, name='man_staffs'),
@login_required
def man_staffs(request):
  context = {
    'members': ShelterStaff.objects.filter(staff_type='MEMBER'),
    'volunteers': ShelterStaff.objects.filter(staff_type='VOLUNTEER'),
  } # context = {...}
  return render(request, 'PetShelter/management/staffs.html', getBaseContext(request, context))
# def man_staffs(request)

# url(r'^management/staff/(?P<staff_id>[^\s/]+)/$', views.man_staff, name='man_staff'),
@login_required
def man_staff(request, staff_id):
  context = {
    'staff': get_object_or_404(ShelterStaff, staff_id=staff_id),
    'user': get_object_or_404(People, user_id=staff_id),
    'shelters': Shelter.objects.all(),
  } # context = {...}
  return render(request, 'PetShelter/management/staff.html', getBaseContext(request, context))
# def man_staff(request, staff_id)

# url(r'^management/requests/$', views.man_requests, name='man_requests'),
@login_required
def man_requests(request):
  context = {
    'adoptions': Adoption.objects.filter(adoption_date=None).order_by('adoption_date')[:5],
    'surrenders': Surrender.objects.filter(surrender_date=None).order_by('surrender_date')[:5],
    'donations': Donation.objects.filter(accepted_date=None).order_by('accepted_date')[:5],
    'volunteers': ShelterStaff.objects.filter(start_date=None).order_by('start_date')[:5],
  } # context = {...}
  if request.method == 'POST':
    # do something
    return redirect('management')
  return render(request, 'PetShelter/management/requests.html', getBaseContext(request, context))
# def man_requests(request)

# url(r'^management/requests/adoptions/$', views.man_req_adoptions, name='man_req_adoptions'),
@login_required
def man_req_adoptions(request):
  context = {
    'adoptions': Adoption.objects.filter(adoption_date=None).order_by('adoption_date'),
  } # context = {...}
  if request.method == 'POST':
    # do something
    return redirect('management')
  return render(request, 'PetShelter/management/requests/adoptions.html', getBaseContext(request, context))
# def man_req_adoptions(request)

# url(r'^management/requests/adoption/(?P<adoption_id>[^\s/]+)/$',
#       views.man_req_adoption, name='man_req_adoption'),
@login_required
def man_req_adoption(request, adoption_id):
  context = {
    'adoption': get_object_or_404(Adoption, id=adoption_id),
  } # context = {...}
  if request.method == 'POST':
    # do something
    return redirect('management')
  return render(request, 'PetShelter/management/requests/adoption.html', getBaseContext(request, context))
# def man_req_adoption(request, adoption_id)

# url(r'^management/requests/surrenders/$', views.man_req_surrenders, name='man_req_surrenders'),
@login_required
def man_req_surrenders(request):
  context = {
    'surrenders': Surrender.objects.filter(surrender_date=None).order_by('surrender_date'),
  } # context = {...}
  if request.method == 'POST':
    # do something
    return redirect('management')
  return render(request, 'PetShelter/management/requests/surrenders.html', getBaseContext(request, context))
# def man_req_surrenders(request)

# url(r'^management/requests/surrender/(?P<surrender_id>[^\s/]+)/$',
#       views.man_req_surrender, name='man_req_surrender'),
@login_required
def man_req_surrender(request, surrender_id):
  context = {
    'surrender': get_object_or_404(Surrender, id=surrender_id),
  } # context = {...}
  if request.method == 'POST':
    # do something
    return redirect('management')
  return render(request, 'PetShelter/management/requests/surrender.html', getBaseContext(request, context))
# def man_req_surrender(request, surrender_id)

# url(r'^management/requests/donations/$', views.man_req_donations, name='man_req_donations'),
@login_required
def man_req_donations(request):
  context = {
    'donations': Donation.objects.filter(accepted_date=None).order_by('accepted_date'),
  } # context = {...}
  if request.method == 'POST':
    # do something
    return redirect('management')
  return render(request, 'PetShelter/management/requests/donations.html', getBaseContext(request, context))
# def man_req_donations(request)

# url(r'^management/requests/donation/(?P<donation_id>[^\s/]+)/$',
#       views.man_req_donation, name='man_req_donation'),
@login_required
def man_req_donation(request, donation_id):
  context = {
    'donation': get_object_or_404(Donation, id=donation_id),
  } # context = {...}
  if request.method == 'POST':
    # do something
    return redirect('management')
  return render(request, 'PetShelter/management/requests/donation.html', getBaseContext(request, context))
# def man_req_donation(request, donation_id)

# url(r'^management/requests/volunteers/$', views.man_req_volunteers, name='man_req_volunteers'),
@login_required
def man_req_volunteers(request):
  context = {
    'volunteers': ShelterStaff.objects.filter(start_date=None).order_by('start_date'),
  } # context = {...}
  if request.method == 'POST':
    # do something
    return redirect('management')
  return render(request, 'PetShelter/management/requests/volunteers.html', getBaseContext(request, context))
# def man_req_volunteers(request)

# url(r'^management/requests/volunteer/(?P<volunteer_id>[^\s/]+)/$',
#       views.man_req_volunteer, name='man_req_volunteer'),
@login_required
def man_req_volunteer(request, volunteer_id):
  context = {
    'volunteer': get_object_or_404(ShelterStaff, staff_id=volunteer_id),
  } # context = {...}
  if request.method == 'POST':
    # do something
    return redirect('management')
  return render(request, 'PetShelter/management/requests/volunteer.html', getBaseContext(request, context))
# def man_req_volunteer(request, volunteer_id)

