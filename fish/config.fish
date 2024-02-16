#
# Flatpak
#
# Should be fixed soon by https://github.com/flatpak/flatpak/pull/4575
# See https://github.com/flatpak/flatpak/issues/3109
bass source /etc/profile

# Use if flatpak doesn't work:
# See: https://github.com/fish-shell/fish-shell/issues/7485#issuecomment-728984689
set -l xdg_data_home $XDG_DATA_HOME ~/.local/share
set -gx --path XDG_DATA_DIRS $xdg_data_home[1]/flatpak/exports/share:/var/lib/flatpak/exports/share:/usr/local/share:/usr/share

for flatpakdir in ~/.local/share/flatpak/exports/bin /var/lib/flatpak/exports/bin
    if test -d $flatpakdir
        contains $flatpakdir $PATH; or set -a PATH $flatpakdir
    end
end

# Start X at login
if status is-login
    if test -z "$DISPLAY" -a "$XDG_VTNR" = 1
        exec startx -- -keeptty
    end
end

status --is-interactive; and rbenv init - fish | source

if status is-interactive
  # Yarn
  fish_add_path (yarn global bin)

  # Default browser
  set -Ux BROWSER /usr/bin/firefox

  # Vim mode
  fish_vi_key_bindings

  # Alias
  alias dc "docker-compose"

  # K8s
  alias k8sdev "kubectl config use-context arn:aws:eks:eu-west-1:529272700247:cluster/development"
  alias k8sprod "kubectl config use-context arn:aws:eks:eu-west-1:979078630284:cluster/meetball-main-prod"
  alias pods "kubectl -n app get pods"
  alias logs "kubectl -n app logs"
  alias describe "kubectl -n app describe pod"
end
