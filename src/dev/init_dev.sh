#!/bin/bash
# chmod +x ./src/dev/init_dev.sh
# author: David Mullins
# version 0.0.1
# Setup script for a new GITHUB project
#  with versioning and testing tools
# Run this in an empty directory

unset PROJECT_NAME

# author="David Mullins"
# site="https://davit.ie"

# Default project name if not provided
#  defaultProjectName=" the name of folder"
# "
# defaultProjectName="convrit"

# NODE_VERSION="16" # Adjust based on your system

####### STATIC VARIABLES #######
NODE_VERSION="20" # Adjust based on your system


####### ENV VARIABLES #######

# create a ".env_dev" for this inialisation  

####### FUNCTIONS #######

# Install Node.js if not present (optional, comment out if already installed)
# nvm install "$NODE_VERSION" && nvm use "$NODE_VERSION"
node_install () {

NODE_VERSION="${1:-$NODE_VERSION}"
#Check if package.json is installed
if [ -f "package.json" ]; then
  echo "package.json already exists. Skipping initialization."
else
  echo "package.json not found. Initializing project..."
  pnpm init -y
fi

# Install node 
  echo "Installing Node. $NODE_VERSION.."
  #Check if Node.js is installed
  if ! command -v node &> /dev/null
  then
      echo "Node.js could not be found. Installing..."
      # Install Node.js using nvm
      nvm install "$NODE_VERSION"
      nvm use "$NODE_VERSION"
  else
      echo "Node.js is already installed."
  fi
  # Check if pnpm is installed
  if ! command -v pnpm &> /dev/null
  then
      echo "pnpm could not be found. Installing..."
      # Install pnpm globally
      npm install -g pnpm
  else
      echo "pnpm is already installed."
  fi
  # 



}

# setup helpfunction
help_function() {
  echo "Usage: $0 $PROJECT_NAME"
  echo
  echo "Options:"
  echo "  $PROJECT_NAME : a bash script that watches a Folder for changes to convert file"
  echo
  echo "Example:"
  echo "  $0 my_project"
    echo "  -h : Show this help message"
  echo "  -i : Install dependencies"
  echo "  -r : Remove dependencies"
  echo "  -n : Specify Node.js version (default: $NODE_VERSION)"
  echo
   echo "  more to do here"


}


####### MAIN #######
echo "Setting up $PROJECT_NAME..."
echo "This script will install Node.js and pnpm if not already installed."
echo "You can specify a different Node.js version using the -n option."
echo "You can also install or remove dependencies using the -i and -r options."
echo "For more information, run $0 -h."
echo ".."
echo -n " Are you  sure you want to continue? (y/n): "
read -r answer
if [[ "$answer" != "y" ]]; then
  echo "Exiting..."
  exit 0
fi

####### OPTIONS #######
# Parse command-line arguments
while getopts "hirn:" opt; do
  case $opt in
    h)
      help_function
      exit 0
      ;;
    i)
      echo "Installing dependencies..."
      node_install
      exit 0
      ;;
    r)
      echo "Uninstalling dependencies..."
      # Add uninstallation logic here
      exit 0
      ;;
    n)
      NODE_VERSION=$OPTARG
      echo "Setting Node.js version to $NODE_VERSION..."
      node_install "$NODE_VERSION"
      exit 0
      ;;
    *)
      echo "Invalid option: -$OPTARG" >&2
      help_function
      exit 1
      ;;
  esac
done

# check if the script is run with root privileges
if [ "$EUID" -ne 0 ]; then
  echo "Please run as root or use sudo."
  exit 1
fi
# Check if the script is run in a git repository
if [ ! -d ".git" ]; then
  echo "This script should be run inside a git repository."
  exit 1
fi













