#user nginx;

worker_process 4;

events {
  worker_connections 1024;
}

http {
  include mime.types;

  default_type application/octet-stream;

  client_header_timeout  3m;
  client_body_timeout    3m;
  send_timeout           3m;

  client_header_buffer_size    1k;
  large_client_header_buffers  4 4k;

  gzip on;
  gzip_min_length  1100;
  gzip_buffers     4 8k;
  gzip_types       text/plain;

  output_buffers   1 32k;
  postpone_output  1460;

  sendfile         on;
  tcp_nopush       on;
  tcp_nodelay      on;
  send_lowat       12000;

  keepalive_timeout  75 20;

  include conf.d/*.conf;
}
