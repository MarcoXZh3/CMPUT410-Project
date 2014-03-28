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

# url(r'^$', views.index, name='index'),
def index(request):
  context = {
    'receipts': Receipt.objects.order_by('received_date')[:5],
    'adoptions': Adoption.objects.filter(accepted=True).order_by('adoption_date')[:5],
    'surrenders': Surrender.objects.filter(accepted=True).order_by('surrender_date')[:5],
    'donations': Donation.objects.filter(accepted=True).order_by('accepted_date')[:5],
    'volunteers': ShelterStaff.objects.filter(staff_type='VOLUNTEER', accepted=True).order_by('start_date')[:5],
  } # context = {...}
  return render(request, 'PetShelter/events.html', getBaseContext(request, context))
# def index(request)

# url(r'^animals/$', views.animals, name='animals'),
def animals(request):
  animals = Animal.objects.all()
  files = []
  for a in animals:
    files.append(AnimalFile.objects.filter(animal=a, file_type='PHOTO')[0])
  context = {
    'animals': animals,
    'files': files,
  } # context = {...}
  return render(request, 'PetShelter/animals.html', getBaseContext(request, context))
# def animals(request)

# url(r'^animals/(?P<species_id>[^\s/]+)/$', views.animals_species, name='animals_species'),
def animals_species(request, species_id):
  animals = Animal.objects.filter(species=species_id)
  files = []
  for a in animals:
    files.append(AnimalFile.objects.filter(animal=a, file_type='PHOTO')[0])
  context = {
    's': species_id,
    'animals': animals,
    'files': files,
  } # context = {...}
  return render(request, 'PetShelter/animals.html', getBaseContext(request, context))
# def animals_species(request, species_id)

# url(r'^animal/(?P<species_id>[^\s/]+)/(?P<animal_id>[^\s/]+)/$',
#       views.animal_species, name='animal_species'),
def animal_species(request, species_id, animal_id):
  animal = get_object_or_404(Animal, animal_id=animal_id)
  context = {
    's': species_id,
    'animal': animal,
    'files': AnimalFile.objects.filter(animal=animal),
  } # context = {...}
  return render(request, 'PetShelter/animal.html', getBaseContext(request, context))
# def animal_species(request, species_id, animal_id)

# url(r'^animal/(?P<species_id>[^\s/]+)/(?P<animal_id>[^\s/]+)/(?P<file_id>[^\s/]+)/$',
#       views.animal_file_species, name='animal_species'),
def animal_file_species(request, species_id, animal_id, file_id):
  context = {
    's': species_id,
    'animal': get_object_or_404(Animal, animal_id=animal_id),
    'file': get_object_or_404(AnimalFile, id=file_id),
  } # context = {...}
  return render(request, 'PetShelter/animal_file.html', getBaseContext(request, context))
# def animal_file_species(request, species_id, animal_id, file_id)

# url(r'^shelters/$', views.shelters, name='shelters'),
def shelters(request):
  shelters = Shelter.objects.all()
  context = {
    'shelters': Shelter.objects.all(),
  } # context = {...}
  return render(request, 'PetShelter/shelters.html', getBaseContext(request, context))
# def shelters(request)

# url(r'^shelter/(?P<shelter_id>[^\s/]+)/$', views.shelter, name='shelter'),
def shelter(request, shelter_id):
  shelters = Shelter.objects.all()
  context = {
    'shelter': get_object_or_404(Shelter, shelter_id=shelter_id),
    'members': ShelterStaff.objects.filter(shelter=shelter_id, staff_type='MEMBER'),
    'volunteers': ShelterStaff.objects.filter(shelter=shelter_id, staff_type='VOLUNTEER', accepted=True),
  } # context = {...}
  return render(request, 'PetShelter/shelter.html', getBaseContext(request, context))
# def shelter(request, shelter_id)

# url(r'^staffs/$', views.staffs, name='staffs'),
def staffs(request):
  context = {
    'members': ShelterStaff.objects.filter(staff_type='MEMBER'),
    'volunteers': ShelterStaff.objects.filter(staff_type='VOLUNTEER', accepted=True),
  } # context = {...}
  return render(request, 'PetShelter/staffs.html', getBaseContext(request, context))
# def staffs(request)

# url(r'^staff/(?P<staff_id>[^\s/]+)/$', views.staff, name='staff'),
def staff(request, staff_id):
  return redirect('user', user_id=staff_id)
# def staff(request, staff_id)

# url(r'^users/$', views.users, name='users'),
@login_required
def users(request):
  context = {
    'users': People.objects.all(),
  } # context = {...}
  return render(request, 'PetShelter/users.html', getBaseContext(request, context))
# def users(request)

# url(r'^user/(?P<user_id>[^\s/]+)/$', views.user, name='user'),
@login_required
def user(request, user_id):
  context = {
    'user': get_object_or_404(People, user_id=user_id),
  } # context = {...}
  #if len(ShelterStaff.objects.filter(staff_id=user_id, accepted=True)) > 0:
  if len(ShelterStaff.objects.filter(staff_id=user_id)) > 0:
    context['staff'] = get_object_or_404(ShelterStaff, staff_id=user_id)
  return render(request, 'PetShelter/user.html', getBaseContext(request, context))
# def user(request, user_id)

# url(r'^login/$', views.login, name='login'),
def login(request):
  if request.user.is_authenticated():
    return redirect('management')
  context = {
  } # context = {...}
  if request.method == 'POST':
    username = request.POST.get('name', '')
    password = request.POST.get('password', '')  
    user = authenticate(username=username, password=password)
    if user is not None:
      auth_login(request, user)
      return redirect('management')
    else:
      return redirect('index')
      pass
  return render(request, 'PetShelter/login.html', getBaseContext(request, context))
# def login(request)

# url(r'^logout/$', views.logout, name='logout'),
@login_required
def logout(request):
  auth_logout(request)
  return redirect('index')
# def logout(request)

