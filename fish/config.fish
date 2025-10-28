# ────────────────────────────────────────────────
# 🌿 Environment Variables
# ────────────────────────────────────────────────

# Homebrew
#


set -gx PATH /opt/homebrew/bin $PATH
set -gx CARGO /Users/shivom/.cargo/bin $PATH
set -gx HOMEBREW_NO_AUTO_UPDATE 1

# Bun
set -gx BUN_INSTALL $HOME/.bun
set -gx PATH $HOME/.codeium/windsurf/bin $BUN_INSTALL/bin $PATH

# Manual pages via nvim
set -gx MANPAGER "nvim +Man!"
set -gx OPENAI_API_KEY (cat ~/.openai_key) 
set -gx OPENROUTER_API_KEY (cat ~/.openrouter_key) 

# set -gx PYENV_ROOT $HOME/.pyenv
# set -U fish_user_paths $PYENV_ROOT/bin $fish_user_paths


if status is-interactive

    # set -Ux PYENV_ROOT $HOME/.pyenv
    # test -d $PYENV_ROOT/bin; and fish_add_path $PYENV_ROOT/bin
    # Starship prompt
    if type -q starship
        starship init fish | source
    end

    # Aliases
    alias vi nvim
    alias vim nvim
    alias g++ "g++ -std=c++17"
    function get_idf
        bash -c "source $HOME/esp/esp-idf/export.sh && exec fish"
    end
    # alias get_idf "."' $HOME/esp/esp-idf/export.sh'
    alias pi-mount 'sshfs thisawesomepi.local:/home/shivom/pi ~/pi -o defer_permissions'
    alias pi-unmount 'diskutil unmount ~/pi'


    # source (pyenv virtualenv-init -|psub)
    # pyenv init - fish | source
    # pyenv virtualenv-init - fish >> ~/.config/fish/config.fish

    # Lazy Bun initialization
    if test -s "$BUN_INSTALL/_bun"
        function bun --wraps=bun
            functions -e bun
            source $BUN_INSTALL/_bun
            bun $argv
        end
    end

    # Tab completion + autosuggestions
    bind \t accept-autosuggestion

    # Optional: Vi key bindings
    # fish_vi_key_bindings

    # Disable fish greeting
    #
    set fish_greeting ""

end

