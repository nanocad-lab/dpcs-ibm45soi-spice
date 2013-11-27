#!/usr/bin/perl

# Mark Gottscho: This is based on Shaodi Wang's post-processing script for HSPICE data

$input_file_name = $ARGV[0];
$points = $ARGV[1];
$steps = $points * 2;

@id = ( 1 .. $steps );

@id = parsefile ( $input_file_name );
print "voltage(mV),current(nA)\n";
for ($i=$steps-1;$i>0;$i-=2)
{
  print "$id[$i-1],$id[$i]\n";
}


sub parsefile
{
  @id = ( 1 .. $steps );
  open ( inFile, "$_[0]" );
  $if_start=0;
  $index = 0;
  while ( <inFile> )
  {
    chomp ();
    @parts = split ();
  #  if ( $parts[0]=~ /^0\.00/ )
    if ( $parts[0] eq "x" )
    {
      $if_start = 1;
      $parts[0] = 0;
      $parts[1] = 0;
    }
    if ( $parts[0] =~ /y/ )
    {
      $if_start = 0;
    }
    if ( $if_start > 0 and $if_start < 6 )
    {
		 $if_start = $if_start + 1;
    }
    if ( $if_start eq 6)
    {
      $id[$index++] = $parts[0];
      $id[$index++] = $parts[1];
    }
  }
  return @id;
}

