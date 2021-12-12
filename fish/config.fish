#
# Flatpak
#
# Should be fixed soon by https://github.com/flatpak/flatpak/pull/4575
# See https://github.com/flatpak/flatpak/issues/3109
bass source /etc/profile

# Use if flatpak doesn't work:
# See: https://github.com/fish-shell/fish-shell/issues/7485#issuecomment-728984689
#set -l xdg_data_home $XDG_DATA_HOME ~/.local/share
#set -gx --path XDG_DATA_DIRS $xdg_data_home[1]/flatpak/exports/share:/var/lib/flatpak/exports/share:/usr/local/share:/usr/share

#for flatpakdir in ~/.local/share/flatpak/exports/bin /var/lib/flatpak/exports/bin
#    if test -d $flatpakdir
#        contains $flatpakdir $PATH; or set -a PATH $flatpakdir
#    end
#end

if status is-interactive
    # Commands to run in interactive sessions can go here
end
