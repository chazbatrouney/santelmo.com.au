require 'fileutils'

OUTPUT_DIR = File.join(::Rails.root, 'output')
RAILS_SERVER = 'http://santelmo.dev'

namespace :deploy do
  desc 'Cache a copy of the rails project into the output directory' 
  task :prepare do
    FileUtils.rm_rf(OUTPUT_DIR)
    Dir.mkdir(OUTPUT_DIR)
    Dir.chdir(OUTPUT_DIR) do
      `wget -m -nH #{RAILS_SERVER}`
    end
    
    # allow us to default to text/html
    File.open("#{OUTPUT_DIR}/.htaccess", 'w') do |file|
      file << "DefaultType text/html \n"
    end
    
    # TODO -- sync stuff like 400.html across from public/?
  end
end