dirs=(
    "~/Applications/odin"
    "~/.local/share/yabridge"
    "~/.local/bin"
)

# echo "${dirs[*]}"

PATH=$PATH:$(
  IFS=":"
  echo "${dirs[*]}"
)
export PATH

