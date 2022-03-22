#!/bin/bash
# Set repo
export BORG_REPO='ssh://USER@example.com:PORT/path/to/meshcentral_data_repo'

# Stop container
/usr/bin/docker-compose -f /path/to/compose.yml --project-directory /path/to/ down

# Run backup
/usr/bin/borg create --stats ::$(hostname)-$(date -I) /path/to/docker/volumes/meshcentral_data/

# Prune backups
/usr/bin/borg prune -v --list --keep-daily 7 --keep-weekly 1

# Change repo
export BORG_REPO='ssh://USER@example.com:PORT/path/to/meshcentral_user_files'

# Run Backup
/usr/bin/borg create --stats ::$(hostname)-$(date -I) /path/to/docker/volumes/meshcentral_user_files/

# Prune backups
/usr/bin/borg prune -v --list --keep-daily 7 --keep-weekly 1

# Start container
/usr/bin/docker-compose -f /path/to/compose.yml --project-directory /path/to/ up -d
