#!/bin/bash

OLD_OWNER_NAME="isaac-cf-wong"

OLD_REPO_NAME="physical-review-research-article-latex-template"
OLD_REPO_NAME_NORMALIZED="${OLD_REPO_NAME//-/_}"

# 1. Prompt the user for the new owner name
read -p "Enter the new owner name: " NEW_OWNER_NAME

# 2. Prompt the user for the new package name
read -p "Enter the new package name: " NEW_REPO_NAME

# 3. Check if the user actually entered something (Safety check)
if [ -z "$NEW_REPO_NAME" ]; then
    echo "Error: No package name entered. Exiting."
    exit 1
fi

NEW_REPO_NAME_NORMALIZED="${NEW_REPO_NAME//-/_}"

if sed --version >/dev/null 2>&1; then
    # GNU sed (Linux)
    SED_INPLACE=(-i)
else
    # BSD sed (macOS)
    SED_INPLACE=(-i '')
fi

# 4. Check if the owner is set. If not, use the original name.
if [ -z "$NEW_OWNER_NAME" ]; then
    echo "Warning. Owner name is empty, use the original owner name."
else
    sed "${SED_INPLACE[@]}" "s/$OLD_OWNER_NAME/$NEW_OWNER_NAME/g" cliff.toml
fi

find . -type d \( -name ".git" -o -name "__pycache__" -o -name ".venv" -o -name "node_modules" -o -name ".pytest_cache" \) -prune \
    -o -type f \( -name "*.py" -o -name "*.md" -o -name "*.toml" -o -name "LICENSE" \) \
    -exec sed "${SED_INPLACE[@]}" -e "s/$OLD_REPO_NAME/$NEW_REPO_NAME/g" -e "s/$OLD_REPO_NAME_NORMALIZED/$NEW_REPO_NAME_NORMALIZED/g" {} +

mv "src/$OLD_REPO_NAME_NORMALIZED" "src/$NEW_REPO_NAME_NORMALIZED"
