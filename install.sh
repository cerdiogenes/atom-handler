#!/bin/bash

mkdir -p $HOME/bin
cat > $HOME/bin/atom-handler <<EOF
#!/bin/bash
request=\${1:23} # Delete first 23 characters == atom://open?url=file://
request=\$(echo \$request | echo -e "\$(sed 's/+/ /g; s/%/\\\x/g')") # Decode URL
request=\${request/&line=/:}   # Replace &line= with :
request=\${request/&column=/:} # Replace &column= with :
atom \$request # Launch Atom
EOF
chmod u+x $HOME/bin/atom-handler

mkdir -p $HOME/.local/share/applications/
cat > $HOME/.local/share/applications/atom-handler.desktop <<EOF
[Desktop Entry]
Name=atom-handler
Comment=Atom URI scheme atom:// handler
Exec=$HOME/bin/atom-handler %u
Terminal=0
Type=Application
X-MultipleArgs=True
MimeType=x-scheme-handler/atom
Encoding=UTF-8
Categories=Application;
EOF

update-desktop-database $HOME/.local/share/applications/
xdg-mime default atom-handler.desktop x-scheme-handler/atom
