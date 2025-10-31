dirs=(
    "~/.local/bin"
    "~/bin"
    "~/Applications/odin"
    "~/.local/share/yabridge"
)

# echo "${dirs[*]}"

PATH=$PATH:$(
  IFS=":"
  echo "${dirs[*]}"
)
export PATH

