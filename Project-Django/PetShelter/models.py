from django.db import models

USER_TYPES = (
  ('MEMBER', 'Member'),
  ('VOLUNTEER', 'Volunteer'),
  ('USER', 'User'),
) # USER_TYPES

GENDERS = (
  ('MALE', 'Male'),
  ('FEMALE', 'Female'),
) # GENDERS

SHELTER_TYPE = (
  ('SHELTER', 'Shelter'),
  ('VET', 'Vet'),
) # SHELTER_TYPE

STAFF_TYPES = (
  ('MEMBER', 'Member'),
  ('VOLUNTEER', 'Volunteer'),
) # STAFF_TYPES

FILE_TYPES = (
  ('PHOTO', 'Photo'),
  ('VIDEO', 'Video'),
  ('AUDIO', 'Audio'),
) # FILE_TYPES

DONATION_TYPES = (
  ('MONEY', 'Money'),
  ('VETCARE', 'Vet care'),
  ('ITEM', 'Item'),
) # DONATION_TYPES

class People(models.Model):
  user_id = models.CharField(primary_key=True, max_length=20)
  user_type = models.CharField(max_length=11, choices=USER_TYPES)
  name = models.CharField(max_length=50)
  gender = models.CharField(max_length=6, choices=GENDERS)
  age = models.IntegerField()
  phone = models.CharField(max_length=15)
  email = models.EmailField()
  address = models.CharField(max_length=100)
  city = models.CharField(max_length=20)
  province = models.CharField(max_length=15)
  postal_code = models.CharField(max_length=6)
  education = models.CharField(max_length=20)
  occupation = models.CharField(max_length=20, blank=True)
  income = models.DecimalField(max_digits=12, decimal_places=2, blank=True, null=True)
  special_skills = models.CharField(max_length=50, blank=True)

  def get_fields(self):
    lst = []
    for field in self._meta.fields:
     lst.append((field, field.value_to_string(self)))
    return lst
  # def get_fields(self)

  def __unicode__(self):
    return self.name + ' (' + self.user_id + ')'
  # def __unicode__(self):
# class People(models.Model)

class Shelter(models.Model):
  shelter_id = models.AutoField(primary_key=True)
  name = models.CharField(max_length=50)
  shelter_type = models.CharField(max_length=8, choices=SHELTER_TYPE)
  address = models.CharField(max_length=100)
  city = models.CharField(max_length=20)
  province = models.CharField(max_length=15)
  postal_code = models.CharField(max_length=6)
  phone = models.CharField(max_length=15)
  email = models.EmailField()
  open_hour = models.TextField()

  def get_fields(self):
    lst = []
    for field in self._meta.fields:
     lst.append((field, field.value_to_string(self)))
    return lst
  # def get_fields(self)

  def __unicode__(self):
    return self.name
  # def __unicode__(self)
# class Shelter(models.Model)

class ShelterStaff(models.Model):
  staff = models.ForeignKey(People, primary_key=True)
  staff_type = models.CharField(max_length=11, choices=STAFF_TYPES)
  shelter = models.ForeignKey(Shelter)
  start_date = models.DateField(null=True)		# NULL means it's an volunteer's application and not replied
  accepted = models.BooleanField(default=False)	# Values for members are always True

  def get_fields(self):
    lst = []
    for field in self._meta.fields:
      if field.name == 'shelter':
        if self.shelter != None:
          lst.append((field, [self.shelter.shelter_id, self.shelter.name]))
        else:
          lst.append((field, []))
      else:
       lst.append((field, field.value_to_string(self)))
    return lst
  # def get_fields(self)

  def __unicode__(self):
    return str(self.shelter) + ' - ' + str(self.staff)
  # def __unicode__(self)
# class ShelterStaff(models.Model)

class Animal(models.Model):
  animal_id = models.CharField(primary_key=True, max_length=10)
  name = models.CharField(max_length=50)
  species = models.CharField(max_length=10)
  breed = models.CharField(max_length=50)
  birthday = models.DateField(null=True, blank=True)
  deathday = models.DateField(null=True, blank=True)
  gender = models.CharField(max_length=6, choices=GENDERS)
  size = models.CharField(max_length=10)
  color = models.CharField(max_length=10)
  spayed_or_neutered = models.BooleanField(default=True)
  adopted_price = models.DecimalField(max_digits=7, decimal_places=2)
  stage = models.BooleanField(default=True)
  shelter = models.ForeignKey(Shelter, default=None, null=True, blank=True)

  def get_fields(self):
    lst = []
    for field in self._meta.fields:
      if field.name == 'shelter':
        if self.shelter != None:
          lst.append((field, [self.shelter.shelter_id, self.shelter.name]))
        else:
          lst.append((field, []))
      else:
       lst.append((field, field.value_to_string(self)))
    return lst
  # def get_fields(self)

  def __unicode__(self):
    return self.name + '(' + self.species + ')'
  # def __unicode__(self)
