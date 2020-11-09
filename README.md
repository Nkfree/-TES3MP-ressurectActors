# -TES3MP-ressurectActors
- Rework of an unfinished (or improperly working) script for TES3MP 

## Installation

1. Download the ```main.lua``` and put it in */server/scripts/custom/resurrectActors*
2. Open ```customScripts.lua``` and add this code on separate line: ```require("custom.resurrectActors.main")```

## Configurables
- Actor refIds are divided into 3 categories: A, B, C (that came with the original script),
each category resurrects in different amount of seconds which can be set to own liking (currently - A: 60s, B: 90s, C: 1s)
- New categories can be - of course - added
