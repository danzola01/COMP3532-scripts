# COMP3532-scripts
A collection of bash scripts created for the course COMP3532 at Mount Royal University

## passgen.sh
Script that generates a password.

Capable of handling the following flags:
| Option 	|                                                                 Description                                                                	|
|:------:	|:------------------------------------------------------------------------------------------------------------------------------------------	|
|   -n   	| Specifies the number of characters in the password to be generated. Default length is 8 characters if this flag is not used. Must be >= 1. 	|
|   -l   	| Specifies that lowercase letters should be used.                                                                                           	|
|   -u   	| Specifies that uppercase letters should be used.                                                                                           	|
|   -d   	| Specifies that numerical digits should be used.                                                                                            	|
|   -s   	| Specifies that symbols should be used (i.e. @#$%&\*)                                                                                        |
|   -e   	| Easy to read. Exclude ambiguous characters (i.e. Il1o0)                                                                                    	|

**Notes**
- If none of the flags specifying which characters to use (i.e. l,u,d,s) are used then only lowercase characters should be used.
- If any of the flags specifying characters are used than only those characters from the specified flags should be used.
- The command will give an error message if a number <= 0 is used for the password length.
