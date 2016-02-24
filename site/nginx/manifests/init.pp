class nginx inherits nginx::params{

package { $ng_package:
  ensure => present,
}

service { 'nginx':
  ensure => running,
  enable => true,
}

File{
 owner => $ng_owner,
 group => $ng_group,
 mode => '0644'
}

file { $doc_root :
ensure => directory
}

file { "${conf_dir}nginx.conf":
  ensure  => file,
  #source  => 'puppet:///modules/nginx/nginx.conf',
  content => template('nginx/nginx.conf.erb'),
  require => Package['nginx'],
}

file { "${server_dir}default.conf": 
  ensure  => file,
  #source  => 'puppet:///modules/nginx/default.conf',
  content => template('nginx/default.conf.erb'),
  require => Package['nginx'],
}


file { "${doc_root}index.html": 
  ensure  => file,
  source  => 'puppet:///modules/nginx/index.html',
  require => Package['nginx'],
}
}
