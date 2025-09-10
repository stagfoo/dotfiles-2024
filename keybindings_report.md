# Keybinding Report

This report details the keybindings found in your Neovim configuration, sorted by left-hand and right-hand usage to help you optimize your keyboard layout.

## Left-Hand Keybindings

These keybindings are primarily activated using your left hand.

| Key             | Mode | Description                               |
| --------------- | ---- | ----------------------------------------- |
| `<leader>a`     | n    | Add current file to Harpoon list          |
| `<C-e>`         | n    | Toggle Telescope for Harpoon list         |
| `<leader>w`     | n    | Save and close Harpoon list               |
| `q`             | n    | Close Harpoon window                      |
| `<leader>gf`    | n    | Find git files with Telescope             |
| `<space>fb`     | n    | Find buffers with Telescope               |
| `<leader>tf`    | n    | Find and open file in tmux                |
| `<leader>f`     | n    | Open file picker (Nnn)                    |
| `<leader>e`     | n    | Open file sidebar (Nnn)                   |
| `x`             | n    | Remapped to `d` (delete)                  |
| `y`             | n,v  | Yank (copy)                               |
| `<leader>vrn`   | n    | LSP rename                                |
| `<C-w>`         | n    | Move up one screen                        |
| `<leader>ww`    | n    | Move to start of file                     |
| `A`             | n,v,o| Move to start of line                     |
| `<C-s>`         | n    | Move down one screen                      |
| `<leader>ss`    | n    | Move to end of file                       |
| `D`             | n,v,o| Move to end of line                       |
| `<leader>dd`    | n    | Move to first non-space character         |

## Right-Hand Keybindings

These keybindings are primarily activated using your right hand.

| Key          | Mode | Description                       |
| ------------ | ---- | --------------------------------- |
| `J`          | n    | LSP go to definition              |
| `K`          | n    | LSP hover                         |
| `L`          | n    | LSP open diagnostics float        |
| `<leader>h`  | n    | LSP format buffer                 |
| `<leader>j`  | n    | Remapped to `k`                   |
| `o`          | n    | Remapped to `O` (new line above)  |
| `<C-p>`      | n    | Find git files                    |
| `<leader>hh` | n    | LSP code action                   |

## Combo/Multi-key Keybindings

These keybindings involve keys from both hands or multiple keys in sequence.

| Key           | Mode | Description                       |
| ------------- | ---- | --------------------------------- |
| `<leader>he`  | n    | Edit Harpoon list                 |
| `[d`          | n    | Go to next diagnostic             |
| `]d`          | n    | Go to previous diagnostic         |
| `<leader>pf`  | n    | Find project files with Telescope |
| `<leader>sk`  | n    | Search keymaps with Telescope     |

## Folding

| Key   | Mode | Description        |
| ----- | ---- | ------------------ |
| `zo`  | n    | Open fold          |
| `zc`  | n    | Close fold         |
| `za`  | n    | Toggle fold        |
| `%`   | n,v  | Jump to matching bracket |

## Keyboard Layout

Here is a visual representation of a standard QWERTY keyboard. Keys with an asterisk (`*`) have a direct keybinding or a single-character leader keybinding associated with them.

```
+----------------------------------------------------------------------------------------------------+
| `~ | 1! | 2@ | 3# | 4$ | 5% | 6^ | 7& | 8* | 9( | 0) | -_ | =+ |         Backspace        |
|----------------------------------------------------------------------------------------------------|
|   Tab   |  q*|  w*|  e*|  r |  t |  y*|  u |  i |  o*|  p*| [{*| ]}*|          \|           |
|----------------------------------------------------------------------------------------------------|
|  Caps   |  a*|  s*|  d*|  f*|  g |  h*|  j*|  k*|  l*| ;: | '" |           Enter          |
|----------------------------------------------------------------------------------------------------|
|   Shift   |  z*|  x*|  c |  v |  b |  n |  m | ,< | .> | /? |             Shift            |
|----------------------------------------------------------------------------------------------------|
| Ctrl | Super | Alt |                        [  Space* ]                       | Alt | Super | Menu | Ctrl |
+----------------------------------------------------------------------------------------------------+
```

### Keyboard Keybinding Annotations:

**Note:** `<leader>` is assumed to be `<space>`.

-   **`q`**: (Left Hand) Close Harpoon window.
-   **`w`**: (Left Hand) `<leader>w`: Save and close Harpoon list. `<C-w>`: Move up one screen.
-   **`e`**: (Left Hand) `<C-e>`: Toggle Telescope for Harpoon list. `<leader>e`: Open file sidebar (Nnn).
-   **`y`**: (Left Hand) Yank (copy).
-   **`a`**: (Left Hand) `<leader>a`: Add current file to Harpoon list. `A`: Move to start of line.
-   **`s`**: (Left Hand) `<C-s>`: Move down one screen.
-   **`d`**: (Left Hand) `D`: Move to end of line.
-   **`f`**: (Left Hand) `<leader>f`: Open file picker (Nnn).
-   **`x`**: (Left Hand) Remapped to `d` (delete).
-   **`z`**: (Left Hand) `zo`: Open fold, `zc`: Close fold, `za`: Toggle fold.

-   **`o`**: (Right Hand) Remapped to `O` (new line above).
-   **`p`**: (Right Hand) `<C-p>`: Find git files.
-   **`h`**: (Right Hand) `<leader>h`: LSP format buffer.
-   **`j`**: (Right Hand) `<leader>j`: Remapped to `k`.
-   **`k`**: (Right Hand) `<leader>k` is not bound, but is the target of `<leader>j`.
-   **`J`**: (Right Hand) LSP go to definition.
-   **`K`**: (Right Hand) LSP hover.
-   **`L`**: (Right Hand) LSP open diagnostics float.

-   **`[`**: (Right Hand) `[d`: Go to next diagnostic.
-   **`]`**: (Right Hand) `]d`: Go to previous diagnostic.
