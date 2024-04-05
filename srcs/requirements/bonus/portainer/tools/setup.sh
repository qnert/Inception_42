#!/bin/bash

echo -n $PORTAINER_PWD > pwd

./portainer/portainer --admin-password-file pwd
