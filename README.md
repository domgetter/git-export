# git-export
A small program to export Git config settings to JSON

Usage
==

    $ git export
    
This will produce a JSON file in your home directory.  Mine looks like this:

    {
      "global": {
        "user.email": "nicklink483@gmail.com",
        "user.name": "Dominic Muller",
        "alias.new": "init",
        "alias.save": "commit -m",
        "alias.copy": "add",
        "alias.undo": "reset --soft HEAD^",
        "alias.sup": "status",
        "alias.peer": "remote"
      }
    }

It's perfect when in use with git-import to import all of your favorite configuration settings and aliases to a new install.