# Sky is the limit, let's bring that limit higher
exec { 'delte line with pattern':
  path    => '/usr/bin:/usr/sbin:/bin',
  command => "sed -i '/ULIMIT=/d' /etc/default/nginx",
}
exec { 'config the limit in nginx':
  path    => '/bin/echo:/usr/sbin:/bin',
  command => "echo \"ULIMIT=\"-n 15000\"\" >> /etc/default/nginx",
}
exec { 'restart service':
  command  => 'sudo service nginx restart',
  provider => shell,
}
