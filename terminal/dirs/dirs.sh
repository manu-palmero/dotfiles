dirs=(
    "~/Applications/odin"
)

# echo "${dirs[*]}"

PATH=$PATH:$(
  IFS=":"
  echo "${dirs[*]}"
)
export PATH

