# Subject Pattern Examples (Lua)

Small codebase demonstrating the Subject Pattern in action using simple Lua scripts.

## Requirements
Lua 5.2+ (interpreter acts as compiler/runner).

## Installation

### macOS
1. Homebrew:
    ```bash
    brew install lua
    ```
2. From source (optional):
    ```bash
    curl -R -O https://www.lua.org/ftp/lua-5.4.7.tar.gz
    tar -xzvf lua-5.4.7.tar.gz
    cd lua-5.4.7
    make macosx
    sudo make install
    ```

### Windows
1. Chocolatey:
    ```powershell
    choco install lua
    ```
2. Scoop:
    ```powershell
    scoop install lua
    ```
3. Manual (source):
    - Install MSYS2 or Visual Studio Build Tools.
    - Download source: https://www.lua.org/ftp/
    - Follow `src/Makefile` hints (use `mingw` target under MSYS2):
      ```bash
      make mingw
      ```
    - Add lua.exe directory to PATH.

## Verify Installation
```bash
lua -v
```

## Run the Example
From repository root:
```bash
lua Main.lua
```

## Updating Lua
- macOS: `brew upgrade lua`
- Windows (Chocolatey): `choco upgrade lua`

## Notes
Focus: observing state changes and notifying registered listeners.