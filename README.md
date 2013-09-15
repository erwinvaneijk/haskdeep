HaskDeep
========

What is it?
-----------
Command line tool that computes file hashes traversing recursively through
a directory structure.
Known hashes are saved to file and they can be used to verify the original
files or a copy of them.

Quick start
-----------
Execute haskdeep without arguments and it will show you the help text:

    user@host:~$ haskdeep

    Usage: haskdeep COMMAND [-c|--computation MODE] [-r|--root DIRNAME] [-k|--known FILENAME]
      Computes hashes and audit a set of files

    Available options:
      -h,--help                Show this help text
      -v,--version             Show version information
      -c,--computation MODE    md5 | sha1 | sha256 | skein512 - default md5
      -r,--root DIRNAME        Root directory - default current directory
      -k,--known FILENAME      Known hashes file - default known.haskdeep
      -e,--excl-regex REGEX    Exclude files or directories based on regex
      -f,--incl-mod-from DATE  Include files modified from yyyy-mm-ddThh:mm:ssZ
      -t,--incl-mod-upto DATE  Include files modified up to yyyy-mm-ddThh:mm:ssZ

    Available commands:
      compute                  Computes file hashes and saves them to known hashes file
      audit                    Audits files comparing them to known hashes

Default usage:

1. create known hashes of files contained in a root directory (traversed recursively)

        user@host:~$ haskdeep compute -c md5 -r myimportantfiles/ -k knownhashes.txt -e "tmp|\.log"

2. verify a copy of the same files comparing them with known hashes

        user@host:~$ haskdeep audit -c md5 -r copyofmyimportantfiles/ -k knownhashes.txt -e "tmp|\.log"

Licensing
---------
Please see the file called LICENSE.

Reference
---------
Heavily inspired by `hashdeep`: <http://md5deep.sourceforge.net/>

Contacts
--------
For question and comments:

- [MauroTaraborelli@gmail.com](mailto:MauroTaraborelli@gmail.com)
