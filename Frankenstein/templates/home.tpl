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
                <div class="col-md-6">
                    <h1>Search</h1>
                    <form id="fm1" role="form" action="/" method="post">
                        <div class="input-group">
                            <span class="input-group-addon"><span class="glyphicon glyphicon-tower"></span></span>
                            <input type="text" class="form-control" value="{{ stage }}" id="stage" name="stage" tabindex="1" placeholder="Stage Name" htmlEscape="true" autofocus />
                        </div>
                        <div class="input-group">
                            <span class="input-group-addon"><span class="glyphicon glyphicon-picture"></span></span>
                            <input type="text" class="form-control" value="{{ performance }}" id="performance" name="performance" tabindex="2" placeholder="Performance Name" autocomplete="off"/>
                        </div>
                        <div class="input-group">
                            <span class="input-group-addon"><span class="glyphicon glyphicon-user"></span></span>
                            <input type="text" class="form-control" value="{{ person }}" id="person" name="person" tabindex="3" placeholder="Actor / Character / Position" />
                        </div>
                        <div class="input-group bootstrap-timepicker">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                            <input type="text" class="form-control" value="{{ datestr }}" id="datepicker1" name="datepick" tabindex="4" placeholder="Select Date" readonly="true" />
                        </div>
                        <script type="text/javascript">
                            $(function() {
                                $('#datepicker1').datetimepicker({
                                    language: 'en-US',
                                    pickTime: false
                                });
                            });
                        </script>
                        <button type="submit" class="btn btn-default btn-lg btn-block" name="submit"  tabindex="5">Search</button>
                        {% if form.is_bound %}
                          <a href="/" class="btn btn-default btn-lg btn-block" name="clear" tabindex="6">Start Over</a>
                        {% endif %}
                    </form>
                    {% if form.errors %}
                        {% for field in form %}
                            {% for error in field.errors %}
                                <div class="alert alert-error">
                                    <strong>{{ error|escape }}</strong>
                                </div>
                            {% endfor %}
                        {% endfor %}
                        {% for error in form.non_field_errors %}
                            <div class="alert alert-error">
                                <strong>{{ error|escape }}</strong>
                            </div>
                        {% endfor %}
                    {% endif %}
                </div>
                <div class="col-md-6">
                    {% if form.is_bound %}
                      <h1>Results</h1>
                      <table>
                        <tr>
                          <th>Stage</th>
                          <th>Performance</th>
                          <th>Date</th>
                          <th>Time</th>
                        </tr>
                        {% for result in results %}
                        <tr>
                          <td><a href='/stage/{{ result.stage_id.id }}'>{{ result.stage_id.stage }}</a></td>
                          <td><a href='/performance/{{ result.id }}'>{{ result.perf_id.title}}</a></td>
                          <td>{{ result.perfdate}}</td>
                          <td>{{ result.perftime}}</td>
                        </tr>
                        {% endfor %}
                      </table>
                    {% endif %}
                </div>
            </div>
        </div>
    </body>
</html>
