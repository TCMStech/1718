cat ~/staff.txt | perl -e 'while(<>) {
($name, $email, $image, $subject) = split /\|/;

$image =~ tr/[A-Z]/[a-z]/; 
$email =~ tr/[A-Z]/[a-z]/; 
$lastname = $image;
$lastname =~ s/\.jpg$//;

chomp $subject;

$subject =~ s/\s+$//;

$filename = $lastname . ".md";
open(FILE, ">$filename") or die "I cant open for writing\n";

print FILE "+++\n";
print  FILE "date = \"2017-04-21T07:00:00-04:00\"\n";
print FILE "title=\"$lastname\"\n";
print FILE "name = \"$name\"\n";
print FILE "email = \"$email\"\n";
print FILE "subject = \"$subject\"\n";
print FILE "description = \"\"\n";
print FILE "image = \"/images/$image\"\n";

print FILE "+++";

close FILE;
}
'

