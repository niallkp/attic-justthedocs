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
# Performs any extra setup - e.g. downloading data files
#

module Setup
  require 'uri'
  require 'net/http'
  REPOS = 'https://gitbox.apache.org/repositories.json'
  DATA_FILE = '_data/git-repositories.json'
  AGE = 3600 # seconds => 1 hour
  Jekyll::Hooks.register :site, :after_init do |site, payload|
    begin
      mtime = File.mtime(DATA_FILE)
    rescue Errno::ENOENT
      mtime = Time.gm(0)
    end
    if Time.now - mtime > AGE
      puts "Setup: #{DATA_FILE} is old or missing"
      uri = URI.parse(REPOS)
      response = Net::HTTP.get_response uri
      File.write(DATA_FILE, response.body)
    else
      puts "Setup: #{DATA_FILE} is recent"
    end
  end
end