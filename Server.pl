use strict;
use CGI ':standard';
use Socket;

my $server = shift || "localhost";
my $port = shift || 8080;
my $proto = getprotobyname('tcp');
socket(SOCKET, PF_INET, SOCK_STREAM, $proto) or die "Can't open socket $!\n";
setsockopt(SOCKET, SOL_SOCKET, SO_REUSEADDR, 1) or die "Can't set socket option to SO_REUSEADDR $!\n";
bind( SOCKET, pack_sockaddr_in($port, inet_aton($server))) or die "Can't bind to port $port! \n";
listen(SOCKET, 5) or die "listen: $!";
print "> Server started on port $port\n";
accept(SOCKET_CLIENT_NEW, SOCKET);
print SOCKET_CLIENT_NEW "HTTP/1.1 200 OK\n";
print SOCKET_CLIENT_NEW "Server: MiServer/1.2.3\r\n";
print SOCKET_CLIENT_NEW "Date: Wed, 20 Dec 1989 7:07:01 GMT\r\n";
print SOCKET_CLIENT_NEW "Content-Type: text/html\r\n";
print SOCKET_CLIENT_NEW "Connection: keep-alive\r\n";
print SOCKET_CLIENT_NEW "Content-Length: 30\r\n";
print SOCKET_CLIENT_NEW "\r\n";
my $filename = 'index.html';
open(my $fh,'<',$filename);
while (my $line = <$fh>){
    print SOCKET_CLIENT_NEW "$line\r\n ";
}

close SOCKET_CLIENT_NEW or die "close: $!";
close SOCKET_CLIENT_NEW;
print "> Connection close\n"