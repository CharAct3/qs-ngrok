#!/bin/bash
ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i hosts qs-ngrok/start-ngrok.yml
