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
                    <h1>{{ results.0.stage_id.stage }}</h1>
                    <p>{{ results.0.stage_id.description }}</p>
                    <table>
                        <tr>
                            <th>Performance</th>
                            <th>Date</th>
                            <th>Time</th>
                        </tr>
                        {% for result in results %}
                        <tr>
                            <td><a href='/performance/{{ result.perf_id.id }}'>{{ result.perf_id.title}}</a></td>
                            <td>{{ result.perfdate}}</td>
                            <td>{{ result.perftime}}</td>
                        </tr>
                        {% endfor %}
                    </table>
                    <a class="btn btn-default" href="/">Start Over</a>
                </div>
            </div>
        </div>
    </body>
</html>
