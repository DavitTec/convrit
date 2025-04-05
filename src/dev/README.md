# Developing CONVRit

*Version 0.0.2*



## Description

[./init_dev.sh](./init_dev.sh) a bash script that watches a Folder for changes, any new additions of one or more files

## Installation

TODO

Run the following script to initialise the work space folder

1. download the following script first:
   [(https://github.com/DavitTec/convrit/src/dev/init_dev.sh)](https://github.com/DavitTec/convrit/blob/master/src/dev/init_dev.sh)

2. make it executable

   ```bash
   chmod +x ./init_dev.sh
   ```

3.  Run the script with no options

   1. this will setup the project for development, Nodejs >20, pnmp, bash and ....

   ```bash
   ./init_dev.sh
   ```

4. Having fun



### Initialise

Initialise this development

```bash
#!/bin/bash
# init_dev.sh   (a run only once setup script for development)
# author: David Mullins
# version 0.0.1
# Setup script for a new GITHUB project
#  with versioning and testing tools
# Run this in an empty directory

unset PROJECT_NAME

author="David Mullins"
site="https://davit.ie"

# Default project name if not provided
#  defaultProjectName="<the name of folder>"
defaultProjectName="convrit"

NODE_VERSION="16" # Adjust based on your system (@node>20 This where we start)

####### STATIC VARIABLES #######

####### ENV VARIABLES #######

# create a ".env_dev" for this initialisation  

####### FUNCTIONS #######


####### MAIN #######
echo "Setting up $PROJECT_NAME..."
```

