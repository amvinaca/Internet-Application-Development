#!/usr/bin/perl -w
use strict; 
## disables certain Perl expressions that could behave 
##unexpectedly or are difficult to debug, turning them into errors.
use warnings;
## enables the use of additional/optional warnings 
use DBI;
##The DBI is a database access module for the Perl programming language. 
##It defines a set of methods, variables, and conventions that provide a 
##consistent database interface, independent of the actual database being used.
use CGI qw(:standard);
##CGI is a Common Gateway Interface module that allows to process and prepare
##HTTP requests and responses. qw(:standard) indicates that the standard set of
##functions is being imported
use CGI::Carp qw(fatalsToBrowser);
##CGI::Carp is a module for giving better error messages

print "Content-type: text/html\n\n";
##gets sent back as part of the HTTP header to specify the type of content


##read form data
my $firstname = param('firstname');
my $lastname = param('lastname');
my $email = param('email');
my $phone = param('phone');
##param function/routine gives the value of the form field
##whose name is passed as a parameter

## a new variable is declared as my $variablename;
## later that variable may by called by just using $variablename (without the "my")


my $driver = "mysql"; 
my $database = "amvinaca_final";
my $dsn = "DBI:$driver:$database:localhost";
my $userid = "amvinaca_user";
my $password = "password";


my $dbh = DBI->connect($dsn, $userid, $password ) or die $DBI::errstr;

my $sth = $dbh->prepare("INSERT INTO final
                       (FirstName, LastName,Email,Phone)
                        values
                       (?,?,?,?)");
$sth->execute($firstname,$lastname,$email,$phone) 
          or die $DBI::errstr;
$sth->finish();
$dbh->disconnect();

print "Thank you ",$firstname," ",$lastname," your information was sucessufully submitted.";

##display
print "<p> I will contact you as soon as posible.</p>";
##sends back newly generated content. Text goes into quotes.
##variables ahve to be seperated by commas (similar to + in javascript). 