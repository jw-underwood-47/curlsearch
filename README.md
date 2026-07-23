# curlsearch
For when you want to download a webpage and look for stuff  

## install/setup
The only file you actually need if you are just using it yourself is
curlsearch.sh, which you can copy into a file on your machine.  
You may want to do this in a separate folder to hold the saved webpages, i.e.
```
mkdir curlsearch
cd curlsearch
```
and copy `curlsearch.sh` there.
Once you have that, run `chmod +x curlsearch.sh` to make it executable.  
  
## usage
```./curlsearch.sh URL TERM1 [TERM2] [ETC] ```
The first argument after the script is the url to download.
Subsequent arguments are search terms.
As of right now, they are all case sensitive.
This can be changed by replacing `grep` with
`grep -i` where `grep` appears in the script.  
Likewise, searches use regular expressions; this may cause unexpected behavior
if your search term includes characters such as `.`.
This behavior can be changed by adding ` -F` after `grep`,
with or without `-i`.  
Furthermore, more context around matches can be provided by adding
`-A [number]` or `-B [number]` or `-C [number]` after `grep`.  
The line beginning with `rm` deletes the files showing the matching lines;
those files can be kept by deleting that lines or commenting out with `#`.  
Program stores curled file as html, based on url and date.  
  
## example usage and output
```
./curlsearch.sh https://lichess.org/ chess
  % Total    % Received % Xferd  Average Speed  Time    Time    Time   Current
                                 Dload  Upload  Total   Spent   Left   Speed
100  33896 100  33896   0      0  56645      0                              0
 chess 11 instances
```
  
## dependencies
sh (in bash, zsh, and most other shells)  
sed  
curl  
grep  
All of these should come with basically any terminal.
