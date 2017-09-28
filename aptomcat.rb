dest_dir = "#{node['piston']['global_download_dir']}\\#{node['piston']['tomcat_download_dir']}"
 
directory dest_dir do
    recursive true
end
 
dest_filename = "apache-tomcat-#{node['piston']['tomcat_version']}-windows-x64.zip"
dest_filepath = dest_dir + "\\" + dest_filename
 
remote_file dest_filepath do
  source "#{node['piston']['global_apache_mirror']}//tomcat/tomcat-8/v#{node['piston']['tomcat_version']}/bin/" + dest_filename
  not_if { ::File.file?(dest_filepath) }
end
 
piston_zip "#{node['piston']['tomcat_install_dir']}" do
  source dest_filepath
  action :unzip
  startLevel 1
  not_if { ::File.directory?("#{node['piston']['tomcat_install_dir']}") }
end
