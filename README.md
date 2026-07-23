# curlsearch
For when you want to download a webpage and look for stuff  
  
## usage
```./curlsearch.sh URL TERM1 [TERM2] [ETC] ```
The first argument after the script is the url to download.
Subsequent arguments are search terms.
As of right now, they are all case sensitive.
This can be changed by replacing `grep` with
`grep -i` in line 16 of the script.  
Program stores curled file as html, based on url and date.  
  
## dependencies
sh (in bash, zsh, and most other shells)  
sed  
curl  
grep  
All of these should come with basically any terminal.
