sudo systemctl set-default multi-user.target
sudo ln -fs /lib/systemd/system/getty@.service /etc/systemd/system/getty.target.wants/getty@tty1.service
sudo cat > /etc/systemd/system/getty@tty1.service.d/autologin.conf << EOF
[Service]
ExecStart=
ExecStart=-/sbin/agetty --autologin $USER --noclear %I \$TERM
EOF

cat bashrc.extra >> ~/.bashrc

if [ ! -d ~/.config/autostart/ ]; then
    mkdir -p ~/.config/autostart/
fi
cp ./10-desktopmgr-autostart.desktop ~/.config/autostart/10-desktopmgr-autostart.desktop

if [ ! -d ~/bin ]; then
    mkdir -p ~/bin
fi
cp ./bin/* ~/bin/

git submodule init
cd LCD-show/
if [ ! -f ./.have_installed ]; then
 ./LCD35-show
fi
