require 'fileutils'

desc "copy the template to a new solution"
task :new, [:target] do |t, args|
  root = File.expand_path(__FILE__ + "/..")

  template_path = "#{root}/.template"
  target_path = "#{root}/#{args[:target]}"

  FileUtils.cp_r template_path, target_path
  FileUtils.cd target_path
end
