#!/bin/bash

# Put this in a local vim file
# let g:dbext_default_SQLSRV_bin = "~/.vim/mssql.sh"
# let g:dbext_default_SQLSRV_cmd_options = ' '
# let g:dbext_default_profile_[profile name] = 'type=SQLSRV:user=[domain\\user]:passwd=[password]:host=[server name]:dbname=[database name]'

# -S is better for FreeTDS then -H
options=$( echo $@ | sed -e 's/-H /-S /' -e 's/ -i.*//' -e 's/-d /-D /' )
# # osql/tsql in freetds don't seem to accept a file flag
sql_scratch=$( echo $@ | sed 's|^.* -i||' )

# # and execute...
cat $sql_scratch | tsql $options -o q
