---
layout: page
title: Process Tracking
nav_order: 3
---

<!-- sort projects by descending "retirement_date" -->
{%- assign projects_by_date = site.data.project_array | sort: "retirement_date" | reverse %}
{%- assign list_date_fmt = "%b %Y" %}

<div class="section-content">
<p>Useful links:
    <ul>
    <li><a href="https://www.apache.org/foundation/board/calendar.html">Board Minutes Calendar</a> to find "Terminate" resolutions</li>
    <li><a href="https://projects.apache.org/">Projects Directory</a> to check</li>
    <li><a href="https://issues.apache.org/jira/issues/?jql=status%20in%20(Open%2C%20%22In%20Progress%22%2C%20Reopened)%20AND%20labels%20%3D%20retire-project">Open Jira issues</a></li>
    <li><a href="{% link process.md %}">Retirement Process Documentation</a></li>
    </ul>
  </p>
</div>

<div class="section-content">
<p>
  <table>
    <tr><th>Retirement<br />Date</th><th>Attic Move<br />Completed</th><th>Project</th><th>Attic<br />Tracking</th></tr>
    {%- for project in projects_by_date %}
    <tr>
      <td>{{ project.retirement_date | date: list_date_fmt }}</td>
      <td>{{ project.attic_date | date: list_date_fmt }}</td>
      <td><a href="{% link projects/{{ project.project_id }}.html %}">Apache {{ project.project_name }}</a></td>
      <td>
      {%- if project.attic_issue -%}
        <a href="https://issues.apache.org/jira/browse/{{ project.attic_issue }}">{{ project.attic_issue }}</a>
      {%- else -%}
        -
      {%- endif -%}
      </td>
    </tr>
    {% endfor %}
  </table>
</p>
</div>


