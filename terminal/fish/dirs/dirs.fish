set -l __dirs ~/.local/bin ~/bin ~/Applications/odin ~/.local/share/yabridge

for d in $__dirs
    if not contains -- $d $PATH
        set -gx PATH $PATH $d
    end
end
