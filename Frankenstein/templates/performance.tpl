{% load staticfiles %}
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta name='robots' content='noindex, nofollow'>
        <meta http-equiv='content-type' content='text/html; charset=ISO-8859-1'>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="{% static "css/bootstrap.min.css" %}" rel="stylesheet">
        <link href="{% static "css/bootstrap-theme.min.css" %}" rel="stylesheet">
        <link href="{% static "css/bootstrap-datetimepicker.min.css" %}" rel="stylesheet">
        <link href="{% static "css/custom.css" %}" rel="stylesheet">
        <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
        <script type="text/javascript" src="{% static "js/bootstrap.min.js" %}"></script>
        <script type="text/javascript" src="{% static "js/moment.min.js" %}"></script>
        <script type="text/javascript" src="{% static "js/bootstrap-datetimepicker.min.js" %}"></script>
        <style>
          th,td {
            padding: 5px;
          }
        </style>
        <title>Lafayette College Presents</title>
    </head>
    <body>
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <h1>{{ perftimes_results.perf_id.title}}</h1>
                    <h3>{{ perftimes_results.perfdate}} at {{ perftimes_results.perftime}} at {{ perftimes_results.stage_id.stage}}</h3>
                    <p>{{ perftimes_results.perf_id.description}}</p>
                </div>
                <div class="col-md-6">
                    <h3>Cast</h3>
                    <table>
                        <tr>
                            <th>Name</th>
                            <th>Character</th>
                        </tr>
                        {% for result in actor_results %}
                        <tr>
                            <td><a href='/person/{{ result.person_id.id }}'>{{ result.person_id.name}}</a></td>
                            <td>{{ result.character}}</td>
                        </tr>
                        {% endfor %}
                    </table>
                </div>
                <div class="col-md-6">
                    <h3>Crew</h3>
                    <table>
                        <tr>
                            <th>Name</th>
                            <th>Position</th>
                        </tr>
                        {% for result in prodcrew_results %}
                        <tr>
                            <td><a href='/person/{{ result.person_id.id }}'>{{ result.person_id.name}}</a></td>
                            <td>{{ result.position}}</td>
                        </tr>
                        {% endfor %}
                    </table>
                </div>
                <div class="col-md-12">
                    <a class="btn btn-default" href="/">Start Over</a>
                </div>
            </div>
        </div>
    </body>
</html>
