# Arch package manifests

These lists contain the deliberately installed top-level packages for `terra`.
They are curated configuration inputs, not snapshots of every transitive
package installed by Pacman.

Review the lists before restoring them on another machine. Hardware and boot
packages in `system.txt` are specific to this AMD/NVIDIA system.

Steam and `lib32-nvidia-utils` require Arch's official `[multilib]` repository.
Enable its existing section in `/etc/pacman.conf` and perform a full
`pacman -Syu` before restoring these manifests; never use a standalone
`pacman -Sy` partial upgrade.

Install the listed official-repository packages with:

```sh
grep -hEv '^[[:space:]]*(#|$)' \
  ~/.config/pkglist/system.txt \
  ~/.config/pkglist/desktop.txt \
  ~/.config/pkglist/tools.txt \
  | sudo pacman -S --needed -
```

Foreign packages are deliberately kept in `aur.txt`; never pass that file to
`pacman`. Bootstrap `yay` from its reviewed AUR Git repository on a new host,
then review each listed PKGBUILD and restore accepted packages with:

```sh
grep -Ev '^[[:space:]]*(#|$)' ~/.config/pkglist/aur.txt \
  | xargs -r yay -S --needed --
```

The manifest records intentional top-level packages only. Generated `-debug`
split packages are not package intent, even if `makepkg` installs them during a
build. Do not restore the historical foreign-package dump.

GNOME Keyring also requires these local console-login hooks in
`/etc/pam.d/login` after the corresponding `system-local-login` includes:

```pam
auth       optional     pam_gnome_keyring.so
session    optional     pam_gnome_keyring.so auto_start
```
