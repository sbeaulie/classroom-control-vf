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
    $user = 'www-data'
    $log_dir = '/var/log/nginx/'
    $pid_dir = '/var/log/nginx/'
    $conf_dir = '/etc/nginx/'
    $server_dir = '/etc/nginx/conf.d/'
  } # apply the debian vars
  'Windows':          {
    $doc_root = 'C:/ProgramData/nginx/html/'
    $user = 'nobody'
    $log_dir = 'C:/ProgramData/nginx/logs/'
    $pid_dir = 'C:/ProgramData/nginx/logs/'
    $conf_dir = 'C:/ProgramData/nginx/'
    $server_dir = 'C:/ProgramData/nginx/conf.d/'
  } # apply the windows vars
  default:            { fail("cannot process ERB variables for ${operatingsystem}")  } #fail otherwise
}
}
