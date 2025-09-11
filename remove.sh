git filter-branch --force --index-filter "git rm --cached --ignore-unmatch auth0.key.pub" --prune-empty --tag-name-filter cat -- --all
