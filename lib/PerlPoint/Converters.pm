package PerlPoint::Converters;

$VERSION = "1.01";

use File::Copy;
use Cwd;
use Carp;
use Exporter;
@ISA = qw(Exporter);

@EXPORT_OK = qw(
  replace_keywords
  update_file
  copy_file
  mk_abs_path
);
use strict;

=head1 NAME

PerlPoint::Converters - README and common functions for PerlPoint converters

=head1 README

Covered topics:

=over 4

=item *

Introduction

=item *

About PerlPoint-Converters

=item *

Prerequisits

=item *

What's new

=item *

Installation

=item *

Documentation

=item *

Test Cases

=item *

Bug Reports and Support

=item *

Credits

=item *

Licence

=back

=head2 Introduction

PerlPoint is a simple text format which allows easy typing of text
with headlines, bullet lists, normal text paragraphs, indented
paragraphs for code examples etc., from which slides for presentations
can be generated by a script without the need of proprietary software.
Since there is a large variety of platforms which provide web browsers,
HTML is a good choice for the output format. In principle, however, it
is possible to generate each output format whose specification is
known. At the moment there exist converters for HTML, LaTeX (alpha software)
and SDF. The latter both may be used to generate printable output or to
provide the basis for further processing.


=head2 About PerlPoint-Converters

This package provides two programs:

  pp2html
  pp2latex (still alpha software)

They convert an ASCII file written in the `PerlPoint' language to a set
of HTML files or to Latex Files respectively. The `PerlPoint' language
was initially invented by Tom Christiansen as a simple means for
preparing slides. The idea was to just write down your headings and
bullet items and then use a simple perl script to create the slides:

  =Header of first slide

  * Use your favourite editor

  * Start headings with a `='

  * Bullets items start with an asterisk `*'

The syntax of the original version was similar to POD and the layout 
of the slides was hard coded in Tom's pp2html script. The new syntax 
provides more felxibility and can be parsed with the PerlPoint::Parser 
from Jochen Stenzel's PerlPoint-Package.

The following list persents some of the features of pp2html and pp2latex:

  - HTML template files for header, footer and navigation bar
  - Support of Frame Sets
  - Support of the TreeControl Applet in tabel of contents
  - Headers with different levels with or wihout numbering
    (1, 1.1, 1.2, 2, ...)
  - Hyperlinks to internal and external pages
  - Automatic generation of table of contents and navigation links
  - Automatic generation of index
  - Bullet-Lists with standard <LI> bullets or with bullets from 
    a gif/jpeg file
  - Numbered lists and definition lists
  - Simple tables
  - Simple text formatting possible

For more information about the PerlPoint syntax and history please
refer to the documentation in the PerlPoint-Package from Jochen Stenzel
(perldoc PerlPoint::Parser) and to the provided documentation in the
./doc/PPDOC subdirectory (after a successful "make" in ./doc :-)


=head2 Prerequisits

This version needs Perl5.005.

The pp2html program uses the following packages which are available on CPAN
or come with your Perl distribution:

  Pod::Text
  Getopt::Long
  Getopt::ArgvFile
  PerlPoint::Parser
  PerlPoint::Backend
  PerlPoint::Constants
  PerlPoint::Tags::Basic;
  PerlPoint::Tags::HTML;  (part of PerlPoint-Converters)
  PerlPoint::Tags::LaTeX; (part of PerlPoint-Converters)

The TreeApplet classes are contained in the pp2html_stypes subdirectory of this
distribution. For more information about the TreeApplet classes refer to
http://www.naturallyj.com.
This distribution contains an older version which was freely available.


=head2 What's new in this version

This is version 1.00.
You will need PerlPoint-Packet version 0.36 for this release.

Please refer to file "Changes".

=over 4

=item NOTE:

Documentation is not yet perfect, but hopefully better than before.
Please try a "make" in ./doc and look at the documents which
should have been created in ./doc/PPDOC

=back

=head2 Installation

Just get the PerlPoint-Converters-<release>.tar.gz file and unpack it in a temp directory:

  % tar zxvf PerlPoint-Converters-<release>.tar.gz 
  % cd PerlPoint-Converters-<release>
  % perl Makefile.PL
  % make
  % make test
  % make install

  % cd ./doc
  % make

The main program is `pp2html'. Try `pp2html --help | less' to get more 
information.

=head2 Documentation

C<pp2hml> and C<pp2latex> have a --help option which displays
Usage information and some documentation about the PerlPoint
Language. For a more detailed description please refer to the
POD documentation of the following Modules:

 PerlPoint::Parser
 PerlPoint::Anchors
 PerlPoint::Backend
 PerlPoint::Constants
 PerlPoint::Tags
 PerlPoint::Tags::Basic
 PerlPoint::Tags::CPPP
 PerlPoint::Tags::HTML
 PerlPoint::Tags::LaTeX
 PerlPoint::Tags::SDF

