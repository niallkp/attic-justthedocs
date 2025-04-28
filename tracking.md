---
layout: page
title: Process Tracking
nav_order: 3
---

{%- assign projects_by_date = site.data.project_array | sort: "retirement_date" | reverse %}
{%- assign list_date_fmt = "%b %Y" %}

# The Apache Attic Process Tracking
***

**Useful links:**

  - [Board Minutes Calendar](https://www.apache.org/foundation/board/calendar.html) to find "Terminate" resolutions
  - [Projects Directory](https://projects.apache.org/) to check
  - [Open Jira issues](https://issues.apache.org/jira/issues/?jql=status%20in%20(Open%2C%20%22In%20Progress%22%2C%20Reopened)%20AND%20labels%20%3D%20retire-project)
  - [Retirement Process Documentation]({% link process.md %})

***

|Retirement Month|Completed|Project|Tracking|
|:-------------|:-------------|:-------------|:-------------|
{%- for project in projects_by_date -%}
{%- assign retire_date = project.retirement_date  | date: list_date_fmt -%}
{%- assign attic_date = project.attic_date | date: list_date_fmt -%}
{% assign proj_link = project.project_id | prepend: "projects/" | append: ".html" %}
|{{ retire_date }}|{{ attic_date }}|[{{ project.project_apachename }}]({%- link {{proj_link}} -%})|[{{ project.attic_issue }}]({{ project.attic_issue_link }})|
{%- endfor -%}


