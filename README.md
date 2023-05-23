# Developer Flakes

Simple and reusable nix flakes to setup developer environments declaratively and reproducibly

Here is a simple bash script to add a `dev` command to enter these environments from anywhere


```bash
# Developer Environment Function
function dev() {
  echo "Select an environment:"
  echo "1. Web"
  echo "2. Elixir"
  echo "3. Haskell"
  # Add more options here...

  read -p "Enter the number of your choice: " choice

  case $choice in
    1)
      (cd ~/Documents/developerEnvs/webDev && nix develop)
      ;;
    2)
      (cd ~/Documents/developerEnvs/elixirDev && nix develop)
      ;;
    3)
      (cd ~/Documents/developerEnvs/haskellDev && nix develop)
      ;;
    # Add more cases here...
    *)
      echo "Invalid choice"
      ;;
  esac
}
```
