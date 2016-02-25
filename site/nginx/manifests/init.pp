class nginx (
$root = '/var/www/'
) inherits nginx::params{

package { $ng_package:
  ensure => present,
}

service { 'nginx':
  ensure => running,
  enable => true,
}

if $root {
 $document_root = $root
 } else {
  $document_root = $doc_root
 }

File{
 owner => $ng_owner,
 group => $ng_group,
 mode => '0644'
}

file { $document_root :
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


file { "${$document_root}index.html": 
  ensure  => file,
  source  => 'puppet:///modules/nginx/index.html',
  require => Package['nginx'],
}
}
