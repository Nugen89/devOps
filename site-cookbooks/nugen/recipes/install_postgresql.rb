# execute "update and upgrade packages" do
#   command "apt-get -y update"
#   action :run
# end

# template '/etc/apt/sources.list.d/my_apt_sources.list' do
#   notifies :run, 'execute[apt-get update]', :immediately
# end


# node.set['postgresql']['version']             = "9.2"
# node.set['postgresql']['enable_pgdg_apt']     = true
# node.set['postgresql']['password']            = { :postgres => "iamthebest" }
# node.set['postgresql']['server']['packages']  = ["postgresql-9.2"]
# node.set['postgresql']['dir'] = "/etc/postgresql/9.2/main"
# node.set['postgresql']['config']['hba_file'] = "/etc/postgresql/9.2/main/pg_hba.conf"

# node.set['postgresql']['pg_hba'] = {:comment => '# Optional comment', :type => 'local', :db => 'all', :user => 'postgres', :addr => nil, :method => 'md5'}


# set['postgresql']['enable_pgdg_apt'] = true
# set['postgresql']['dir'] = "/etc/postgresql/9.2/main"
# set['postgresql']['config']['data_directory'] = "/var/lib/postgresql/9.2/main"
# set['postgresql']['config']['hba_file'] = "/etc/postgresql/9.2/main/pg_hba.conf"
# set['postgresql']['config']['ident_file'] = "/etc/postgresql/9.2/main/pg_ident.conf"
# set['postgresql']['config']['external_pid_file'] = "/var/run/postgresql/9.2-main.pid"
# set['postgresql']['config']['ssl_key_file']  = "/etc/ssl/private/ssl-cert-snakeoil.key"
# set['postgresql']['config']['ssl_cert_file'] = "/etc/ssl/certs/ssl-cert-snakeoil.pem"
# set['postgresql']['client']['packages']  = ["postgresql-client-9.2"]
# set['postgresql']['server']['packages']  = ["postgresql-9.2"]
# set['postgresql']['contrib']['packages'] = ["postgresql-contrib-9.2"]



include_recipe "postgresql::apt_pgdg_postgresql"
include_recipe "postgresql::server"
include_recipe "postgresql::ruby"
# include_recipe "postgresql"

include_recipe "database"
include_recipe "database::postgresql" # https://github.com/opscode-cookbooks/database


postgresql_connection_info = {
  :host     => '127.0.0.1',
  :port     => node['postgresql']['config']['port'],
  :username => 'postgres',
  :password => node['postgresql']['password']['postgres']
  # template 'DEFAULT'
  # encoding 'DEFAULT'
  # tablespace 'DEFAULT'
  # connection_limit '-1'
  # owner 'postgres'
}

postgresql_database 'teach_db_dev' do
  connection postgresql_connection_info
  action     :create
end

postgresql_database 'teach_db_test' do
  connection postgresql_connection_info
  action     :create
end

# Create a postgresql user but grant no privileges
postgresql_database_user 'nugen' do
  connection postgresql_connection_info
  password   'iamthebest'
  action     :create
end

# Grant all privileges on all tables in foo db
postgresql_database_user 'nugen' do
  connection    postgresql_connection_info
  database_name 'teach_db_dev'
  privileges    [:all]
  action        :grant
end

postgresql_database_user 'nugen' do
  connection    postgresql_connection_info
  database_name 'teach_db_test'
  privileges    [:all]
  action        :grant
end







# # create a postgresql database
# postgresql_database 'mr_softie' do
#   connection(
#     :host      => '127.0.0.1'
#     :port      => 5432,
#     :username  => 'postgres',
#     :password  => node['postgresql']['password']['postgres']
#   )
#   action :create
# end

# # create a postgresql database with additional parameters
# postgresql_database 'mr_softie' do
#   connection(
#     :host     => '127.0.0.1',
#     :port     => 5432,
#     :username => 'postgres',
#     :password => node['postgresql']['password']['postgres']
#   )
#   template 'DEFAULT'
#   encoding 'DEFAULT'
#   tablespace 'DEFAULT'
#   connection_limit '-1'
#   owner 'postgres'
#   action :create
# end
