class nginx::params {
case $operatingsystem {
  'RedHat', 'CentOS': { 
    $doc_root = '/var/www/'
    $user = 'nginx'
    $log_dir = '/var/log/nginx/'
    $pid_dir = '/var/log/nginx/'
    $conf_dir = '/etc/nginx/'
    $server_dir = '/etc/nginx/conf.d/'
  } # apply the redhat vars
  /^(Debian|Ubuntu)$/:{
    $doc_root = '/var/www/'
    $user = 'nginx'
    $log_dir = '/var/log/nginx/'
    $pid_dir = '/var/log/nginx/'
    $conf_dir = '/etc/nginx/'
    $server_dir = '/etc/nginx/conf.d/'
  } # apply the debian vars
  'Windows':          {
    $doc_root = '/var/www/'
    $user = 'nginx'
    $log_dir = '/var/log/nginx/'
    $pid_dir = '/var/log/nginx/'
    $conf_dir = '/etc/nginx/'
    $server_dir = '/etc/nginx/conf.d/'
  } # apply the windows vars
  default:            { fail("cannot process ERB variables for ${operatingsystem}")  } #fail otherwise
}
}
