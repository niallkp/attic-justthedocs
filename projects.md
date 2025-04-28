---
layout: page
title: Retired Projects
has_toc: false
nav_order: 4
---

<h1>Retired Projects</h1>
***

{%- assign projects_by_date = site.data.project_array | sort_natural: "project_longname" %}
{%- assign list_date_fmt = "%b %Y" %}


|Project|Description|Retired|
|:------|:----------|:------|
{%- for project in projects_by_date -%}
{%- assign retire_date = project.retirement_date  | date: list_date_fmt -%}
{%- assign attic_date = project.attic_date | date: list_date_fmt -%}
{% assign proj_link = project.project_id | prepend: "projects/" | append: ".html" %}
|{{forloop.index}}. [{{ project.project_apachename }}]({%- link {{proj_link}} -%})|{{project.project_shortdesc}}|{{ retire_date }}|
{%- endfor -%}
