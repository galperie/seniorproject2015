import datetime
from django.shortcuts import render
from django.http import HttpResponseRedirect
from django.contrib import messages
from django.db.models import Q
from models import *

# Create your views here.
def home(request):
    title = request.method
    stage = ''
    performance = ''
    person = ''
    results = ''
    datetoday = datetime.date.today()
    #datestr = datetoday.strftime("%m/%d/%Y")
    datestr = ''
    form = None

    if request.method == 'POST':
        form = SearchForm(request.POST)
        if form.is_valid():
            stage = form.cleaned_data['stage']
            performance = form.cleaned_data['performance']
            person = form.cleaned_data['person']
            datepick = form.cleaned_data['datepick']

            results = PerfTimes.objects.all()

            if stage != '':
                results = results.filter(stage_id__stage__icontains=stage)
            if performance != '':
                results = results.filter(perf_id__title__icontains=performance)
            if person != '':
                results = results.filter(Q(prodcrew__position__icontains=person) | Q(actors__character__icontains=person) | Q(actors__person_id__name__icontains=person) | Q(prodcrew__person_id__name__icontains=person)).distinct()
            if datepick != None:
                results = results.filter(perfdate=datepick)
                datestr = datepick.strftime("%m/%d/%Y")


        else:
            results = Stages.objects.all()

        results = results.order_by('perfdate', 'perftime')

    else:
        title = 'OUTER'

    return render(request, 'home.tpl', {'form': form, 'title': title, 'results': results, 'stage': stage, 'performance': performance, 'person': person, 'datestr': datestr})

def person(request, person_id = None):
    results = Persons.objects.all()

    if (person_id != None):
        results = Persons.objects.get(id=person_id)

    return render(request, 'person.tpl', {'result': results})

def stage(request, stage_id = None):
    results = ''

    if (stage_id != None):
        results = PerfTimes.objects.filter(stage_id=stage_id)
    else:
        results = PerfTimes.objects.all()

    results = results.order_by('perfdate', 'perftime')

    return render(request, 'stage.tpl', {'results': results})

def performance(request, perf_id = None):
    actor_results = Actors.objects.all()
    prodcrew_results = ProdCrew.objects.all()
    perftimes_results = PerfTimes.objects.all()

    if (perf_id != None):
        actor_results = Actors.objects.filter(perft_id=perf_id)
        prodcrew_results = ProdCrew.objects.filter(perft_id=perf_id)
        perftimes_results = PerfTimes.objects.get(id=perf_id)

    actor_results = actor_results.order_by('person_id__name')
    prodcrew_results = prodcrew_results.order_by('person_id__name')

    return render(request, 'performance.tpl', {'actor_results':actor_results, 'prodcrew_results':prodcrew_results, 'perftimes_results':perftimes_results})
