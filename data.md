---
layout: page
title: Project Data
parent: Process
nav_order: 2
nav_exclude: false
---
{%- comment -%}
Licensed to the Apache Software Foundation (ASF) under one or more
contributor license agreements.  See the NOTICE file distributed with
this work for additional information regarding copyright ownership.
The ASF licenses this file to you under the Apache License, Version 2.0
(the "License"); you may not use this file except in compliance with
the License.  You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
{% endcomment %}

# Project Data YAML Files
***

The [Project Pages]({% link projects.md %}) on this website are all generated from 
[YAML project data files]({{site.repo}}/blob/main/_data/projects/).
This page describe the contents of those files and what each attribute is used for.

See the [Any23 Example below](#example-yaml-file) for an idea of what these files look like.

### YAML File Attributes

|Attribute|Required?|Format/Values|Description|
|:--------|:--------|:------------|:----------|
|project_id|**GENERATED**| - |Generated from the YAML file name, without the `.yaml` suffix |
|retirement_date|Required|yyyy-mm-dd|Date the project retired (date of board meeting)|
|attic_issue|Optional|ATTIC-nnn|The [Attic JIRA](https://issues.apache.org/jira/projects/ATTIC/) ID managing the projects retirement|
|attic_date|Optional|yyyy-mm-dd|Date the move to the Attic was completed|
|attic_banner|Optional|true/false|Cause the ***Attic Banner*** to be displayed on the project's website (normally true)|
|project_name|Optional|text|defaults to the `${project_id}` (capitialized)|
|project_longname|Optional|text| defaults to the `${project_name}`|
|project_domain|Optional|domain name|defaults to `${project_id}.apache.org`|
|project_description|Required|text|Description of the project|
|project_shortdesc|Optional|text|defaults either to the `description` in the `retired_projects.json` file or the first sentence of the `${project_description}`|
|additional_text|Optional|text|Additional Text displayed on the project page below the project description|
|board_resolution|Required|true/false|If true, used to link to board minutes in combination with the `${retirement_date}`|
|board_reports|Required|true/false|Cause a link to the project's Board Reports be shown on the project's page|
|downloads|Required|true/false|Cause a link to the archive donwload's page for the project to be shown on the project page|
|archive_path|Optional|path|Path to the project's download area. Defaults to the `${project_id}|
|source_repositories|Optional|Array|An array of the project's sopurce respository types|
|source_repositories: type|Required|Git,Subversion|Type of Source Respository|
|source_repositories: path|Optional|path|Alternative respoitory path. Defaults to `${project_id}`|
|mailing_lists|Optional|Array|List of the project's public mailing lists (e.g. dev, user etc)|
|mailing_lists_prefix|Optional| |mbox_prefix if required (usually for Subprojects)|
|issue_tracker|Optional|Map|Details of the project's Issue tracker(s)|
|issue_tracker: type|Required|JIRA, Bugzilla|Type of Issue Tracker|
|issue_tracker: keys|Optional|Array|List of Issue Tracker Key(s). Defaults to `${project_id}`|
|wiki|Optional|Map|Details of the project's Issue tracker(s)|
|wiki: type|Required|CWIKI|Type of Wiki. CWIKI causes the ***Attic Banner** to displayed on the CWIKI spaces|
|wiki: keys|Optional|Array|List of Wiki Key(s). Defaults to `${project_id}`|
|related_projects_text|Optional|text|Text displayed before the list of related projects (if any)|
|related_projects|Optional|Array of Maps|Details of Related Projects|
|related_projects: name|Optional|text|Name of the related project|
|related_projects: url|Optional|url|URL of the related project|
|related_projects: description|Required|text|Description of the related project|

### Example YAML File
Below is an example, of a [YAML file for Any23]({{site.repo}}/blob/main/_data/projects/any23.yaml)
which generates the [Any23 Project Page]({% link projects/any23.html %}).

```yaml
retirement_date: 2023-06-21
attic_issue: ATTIC-215
attic_date: 2023-10-01
attic_banner: true 
project_description: >-
    The mission of Apache Any23 (Anything to Triples) was the creation and
    maintenance of software related to automatic crawling, parsing, analyzing,
    producing, validating and converting RDF (Resource Description Framework) data.
board_resolution: true
board_reports: true
downloads: true
source_repositories:
    - type: Git
mailing_lists:
    - dev
    - commits
    - user
issue_tracker:
    type: JIRA
wiki:
    type: CWIKI
```

