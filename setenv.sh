apache_tomcat 'tomcat' do
  apache_tomcat_instance 'instance1' do
    setenv_options do
      config(
        [
          'export CATALINA_OPTS="',
          '-XX:+UseTLAB -XX:+CMSClassUnloadingEnabled -Xss256k -XX:+UseParNewGC',
          '-XX:+UseConcMarkSweepGC -XX:CMSInitiatingOccupancyFraction=75',
          '-XX:+UseCMSInitiatingOccupancyOnly',
          '-server"'
        ]
      )
    end

    # ... apache_tomcat_service resource
  end
end