Have also a look into the ./doc directory of your PerlPoint::Converters
installation directory. There is a Makefile which produces the
following PerlPoint documents:

=over 4

=item *

Getting_Started

=item *

FAQ-pp2html

=item *

FAQ-parser

=item *

Writing-Converters

=back


=head2 Test Cases

The examples test cases from the previous releases (ex_std_norm,
ex_std_tree, ex_frm_norm and ex_frm_tree) have now been replaced
with the documentation in the ./doc subdirectory.


=head2 Bug Reports and Support

Please send bug reports and requests to <lorenz.domke@gmx.de>
There is also a mailing list for PerlPoint:

  perlpoint@perl.org

To join the mailing list, send a message to C<perlpoint-subscribe@perl.org>




=head2 Credits

Thanks to Tom Christiansen for the idea and first implementation
of PerlPoint! And special thanks for his permission to use this
name for our new implementation.

Thanks to Jochen Stenzel who tested the first versions of pp2html
and supplied the powerful PerlPoint-Package which is the base of
this new implementation of pp2html.

Thanks to Stephen Riehm who shared his ideas of extensions for
the original software with us. The final language was basically
designed by a team of Jochen, him and me.

Thanks to Alex Sigel and Norbert Gruener who became our first
testers outside the team and helped us by their usage reports.
Special thanks to Alex for propagating the toolkit and his help
to publish the software!


=head2 Licence

This module is free software, you can redistribute it and/or modify it
under the terms of the Artistic License distributed with Perl version
5.003 or (at your option) any later version. Please refer to the
Artistic License that came with your Perl distribution for more
details.

The Artistic License should have been included in your distribution of
Perl. It resides in the file named "Artistic" at the top-level of the
Perl source tree (where Perl was downloaded/unpacked - ask your
system administrator if you dont know where this is).  Alternatively,
the current version of the Artistic License distributed with Perl can
be viewed on-line on the World-Wide Web (WWW) from the following URL:
http://www.perl.com/perl/misc/Artistic.html

DISCLAIMER

This software is distributed in the hope that it will be useful, but
is provided "AS IS" WITHOUT WARRANTY OF ANY KIND, either expressed or
implied, INCLUDING, without limitation, the implied warranties of
MERCHANTABILITY and FITNESS FOR A PARTICULAR PURPOSE.

The ENTIRE RISK as to the quality and performance of the software
IS WITH YOU (the holder of the software).  Should the software prove
defective, YOU ASSUME THE COST OF ALL NECESSARY SERVICING, REPAIR OR
CORRECTION.

IN NO EVENT WILL ANY COPYRIGHT HOLDER OR ANY OTHER PARTY WHO MAY CREATE,
MODIFY, OR DISTRIBUTE THE SOFTWARE BE LIABLE OR RESPONSIBLE TO YOU OR TO
ANY OTHER ENTITY FOR ANY KIND OF DAMAGES (no matter how awful - not even
if they arise from known or unknown flaws in the software).

Please refer to the Artistic License that came with your Perl
distribution for more details.


=head1 SYNOPSIS

 use PerlPoint::Converters qw(
                               replace_keywords
                               update_file
                               copy_file
                             );

 copy_file($from, $to);

 update_file($from, $to);

 $line = replace_keywords($line, $KEY_HASH_REF);

=head1 DESCRIPTION

This module contains some common functions which are
useful for most PerlPoint converters.

=head1 SUBROUTINES

=cut

#----------------------------------------------------------

=head2 replace_keywords($line, $KEY_HASH_REF);

Replace all occurences of certain keywords in $line with the
values specified in the referenced hash.
The keys in the hash must be lower case keywords.

Example:

 %OPT = (
    title        => "PerlPoint Examples",
    bot_left_txt => "Copyright A. User",
 );

 open(TPL, "a_template_file");
 while(<TPL>){
   print replace_keywords($_, \%OPT);
 }

This will replace "TITLE" with "PerlPoint Examples" and "BOT_LEFT_TXT"
with "Copyright A. User".

The supported keywords are:

  TXT_CONTENTS
  TXT_INDEX
  PAGE_CNT
  TITLE
  BASE_LEFT_TXT
  BASE_RIGHT_TXT
  BASE_MIDDLE_TXT
  BOT_LEFT_TXT
  BOT_RIGHT_TXT
  BOT_MIDDLE_TXT
  TOP_LEFT_TXT
  TOP_RIGHT_TXT
  TOP_MIDDLE_TXT

  BOT_BGCOLOR
  TOP_BGCOLOR
  IDX_BGCOLOR
  TOC_BGCOLOR
  BOT_FGCOLOR
  TOP_FGCOLOR
  IDX_FGCOLOR
  TOC_FGCOLOR

  LABEL_NEXT
  LABEL_PREV
  LABEL_INDEX
  LABEL_CONTENTS

  SLIDE_PREFIX
  SLIDE_SUFFIX

  LOGO_IMAGE_FILENAME
  IMAGE_REF

