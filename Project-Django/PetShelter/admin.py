from django.contrib import admin
from PetShelter.models import People, Shelter, ShelterStaff, Animal, AnimalFile,\
                              Receipt, Adoption, Surrender, Donation

admin.site.register(People)
admin.site.register(Shelter)
admin.site.register(ShelterStaff)
admin.site.register(Animal)
admin.site.register(AnimalFile)
admin.site.register(Receipt)
admin.site.register(Adoption)
admin.site.register(Surrender)
admin.site.register(Donation)

