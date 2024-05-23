#!/bin/bash

# Add a new user account
add_account() {
  local id=$1
  local alterId=$2
  echo "{\"id\":\"$id\",\"alterId\":$alterId}," >> accounts.txt
}

# Remove an existing user account
remove_account() {
  local id=$1
  sed -i "/\"id\":\"$id\"/d" accounts.txt
}

# List all user accounts
list_accounts() {
  cat accounts.txt
}

# Main function
main() {
  case "$1" in
    add)
      add_account "$2" "$3"
      ;;
    remove)
      remove_account "$2"
      ;;
    list)
      list_accounts
      ;;
    *)
      echo "Usage: $0 {add|remove|list} [ID] [alterId]"
      exit 1
      ;;
  esac
}

# Call main function with command line arguments
main "$@"
