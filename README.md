# smart-runner.nvim

A simple and intelligent code runner plugin for Neovim, designed to execute the current file with a single key press.

It automatically detects the file type and chooses the correct execution command, with special support for Maven projects and automatic cleanup of compiled artifacts.

## ✨ Features

  * **One-Key Execution:** Run your code with a single, configurable keymap (defaults to `<F5>`).
  * **Automatic Language Detection:** Out-of-the-box support for Python, Java, C, C++, JavaScript, Go, Rust, and more.
  * **Smart Maven Support:** Automatically detects if a Java file is part of a Maven project and runs `mvn compile exec:java` instead of the standard `javac`.
  * **Automatic Cleanup:** Removes compiled artifacts (`.class` files, binaries, etc.) after execution to keep your working directory clean.
  * **Highly Configurable:** Easily change the keymap or add support for new languages.

## 💾 Installation

It is recommended to use a modern plugin manager like [lazy.nvim](https://github.com/folke/lazy.nvim).

### For Neovim Users (with `lazy.nvim`)

Add the following to your Neovim plugin configuration:

```lua
{
  "mikaelgois/smart-runner.nvim",
  -- 'opts' is optional and is used to configure the plugin.
  opts = {},
}
```

### For LunarVim Users

Add the plugin to your `lvim.plugins` list in your `config.lua` file:

```lua
-- In your ~/.config/lvim/config.lua
lvim.plugins = {
  -- ... other plugins
  
  {
    "mikaelgois/smart-runner.nvim",
    opts = {} 
  }
}
```

## ⚙️ Configuration (Optional)

You can customize the plugin by passing an `opts` table when you `setup` or declare the plugin.

**Full Configuration Example:**

```lua
{
  "mikaelgois/smart-runner.nvim",
  opts = {
    -- Change the default keymap from <F5> to <leader>r
    keymap = "<leader>r",
    
    -- Modify the commands table
    commands = {
      -- Override an existing command (e.g., use 'python' instead of 'python3')
      py = "python %f",
      
      -- Add a new command for an unsupported language (e.g., Zig)
      zig = "zig run %f",
      
      -- Remove support for a language by setting it to nil
      php = nil, 
    }
  }
}
```

### Command Placeholders

When defining custom commands, you can use the following placeholders:

  * `%f`: Will be replaced by the **filename** with its extension (e.g., `script.py`).
  * `%c`: Will be replaced by the **class name** or filename without extension (e.g., `HelloWorld`).
  * `%e`: Will be replaced by the **executable name**, usually the filename without extension (e.g., `HelloWorld`).

## 🚀 Usage

1.  Open any file from a supported language.
2.  Press the configured key (defaults to `<F5>`).
3.  A new terminal window will split open and execute your code.

## 📜 License

This project is licensed under the **GPL-3.0 License**. See the `LICENSE` file for more details.
