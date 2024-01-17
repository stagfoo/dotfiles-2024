# Dot Files 2024

# Neovim Keybinding Manpage
    
    This manpage documents the keybindings configured in your Neovim
      configuration, including remapped default keybindings.

## General
    
 *   **`<leader>`**:  ` ` (space) - This is your leader key.  All
        keybindings starting with `<leader>` will use the space key.
    
## File Management
   
 *   **`<leader>pv`**: Open NnnPicker
   
## Code Formatting
   
 *   **`<leader>f`**: Format buffer
   
## Code Actions
   
 *   **`<leader>qf`**: Apply preferred code actions
   
## File Duplication
   
 *   **`<leader>df`**: Duplicate current file
   
## Emoji
   
 *   **`<ctrl+l>`**: Open EmojiPicker

## Movement (Video Game Style)
   
 *   **`w`**: Up (replaces `k` - default: move cursor up)
 *   **`a`**: Left (replaces `h` - default: move cursor left)
 *   **`s`**: Down (replaces `j` - default: move cursor down)
 *   **`d`**: Right (replaces `l` - default: move cursor right)
   
## Other
   
 *   **`x`**: Delete line (replaces `d` - default: delete
      character under cursor)
 *   **`e`**: Jump to word (replaces `i` - default: enter insert
      mode)
 *   **`R`**: Redo (replaces `<C-r>` - default: redo last change)
 *   **`Q`**: Record macro (replaces `q` - default: start/stop
      recording a macro)
 *   **`f`**: End of word (replaces `e` - default: move cursor to
      the end of the word)
 *   **`E`**: Insert new line above (replaces `O` - default: open
      a new line above the current line and enter insert mode)
   
 ## LSP (Language Server Protocol)
   
  *   **`K`**: Show type information (hover)
  *   **`<leader>hh`**: Open diagnostics (errors and warnings) in
      a floating window
  *   **`[d`**: Go to the previous diagnostic (error or warning)
  *   **`]d`**: Go to the next diagnostic (error or warning)