=cut

sub replace_keywords {
  my ($line, $OPT) = @_;
  my @KW = qw(
  TXT_CONTENTS
  TXT_INDEX
  PAGE_CNT
  TITLE
  BASE_LEFT_TXT
  BASE_RIGHT_TXT
  BASE_MIDDLE_TXT
  BOT_LEFT_TXT
  BOT_RIGHT_TXT
  BOT_MIDDLE_TXT
  TOP_LEFT_TXT
  TOP_RIGHT_TXT
  TOP_MIDDLE_TXT

  BOT_BGCOLOR
  TOP_BGCOLOR
  IDX_BGCOLOR
  TOC_BGCOLOR
  BOT_FGCOLOR
  TOP_FGCOLOR
  IDX_FGCOLOR
  TOC_FGCOLOR

  LABEL_NEXT
  LABEL_PREV
  LABEL_INDEX
  LABEL_CONTENTS

  SLIDE_PREFIX
  SLIDE_SUFFIX

  LOGO_IMAGE_FILENAME
  IMAGE_REF

  );
  $line =~ s/\bSLIDE_PREFIX/$$OPT{slide_prefix}/g;
     # special word boumdary for SLIDE_PREFIX ...
  foreach my $kw (@KW){
    $line =~ s/\b$kw\b/$$OPT{lc($kw)}/g if defined $$OPT{lc($kw)};
  }
  return $line;

} # replace_keywords 

#----------------------------------------------------------

=head2 copy_file($from, $to, $verbose, $KEY_HASH_REF);

Copy file C<$from> to file C<$to>. For binary files (! -T) the File::Copy
method will be used. Text files are copied by reading from
C<$from> and printing to C<$to>. All lines are
treated with the C<replace_keywords> method.

Prints a message to STDERR if $verbose is set to 1.

=cut

sub copy_file { # should work on each system ...
  my ($from, $to, $verbose, $OPT) = @_;
  print STDERR "... copying $from to $to\n" if $verbose;
  if (! -T $from){
    copy($from, $to); # (use correct mode for binary files)
  } else { # should be text file ...
    open(FROM, "< $from") or die "Can't open $from: $!\n";
    open(TO  , "> $to")   or die "Can't open $to: $!\n";
    while(<FROM>) {
      print TO replace_keywords($_, $OPT);
    }
    close(FROM); close(TO);
  }
} # copy_file

#----------------------------------------------------------

=head2 update_file($from, $to, $verbose, $KEY_HAHS_REF);

Update file C<$from> to file C<$to> if necessary. For binary files (! -T)
the File::Copy method will be used. Files are only copied if the
modification date of C<$to> is older than the modification date of C<$from>.

Text files are B<always> copied by reading from
C<$from> and printing to C<$to> because keywords might have
changed. All lines are treated with the C<replace_keywords> method.

Prints a message to STDERR if $verbose is set to 1.

=cut

sub update_file { # 
  my ($from, $to, $verbose, $OPT) = @_;
  # check, if update is really needed:
  return if $to eq $from;
  # copy:
  if (! -T $from){ # binary file ?
    if (-e $to){
      my ($dev,$ino,$mode,$nlink,$uid,$gid,$rdev,$size,$atime,$time2) = stat(_);
      my $time1;
      ($dev,$ino,$mode,$nlink,$uid,$gid,$rdev,$size,$atime,$time1) = stat($from);
      return if $time1 <= $time2;
    }
    print STDERR "... copying $from to $to\n" if $verbose;
    copy($from, $to); # (use correct mode for binary files)
  } else { # should be text file ...
    ## always copy, because the keywords might have changed !
    print STDERR "... copying $from to $to\n" if $verbose;
    open(FROM, "< $from") or die "Can't open $from: $!\n";
    open(TO  , "> $to")   or die "Can't open $to: $!\n";
    while(<FROM>) {
      print TO replace_keywords($_, $OPT);
    }
    close(FROM); close(TO);
  }
} # update_file


sub mk_abs_path {
  my $path = shift;
  my $cwd = cwd;
  chdir $path or croak "Cannot cd to $path\n";
  my $abspath = cwd;
  chdir $cwd or croak "Cannot cd back to $cwd\n";
  return $abspath;
} # mk_abs_path

=head1 AUTHOR

Lorenz Domke <lorenz.domke@gmx.de>


=cut

1

__END__


