#!/bin/bash
set -e

REPO_NAME="winchester-united"
FOLDER="/Users/igharib/Claude/spare-sales"

echo "==> Renaming logo file..."
cp "$FOLDER/winchester United.png" "$FOLDER/winchester-united.png" 2>/dev/null || true

echo "==> Initialising git repo..."
cd "$FOLDER"
git init
git add winchester_calendar.html winchester-united.png push_to_github.sh
git commit -m "Winchester United club calendar"

echo "==> Creating GitHub repo and pushing..."
gh repo create "$REPO_NAME" --public --source=. --remote=origin --push

echo ""
echo "Done. Your site is live at:"
echo "  https://${REPO_NAME}.vercel.app  (after connecting Vercel)"
echo "  GitHub: https://github.com/$(gh api user --jq .login)/${REPO_NAME}"
