from django.db import models

# Create your models here.
class Venues(models.Model):
    id = models.AutoField(primary_key=True)
    building_name = models.CharField(max_length=50)
    stage_name = models.CharField(max_length=75)
    info = models.TextField()

    def __dir__(self):
        return [id, stage, description]

    def __unicode__(self):
        return self.stage

class Performances(models.Model):
    id = models.AutoField(primary_key=True)
    title = models.CharField(max_length=255)
    description = models.TextField()
    def __unicode__(self):
        return self.title

class PerfTimes(models.Model):
    id = models.AutoField(primary_key=True)
    perf = models.ForeignKey('Performances')
    venue = models.ForeignKey('Venues')
    perfdate = models.DateField()
    perftime = models.TimeField()

    def __unicode__(self):
        return self.id

class Personnel(models.Model):
    id = models.AutoField(primary_key=True)
    name = models.CharField(max_length=200)
    bio = models.TextField()
    role = models.CharField(max_length=200)
    image_URL = models.CharField(max_length=200)
    perft = models.ForeignKey('PerfTimes')
    def __unicode__(self):
        return self.name

#class Actors(models.Model):
#    perft_id = models.ForeignKey('PerfTimes')
#    person_id = models.ForeignKey('Persons')
#    character = models.CharField(max_length=200)

#    def __unicode__(self):
#        return self.character

#class ProdCrew(models.Model):
#    perft_id = models.ForeignKey('PerfTimes')
#    person_id = models.ForeignKey('Persons')
#    position = models.CharField(max_length=200)

#    def __unicode__(self):
#        return self.position

from django import forms

class SearchForm(forms.Form):
    stage = forms.CharField(max_length=50, required=False)
    performance = forms.CharField(max_length=255, required=False)
    person = forms.CharField(max_length=200, required=False)
    datepick = forms.DateField(required=False)
