# Licensed to the Apache Software Foundation (ASF) under one or more
# contributor license agreements.  See the NOTICE file distributed with
# this work for additional information regarding copyright ownership.
# The ASF licenses this file to You under the Apache License, Version 2.0
# (the "License"); you may not use this file except in compliance with
# the License.  You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
#--------------------------------------------------------
#
# Process each project, adding in the following attributes:
#   - project_id
#   - project_name     (if not specifically set)
#   - project_longname (if not specifically set)
#   - project_domain   (if not specifically set)
#
# This plugin is set to "highest" priority so that it runs before any other
# plugins and the projects array is therefore available to them.
#
module ProjectDataPlugin
  class ProjectDataGenerator < Jekyll::Generator
    
    priority :highest
    
    def generate(site)
      
      projects = Array.new
      
      site.data['projects'].each do | projectId, project|
        project['project_id'] = projectId
        project['project_name'] =  project.fetch("project_name", projectId.capitalize())
        project['project_longname'] = project.fetch("project_longname", project['project_name'] )
        project['project_domain'] =  project.fetch("project_domain", projectId + ".apache.org")
        projects.push(project)
      end

      site.data['project_array'] = projects
      
    end
  end
end