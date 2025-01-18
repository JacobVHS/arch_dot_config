#!/bin/bash
# next_empty_workspace.sh
used_workspaces=$(hyprctl workspaces | awk '{print $1}' | tr -d '[:space:]')
next_workspace=1

# Loop to find the next unused workspace
while [[ $used_workspaces == *"$next_workspace"* ]]; do
  ((next_workspace++))
done

# Switch to the next unused workspace
hyprctl dispatch workspace $next_workspace
