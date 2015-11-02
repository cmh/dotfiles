#!/bin/sh

echo "Installing IntelliJ IDEA..."

# We need root to install
[ $(id -u) != "0" ] && exec sudo "$0" "$@"

# Check we have an appropriate java
if ! dpkg -s oracle-java8-installer >/dev/null; then
    echo "run install_java.sh first"
    exit 1
fi

# Fetch the most recent community edition URL
#URL=$(wget "http://www.jetbrains.com/idea/download/download_thanks.jsp?edition=I${ed}&os=linux" -qO- | grep -o -m 1 "http://download.jetbrains.com/idea/.*gz")
URL=http://download.jetbrains.com/idea/ideaIC-14.1.4.tar.gz

# Truncate filename
FILE=$(basename ${URL})

# Download binary
wget -cO ~/Downloads/${FILE} ${URL} --read-timeout=5 --tries=0

# Set directory name
DIR="${FILE%\.tar\.gz}"

# Untar file
if mkdir /opt/${DIR}; then
    tar -xvzf ~/Downloads/${FILE} -C /opt/${DIR} --strip-components=1
fi

# Grab executable folder
BIN="/opt/$DIR/bin"

# Add permissions to install directory
chmod 755 ${BIN}/idea.sh

# Set desktop shortcut path
DESK=/usr/share/applications/IDEA.desktop

# Add desktop shortcut
echo -e "[Desktop Entry]\nEncoding=UTF-8\nName=IntelliJ IDEA\nComment=IntelliJ IDEA\nExec=${BIN}/idea.sh\nIcon=${BIN}/idea.png\nTerminal=false\nStartupNotify=true\nType=Application" > ${DESK}
echo "export \PATH=$BIN:\$PATH" >>$HOME/.zshrc.local

echo "Done."
