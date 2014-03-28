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

# url(r'^applications/adopt/$', views.app_adopt, name='app_adopt'),
def app_adopt(request):
  animals = Animal.objects.filter(stage=True)
  files = []
  for a in animals:
    files.append(AnimalFile.objects.filter(animal=a, file_type='PHOTO')[0])
  context = {
    'animals': animals,
    'files': files,
    'people': People.objects.all()[0],
  } # context = {...}
  if request.method == 'POST':
    user_id=request.POST['user_id']
    name = request.POST['name']
    gender = request.POST['gender'].upper()
    age = 0 if request.POST['age'] == '' else int(request.POST['age'])
    phone = request.POST['phone']
    email = request.POST['email']
    address = request.POST['address']
    province = request.POST['province']
    postal_code = request.POST['postal_code']
    education = request.POST['education']
    occupation = request.POST['occupation']
    income = 0.0 if request.POST['income'] == '' else float(request.POST['income'])
    special_skills = request.POST['special_skills']
    try:
      u = People.objects.get(user_id=user_id)
      u.name = name
      u.gender = gender
      u.age = age
      u.phone = phone
      u.email = email
      u.address = address
      u.province = province
      u.postal_code = postal_code
      u.education = education
      u.occupation = occupation
      u.income = income
      u.special_skills = special_skills
    except ObjectDoesNotExist:
      u = People(user_id=user_id, user_type='USER', name=name, gender=gender, age=age, phone=phone, \
                 email=email, address=address, province=province, postal_code=postal_code, \
                 education=education, occupation=occupation, income=income, special_skills=special_skills)
    u.save()
    animals = request.POST.getlist('adoptions')
    now = datetime.datetime.now()
    success = False
    msg = ''
    for a in animals:
      animal = Animal.objects.get(animal_id=a)
      if len(Adoption.objects.filter(animal=animal, accepted=True)) == 0:
        Adoption(application_date=now, adopter=u, animal=animal).save()
        success = True
        msg += '%s\n' % str(animal)
    context['status'] = 'Adoption(s) requested: \n' + msg if success else 'Fail'
  return render(request, 'PetShelter/applications/adopt.html', getBaseContext(request, context))
# def app_adopt(request)

# url(r'^applications/surrender/$', views.app_surrender, name='app_surrender'),
def app_surrender(request):
  context = {
    'animal': Animal.objects.all()[0],
    'people': People.objects.all()[0],
    'form': UploadFileForm,
  } # context = {...}
  msg = ''
  if request.method == 'POST':
    if len(request.FILES.keys()) != 0:
      form = UploadFileForm(request.POST, request.FILES)
      if form.is_valid():
        handle_uploaded_file(request.FILES['file'], str(datetime.datetime.now()))
        return redirect('app_surrender')
      # if form.is_valid()
    # if len(request.FILES.keys()) != 0
  # if request.method == 'POST'
  success = True
  context['status'] = 'Adoption(s) requested: \n' + msg if success else 'Fail'
  return render(request, 'PetShelter/applications/surrender.html', getBaseContext(request, context))
# def app_surrender(request)

# url(r'^applications/donate/$', views.app_donates, name='app_donates'),
def app_donates(request):
  animals = Animal.objects.filter(stage=True)
  files = []
  for a in animals:
    files.append(AnimalFile.objects.filter(animal=a, file_type='PHOTO')[0])
  context = {
    'animals': animals,
    'files': files,
    'people': People.objects.all()[0],
  } # context = {...}
  return render(request, 'PetShelter/applications/donates.html', getBaseContext(request, context))
# def app_donates(request)

# url(r'^applications/donate/(?P<donate_type>[^\s/]+)/$', views.app_donate, name='app_donate'),
def app_donate(request, donate_type):
  animals = Animal.objects.filter(stage=True)
  files = []
  for a in animals:
    files.append(AnimalFile.objects.filter(animal=a, file_type='PHOTO')[0])
  context = {
    'animals': animals,
    'files': files,
    'people': People.objects.all()[0],
    'donate_type': donate_type.lower(),
  } # context = {...}
  return render(request, 'PetShelter/applications/donate.html', getBaseContext(request, context))
# def app_donate(request)

# url(r'^applications/volunteer/$', views.app_volunteer, name='app_volunteer'),
def app_volunteer(request):
  context = {
    'shelters': Shelter.objects.all(),
    'people': People.objects.all()[0],
  } # context = {...}
  return render(request, 'PetShelter/applications/volunteer.html', getBaseContext(request, context))
# def app_volunteer(request)

