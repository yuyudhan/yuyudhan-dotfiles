# Testing Tmux Pane Titles with SSH Detection

## Setup

1. **Reload your shell to load the new zsh configuration:**
   ```bash
   source ~/.zshrc
   ```

2. **Reload tmux configuration (if already in tmux):**
   ```
   Prefix + q → C   (Ctrl+O, then q, then C)
   ```
   Or manually:
   ```bash
   tmux source-file ~/.config/tmux/tmux.conf
   ```

3. **Start fresh tmux session (recommended for testing):**
   ```bash
   tmux new -s test-titles
   ```

## Test Scenarios

### Test 1: Local Session Pane Titles

1. **Create a new tmux session or window**
2. **Split panes:** `Prefix + |` (horizontal) or `Prefix + -` (vertical)
3. **Check pane headers:**
   - Should show pane index and current directory name
   - Example: `0: yuyudhan-dotfiles` or `1: code`

4. **Navigate to different directories:**
   ```bash
   cd ~/Downloads
   cd /tmp
   cd ~
   ```
   - Pane header should update automatically with each directory change

5. **Run a command:**
   ```bash
   ls -la
   ```
   - During command execution: should show `dirname: ls`
   - After completion: should return to just `dirname`

### Test 2: Pane Header Dimming

1. **Create multiple panes** (3-4 panes)
2. **Switch between panes:** `Ctrl+h/j/k/l`
3. **Verify visual feedback:**
   - **Active pane header:** Bright blue background (`#3d59a1`) with white bold text
   - **Inactive pane headers:** Darker gray background (`#3b4261`) with white text
   - **Active pane content:** Bright text (`#c0caf5`)
   - **Inactive pane content:** Dimmed text (`#6b7089`)

### Test 3: SSH Session Detection

1. **SSH into a remote server:**
   ```bash
   ssh user@hostname
   # or
   ssh user@192.168.1.100
   ```

2. **Check pane header:**
   - Should automatically show: `user@hostname`
   - Example: `ankur@webserver` or `root@192.168.1.100`

3. **Switch panes:**
   - Local pane: Shows directory name
   - SSH pane: Shows `user@host`
   - Clear visual distinction between local and remote sessions

4. **Run commands in SSH session:**
   - Should maintain `user@host` display
   - When running command: `user@host: command_name`

### Test 4: SSH from within SSH (Nested)

1. **SSH into server A, then SSH into server B:**
   ```bash
   ssh userA@serverA
   ssh userB@serverB
   ```

2. **Check title:**
   - Should show innermost SSH session: `userB@serverB`

### Test 5: Window Titles (Status Bar)

1. **Check the tmux status bar at the bottom**
2. **Window status should show:** `index:name`
3. **Titles remain static** (automatic-rename is off)
4. **Can manually rename:** `Prefix + r → w` then type new name

## Expected Behavior Summary

| Scenario | Pane Header Display | Active Border | Inactive Border |
|----------|---------------------|---------------|-----------------|
| Local session | Directory name | Blue (#3d59a1) | Gray (#3b4261) |
| SSH session | user@host | Blue (#3d59a1) | Gray (#3b4261) |
| Running command | dirname: cmd or user@host: cmd | Blue | Gray |
| Zoomed pane | Same + 🔍 emoji | Blue | N/A |

## Troubleshooting

### Pane headers not updating:
1. Ensure you've reloaded your zsh config: `source ~/.zshrc`
2. Check if you're in tmux: `echo $TMUX` (should show path)
3. Verify the config file exists: `ls ~/.config/zsh/configs/12-tmux-titles.zsh`

### SSH detection not working:
1. Check environment variable: `echo $SSH_CONNECTION` (should have value in SSH)
2. Try exiting and re-entering the SSH session
3. Verify the zsh config loaded: `type get_session_title` (should show function)

### Pane dimming not visible:
1. Check terminal supports true color
2. Verify tmux version: `tmux -V` (should be 3.0+)
3. Confirm terminal override: `echo $TERM` (should be `tmux-256color`)

## Cleanup

After testing, you can delete this file:
```bash
rm ~/code/yuyudhan/yuyudhan-dotfiles/TESTING_TMUX_TITLES.md
```
