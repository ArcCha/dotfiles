# Arch package manifests

These lists contain the deliberately installed top-level packages for `terra`.
They are curated configuration inputs, not snapshots of every transitive
package installed by Pacman.

Review the lists before restoring them on another machine. Hardware and boot
packages in `system.txt` are specific to this AMD/NVIDIA system.

Install all listed repository packages with:

```sh
grep -hEv '^[[:space:]]*(#|$)' ~/.config/pkglist/*.txt \
  | sudo pacman -S --needed -
```

There is currently no AUR manifest because `pacman -Qqem` is empty. Add an AUR
list only when a real workflow requires foreign packages; do not restore the
historical package dump.

GNOME Keyring also requires these local console-login hooks in
`/etc/pam.d/login` after the corresponding `system-local-login` includes:

```pam
auth       optional     pam_gnome_keyring.so
session    optional     pam_gnome_keyring.so auto_start
```
