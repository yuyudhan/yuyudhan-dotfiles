# Read this for configuring.

Yabai requires SIP to be disabled.

## To disable SIP, follow these steps

1. Boot into recovery mode, by shutting down and pressing cmd + r or long pressing power button while switching on.
2. Enter terminal and run csrutil disable
3. Run `csrutil status` to verify 
4. Reboot into normal mode.

Follow instructions here.

https://github.com/koekeishiya/yabai/wiki/Installing-yabai-(latest-release)

Your current user must be into sudoers for yabai command.

Run below command to this in one line, this will require a reboot.

```sh
echo "$(whoami) ALL=(root) NOPASSWD: sha256:$(shasum -a 256 $(which yabai) | cut -d " " -f 1) $(which yabai) --load-sa" | sudo tee /private/etc/sudoers.d/yabai
```

Below should be present in the starting of your yabairc file.

```sh
# for this to work you must configure sudo such that
# it will be able to run the command without password

yabai -m signal --add event=dock_did_restart action="sudo yabai --load-sa"
sudo yabai --load-sa

# .. more yabai startup stuff
```

