#!/bin/bash
# Set repo
export BORG_REPO='ssh://USER@example.com:PORT/path/to/nextcloud_data_repo'

# Switch into maintenance mode
/usr/bin/docker exec -it -u www-data nextcloud php occ maintenance:mode --on

# Wait 5 minutes
sleep 300

# Stop container
/usr/bin/docker-compose -f /path/to/compose.yml --project-directory /path/to/ down

# Run backup
/usr/bin/borg create --stats ::$(hostname)-$(date -I) /path/to/docker/volumes/nextcloud_data/

# Prune backups
/usr/bin/borg prune -v --list --keep-daily 7 --keep-weekly 1

# Change repo
export BORG_REPO='ssh://USER@example.com:PORT/path/to/nextcloud_html_repo'

# Run backup
/usr/bin/borg create --stats ::$(hostname)-$(date -I) /path/to/docker/volumes/nextcloud_html/

# Prune backups
/usr/bin/borg prune -v --list --keep-daily 7 --keep-weekly 1

# Change repo
export BORG_REPO='ssh://USER@example.com:PORT/path/to/nextcloud_mariadb_repo'

# Run backup
/usr/bin/borg create --stats ::$(hostname)-$(date -I) /path/to/docker/volumes/nextcloud_mariadb/

# Prune backups
/usr/bin/borg prune -v --list --keep-daily 7 --keep-weekly 1

# Start container
/usr/bin/docker-compose -f /path/to/compose.yml --project-directory /path/to/ up -d

# Disable maintenance mode
/usr/bin/docker exec -it -u www-data nextcloud php occ maintenance:mode --off