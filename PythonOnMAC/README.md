## Remove OLD Ver (example 2.7)
1. Remove the third-party Python 2.7 framework
```
sudo rm -rf /Library/Frameworks/Python.framework/Versions/2.7
```
2. Remove the Python 2.7 applications directory
```
sudo rm -rf "/Applications/Python 2.7"
```
3. Remove the symbolic links, in /usr/local/bin, that point to this Python version. See them using
```
ls -l /usr/local/bin | grep '../Library/Frameworks/Python.framework/Versions/2.7' 
```
and then run the following command to remove all the links:

```
cd /usr/local/bin/
ls -l /usr/local/bin | grep '../Library/Frameworks/Python.framework/Versions/2.7' | awk '{print $9}' | tr -d @ | xargs rm
```
4. If necessary, edit your shell profile file(s) to remove adding `/Library/Frameworks/Python.framework/Versions/2.7` to your PATH environment file.
Depending on which shell you use, any of the following files may have been modified:
```
~/.bash_login, ~/.bash_profile, ~/.cshrc, ~/.profile, ~/.tcshrc, and/or ~/.zprofile.
```

## Copy or update Python Packages (PIP lib)

Pip can be used to upgrade and copy all packages from ver3.8 to ver3.9:

1. Output a list of installed packages into a requirements file (requirements.txt): 
```
python3.8 -m pip freeze > ~/Downloads/piplist.txt
```
2. Edit requirements.txt, and replace all ‘==’ with ‘>=’. Use the ‘Replace All’ command in the editor.

3. Upgrade all outdated packages: 
```
python3.9 -m pip freeze > ~/Downloads/piplist.txt
```
