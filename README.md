# Developer Flakes

Simple and reusable nix flakes to setup developer environments declaratively and reproducibly

Mainly geared towards purely functional languages that I like to use.

It is recommended to have an IDE already set up with your preferred editing tools for each environment.

Here is a simple bash script you can add to your `.bashrc` to add a `dev` command to enter these environments from anywhere. 

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
      echo "Don't forget to cd into your projects directory. Have a great day!"
      ;;
    2)
      (cd ~/Documents/developerEnvs/elixirDev && nix develop)
      echo "Don't forget to cd into your projects directory. Have a great day!"
      ;;
    3)
      (cd ~/Documents/developerEnvs/haskellDev && nix develop)
      echo "Don't forget to cd into your projects directory. Have a great day!"
      ;;
    # Add more cases here...
    *)
      echo "Invalid choice"
      ;;
  esac
}
```
