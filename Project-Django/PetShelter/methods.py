import os
from django.conf import settings
from PetShelter.models import People, Shelter, ShelterStaff, Animal, AnimalFile,\
                              Receipt, Adoption, Surrender, Donation

def getBaseContext(request, context):
  if request.user.is_authenticated():
    context['authenticated'] = request.user.username
  species = Animal.objects.values('species')
  result = []
  for s in species:
    result.append(str(s['species']))
  # for s in species
  context['species'] = list(set(result))
  return context
# def getBaseContext(request, context)

def handle_uploaded_file(file, name):
  destination = open(os.path.join(settings.BASE_DIR, 'PetShelter/static/PetShelter/AnimalFiles', name), 'wb+')
  os.path.dirname(os.path.dirname(__file__))
  for chunk in file.chunks():
    destination.write(chunk)
  destination.close()
# def handle_uploaded_file(file, name)

