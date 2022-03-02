#!/bin/bash

# initializing regex with the default lowercase
regex='a-z'

# setting all the flags to their default
number=8
lower='false'
upper='false'
digits='false'
symbols='false'
easy='false'

# usage function will show help
usage() {                                 
  echo "Usage: $0 
    [-n --> Number of characters in password (must be >=1)] 
    [-l --> Specifies that lowercase letters should be used] 
    [-u --> Specifies that uppercase letters should be used]
    [-d --> Specifies that numerical digits should be used] 
    [-s --> Specifies that symbols should be used (i.e. @#$%&*)]
    [-e --> Easy to read. Exclude ambiguous characters (i.e. Il1o0)]" 1>&2 
}

# function to exit with error
error_exit() {
    usage
    exit 1
}

while getopts ":n:ludse" options; do
  case "${options}" in
    n) 
        # specifies the number of characters in the password to be generated.
        number=${OPTARG:-8} 
        ;;
    l) 
        # specifies that lowercase letters should be used.
        lower='true'
        ;;
    u) 
        # specifies that uppercase letters should be used.
        upper='true'
        ;;
    d) 
        # specifies that numerical digits should be used.
        digits='true'
        ;;
    s) 
        # specifies that symbols should be used (i.e. @#$%&*)
        symbols='true'
        ;;
    e) 
        # easy to read. Exclude ambiguous characters (i.e. Il1o0)
        easy='true'
        ;;
    :)
        # if expected argument is not present
        echo "Error: -${OPTARG} requires an argument."
        error_exit
        ;;
    *)
        # if an unknown option is present
        error_exit
        ;;
  esac
done

# ensuring that number is >= 1.
if [[ $number -le 1 ]]; then
    error_exit
fi

# add lowercase characters to the regex variable
if [[ $lower == 'true' ]]; then
    regex+='a-z'
fi

# add uppercase characters to the regex variable
if [[ $upper == 'true' ]]; then
    regex+='A-Z'
fi

# add digits characters to the regex variable
if [[ $digits == 'true' ]]; then
    regex+='0-9'
fi

# add symbols characters to the regex variable
if [[ $symbols == 'true' ]]; then
    regex+='@#$%&'
fi

# generate the password
password=$(cat /dev/urandom | tr -dc $regex | fold -w $number | head -n 1)

# adjust to exclude ambiguous characters
if [[ $easy == 'true' ]]; then
   password=$(cat /dev/urandom | tr -dc $regex | fold -w $number | head -n 1 | tr -d 'Il1o0')
fi

# print password
echo $password

# exit without error
exit 0