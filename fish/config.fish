#────────────────────────────────────────────────
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
set -gx EDITOR nvim
set -gx VISUAL nvim

# Manual pages via nvim
set -gx MANPAGER "nvim +Man!"
# set -gx OPENAI_API_KEY (cat ~/openai_key | string trim) 
set -gx OPENROUTER_API_KEY (cat ~/openrouter_key | string trim) 
set -Ux fish_user_paths $fish_user_paths /Users/shivom/Library/Python/3.14/bin/
set -gx OPENCODE_EXPERIMENTAL_MARKDOWN true

set -g theme_color_scheme dracula

# My color scheme
set -U fish_color_normal normal
set -U fish_color_command F8F8F2
set -U fish_color_quote F1FA8C
set -U fish_color_redirection 8BE9FD
set -U fish_color_end 50FA7B
set -U fish_color_error FF5555
set -U fish_color_param 5FFFFF
set -U fish_color_comment 6272A4
set -U fish_color_match --background=brblue
set -U fish_color_selection white --bold --background=brblack
set -U fish_color_search_match bryellow --background=brblack
set -U fish_color_history_current --bold
set -U fish_color_operator 00a6b2
set -U fish_color_escape 00a6b2
set -U fish_color_cwd green
set -U fish_color_cwd_root red
set -U fish_color_valid_path --underline
set -U fish_color_autosuggestion BD93F9
set -U fish_color_user brgreen
set -U fish_color_host normal
set -U fish_color_cancel -r
set -U fish_pager_color_completion normal
set -U fish_pager_color_description B3A06D yellow
set -U fish_pager_color_prefix white --bold --underline
set -U fish_pager_color_progress brwhite --background=cyan

# set -gx PYENV_ROOT $HOME/.pyenv
# set -U fish_user_paths $PYENV_ROOT/bin $fish_user_paths


if status is-interactive

    # set -Ux PYENV_ROOT $HOME/.pyenv
    # test -d $PYENV_ROOT/bin; and fish_add_path $PYENV_ROOT/bin
    # Starship prompt
    # if type -q starship
    #     starship init fish | source
    # end

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


# opencode
fish_add_path /Users/shivom/.opencode/bin

# >>> grok installer >>>
fish_add_path $HOME/.grok/bin
# <<< grok installer <<<
