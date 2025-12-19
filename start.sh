#!/bin/bash

echo "Starting tmate session..."
echo "================================"

# tmate indítása és session info kiírása
tmate -F &
sleep 5

# Session info megjelenítése
tmate display -p "SSH: #{tmate_ssh}"
tmate display -p "Web: #{tmate_web}"

echo "================================"
echo "tmate session is running!"

# Tartsd életben
tail -f /dev/null
```

### `.railwayignore` (opcionális)
```
.git
.github
README.md