# class Animal(models.Model)

class AnimalFile(models.Model):
  animal = models.ForeignKey(Animal)
  file_type = models.CharField(max_length=5, choices=FILE_TYPES)
  path = models.FilePathField()

  def __unicode__(self):
    return str(self.animal) + '\'' + self.file_type + ': "' + self.path + '"'
  # def __unicode__(self)
# class AnimalFile(models.Model)

class Receipt(models.Model):
  receiver = models.ForeignKey(People)
  animal = models.ForeignKey(Animal, unique=True)
  received_date = models.DateField();

  def get_fields(self):
    lst = []
    for field in self._meta.fields:
      if field.name == 'receiver':
        lst.append((field, [self.receiver.user_id, self.receiver.name]))
      elif field.name == 'animal':
        lst.append((field, [self.animal.species, self.animal.animal_id, self.animal.name]))
      else:
       lst.append((field, field.value_to_string(self)))
    return lst
  # def get_fields(self)

  def __unicode__(self):
    return str(self.receiver) + ' received ' + str(self.animal)
  # def __unicode__(self)
# class Receipt(models.Model)

class Adoption(models.Model):
  application_date = models.DateField()
  adopter = models.ForeignKey(People)
  animal = models.ForeignKey(Animal)
  adoption_date = models.DateField(null=True)	# NULL means not responded to the application
  accepted = models.BooleanField(default=False)

  def get_fields(self):
    lst = []
    for field in self._meta.fields:
      if field.name == 'adopter':
        lst.append((field, [self.adopter.user_id, self.adopter.name]))
      elif field.name == 'animal':
        lst.append((field, [self.animal.species, self.animal.animal_id, self.animal.name]))
      else:
       lst.append((field, field.value_to_string(self)))
    return lst
  # def get_fields(self)

  def __unicode__(self):
    if self.accepted:
      return str(self.adopter) + ' adopted ' + str(self.animal)
    else:
      return str(self.adopter) + ' adopts ' + str(self.animal)
  # def __unicode__(self)
# class Adoption(models.Model)

class Surrender(models.Model):
  application_date = models.DateField()
  surrenderer = models.ForeignKey(People)
  animal = models.ForeignKey(Animal)
  surrender_date = models.DateField(null=True)	# NULL means not responded to the application
  accepted = models.BooleanField(default=False)
  reason = models.TextField()

  def get_fields(self):
    lst = []
    for field in self._meta.fields:
      if field.name == 'surrenderer':
        lst.append((field, [self.surrenderer.user_id, self.surrenderer.name]))
      elif field.name == 'animal':
        lst.append((field, [self.animal.species, self.animal.animal_id, self.animal.name]))
      else:
       lst.append((field, field.value_to_string(self)))
    return lst
  # def get_fields(self)

  def __unicode__(self):
    if self.accepted:
      return str(self.surrenderer) + ' surrenderered ' + str(self.animal)
    else:
      return str(self.surrenderer) + ' surrenderers ' + str(self.animal)
  # def __unicode__(self)
# class Surrender(models.Model)

class Donation(models.Model):
  application_date = models.DateField()
  donator = models.ForeignKey(People)
  donation_type = models.CharField(max_length=7, choices=DONATION_TYPES)
  content = models.TextField()
  animal = models.ForeignKey(Animal, default=None, null=True, blank=True)
  accepted_date = models.DateField(null=True)		# NULL means not responded to the application
  accepted = models.BooleanField(default=False)

  def get_fields(self):
    lst = []
    for field in self._meta.fields:
      if field.name == 'donator':
        lst.append((field, [self.donator.user_id, self.donator.name]))
      elif field.name == 'animal':
        if self.animal != None:
          lst.append((field, [self.animal.species, self.animal.animal_id, self.animal.name]))
        else:
          lst.append((field, []))
      else:
       lst.append((field, field.value_to_string(self)))
    return lst
  # def get_fields(self)

  def __unicode__(self):
    if self.accepted:
      return str(self.donator) + ' donated (' + self.donation_type + '): "' + self.content + '"'
    else:
      return str(self.donator) + ' donats (' + self.donation_type + '): "' + self.content + '"'
  # def __unicode__(self)
# class Donation(models.Model)

