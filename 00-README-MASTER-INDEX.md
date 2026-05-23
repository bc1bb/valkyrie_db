# EVE: Valkyrie – Warzone — Static Game Data (Master Index)

**Game:** *EVE: Valkyrie* (CCP Games, 2016), originally VR-exclusive (Oculus Rift, PlayStation VR, HTC Vive), and its major free 2017 update **EVE: Valkyrie – Warzone** (PS4/PC, added flatscreen/non-VR play + full cross-play). A multiplayer space-combat shooter set in the **EVE Online / New Eden** universe.
**Online servers shut down:** 5 August 2022 (game no longer playable online).
**Compiled:** 2026-05-23 from public sources (Fandom wikis, PlayStation Blog, CCP dev blogs, Steam guides, press coverage, EVE lore wikis). The official `evevalkyrie.com` is offline; some "official" facts came from a surviving Azure staging mirror and search-engine caches — flagged in each file.

> **Two distinct rosters.** The 2016 launch had **3 classes (Fighter / Heavy / Support)** with one set of hulls. **Warzone (2017)** renamed Fighter → **Assault**, added the **Covert** class, and replaced/renamed most hulls into a **13-ship, 4-class** roster. Do not conflate them. The Warzone roster is the canonical "Warzone" data; the 2016 roster is kept for cross-reference.

---

## Files in this dataset

| File | Contents |
|---|---|
| `00-README-MASTER-INDEX.md` | This file — overview, reconciled facts, full named-entity glossary. |
| `01-ships.md` | All ships/fighters, both rosters, full stats, classes, Ultras, skins. |
| `02-mechanics-modes.md` | Game modes, combat mechanics, HUD, Carrier Assault stages, campaign. |
| `03-drones-deployables.md` | Drones, mines, beams, fields, EWAR, carrier subsystems, AI/NPC units. |
| `04-weapons-loadouts.md` | Primary/secondary weapons, modules, Ultras, upgrade & salvage system. |
| `05-maps-lore-entities.md` | Maps/arenas, factions, characters, voice cast, story, place names. |
| `06-progression-economy.md` | XP/ranks, currencies, cosmetics, loot capsules, challenges, trophies, DLC. |

---

## Canonical Warzone (2017) Ship Roster — 13 ships, 4 classes

| Class | Ship | Role | Armor | Shields | Base/Max Speed | Ultra |
|---|---|---|---|---|---|---|
| **Assault** | Wraith (Mk6) | All-round | 226 | 110 | 200/600 | Mjolnir Missile |
| **Assault** | Jackal | Brawler | 210 | 168 | 140/600 | Matter Injector |
| **Assault** | Strix | Sniper | 112 | 224 | 200/500 | Plasma Vent |
| **Assault** | Yurei | Interceptor | 110 | 112 | 212/750 | Mayhem |
| **Heavy** | Scarab | Tank | 336 | 336 | 200/400 | Void Storm |
| **Heavy** | Vulcan | Brute | 400 | 400 | 200/400 | Cocoon |
| **Heavy** | Corvus | Disruptor | 224 | 448 | 200/500 | Silence |
| **Heavy** | Hydra | Gunner | 448 | 224 | 200/500 | Spectre Bond |
| **Support** | Banshee | Engineer | 124 | 228 | 300/600 | Fate's Call |
| **Support** | Nagi | Medic | 124 | 228 | 300/600 | Radiant Burst |
| **Support** | Medusa | Defender | 228 | 124 | 300/600 | Death's Grasp |
| **Support** | Kirin | Saboteur | 228 | 124 | 300/600 | Dragon's Thorn |
| **Covert** | Shadow | Ambush (cloak) | 140 | 60 | 400/600 | Violent Whisper |

*All 13 ships are unlocked from the start in Warzone; progression is per-hull XP feeding a 15-node upgrade tree (Attack/Defense/Tech/Mobility). Full per-ship weapons/abilities in `01-ships.md` and `04-weapons-loadouts.md`.*

---

## Game modes (quick reference)

**Multiplayer (8v8 PvP, also vs AI):** Team Deathmatch · Control (3 capture points A/B/C) · Carrier Assault (3-stage trench-run to destroy enemy Carrier) · Extraction (relic CTF, new in Warzone) · Wormholes (rotating weekend event ruleset).
**Single-player "Chronicles":** Training · Recall (story missions) · Scout (free exploration) · Survival (wave defense — Novice/Pro) · Test Arena.

Full rules, scoring, and Carrier Assault stage breakdown in `02-mechanics-modes.md`.

---

## COMPLETE NAMED-ENTITY GLOSSARY

A consolidated list of every proper noun / in-game name found, for use as static game-data reference. (See individual files for context and sourcing.)

### Ship classes
Assault (formerly Fighter) · Heavy · Support · Covert · *(legacy: Fighter, Heavy, Support)*

### Warzone ships (13)
Wraith · Jackal · Strix · Yurei · Scarab · Vulcan · Corvus · Hydra · Banshee · Nagi · Medusa · Kirin · Shadow

### Original 2016 ships (cross-reference)
- **Fighters:** Wraith · Dominator · Accord · Assuage
- **Heavies:** Spectre · Rhino · Goliath · Cyclone · Storm
- **Support:** Banshee · Guardian · Warden · Sentinel · Revenant · Siren · Phantom
- **Legendary / Founder Wraith variants:** Squadron 33 / S-33 Wraith (Oculus) · S4 Wraith (PSVR) · MkV Wraith (Vive) · Bounty
- **NPC / enemy hulls:** Templar · Cyclops · Merlin · Dragonfly · Blackbird · Hookbill · Kestrel
- **Event/other:** Firbolg · Caldari Wraith · Infected

### Ultra abilities (13 Warzone)
Mjolnir (Missile) · Matter Injector · Plasma Vent · Mayhem · Void Storm · Cocoon · Silence · Spectre Bond · Fate's Call · Radiant Burst · Death's Grasp · Dragon's Thorn · Violent Whisper

### Weapons & primaries
Assault Cannons · Ripper (+ Alt) · Pulse Laser · Pulse Cannon(s) · Flak Cannon · Tri-Flak Cannon · Laser Gatling · Rail Gun / Rail Cannon · Phaser · Twin Linked Carbine · Shard Rifle · Plasma Beam · Gatling Guns · Auto Cannons · Head-Tracked Missiles · Missile Launcher / Missile Pod · Trine Missiles · Mortar *(legacy)*

### Modules / abilities / EWAR
ECM (chaff) · EMS (EMP shield) · Overshield / Overshield Beam · Self Repair · Repair/Heal Beam · Drain Beam · Capacitor Restore Beam · Microwarp Drive (MWD) · Dash · Sonar · HUD Scrambler · Mark Target · Cloak · Countermeasures · Decoy

### Drones / deployables / units
Capture (Control) Drone · Spiderbots · Decoy · Proximity Mines · Dragon's Thorn (sticky bomb) · Violent Whisper (nova bomb) · automated Gun/Machine-gun Turrets · Flak Cannons (carrier) · Missile Launchers (carrier) · Boost/Speed Boost Gates · Power Relay Stations · Cooling Nodes · Power Core · Carrier Shields · launch tubes (clone respawn)

### Maps / arenas
Necropolis · Shipyard · Cathedral · Forge · Crossroads (Station 27) · Gateway · Solitude · Fleet · Outpost · Wormholes (rotating) · *Convoy (uncertain, preview-era)*

### Factions
- **Game-original:** Valkyrie (player faction) · Schism (antagonist faction)
- **New Eden / EVE Online referenced:** Caldari State · Gallente Federation · Amarr Empire (Sarum Family) · Minmatar Republic · Guristas Pirates · Sisters of EVE · Drifters

### Characters & voice cast
- **Rán Kavik** — leader of the Valkyrie, voiced by **Katee Sackhoff**
- **Jirai "Fatal" Laitanen** — leader of the Schism (canon EVE Guristas co-founder, with Korako "the Rabbit" Kosakami)
- Supporting cast credited: Rich Keeble · Gabrielle Fritz · Paul-William Mawhinney

### Named ships/stations in lore
Phoenix (supercarrier, docked at Shipyard) · Station 27 (Crossroads) · Stratios / Nestor (Sisters of EVE ships seen at Fleet) · the Schism Carrier and Valkyrie Carrier (Carrier Assault)

### Currencies & economy
Silver ("Visk") — earned in-game · Gold / Gold Bonds — removed as shop currency in Warzone · Class XP (per-ship) · Salvage (Raw / Component / Prime tiers) · Reward Capsules (loot boxes) · Pilot Reputation / Pilot Rank (cap raised 50 → 60) · Valkyrie League (skill-based ranked, alpha)

### Cosmetics
Paint jobs (Common/Rare/Epic) · decals · cockpit interiors · pilot suits · helmets · forum avatars · named examples: "Pulse" Shadow paint + "Voltaic" suit/helmet (Drifter Pack)

---

## Key reconciliations & corrections (cross-agent)

- **Ship classes renamed:** "Fighter" (2016) → **"Assault"** (Warzone). The original brief's guess of class names did not match; Warzone classes are Assault/Heavy/Support/Covert.
- **Spectre & Maelstrom:** "Spectre" was a 2016 Heavy hull; in Warzone "Spectre" survives only as the **Spectre Bond** Ultra (Hydra). "Maelstrom" (with a Mortar) appears in some glossaries but is **not** one of the confirmed 13 Warzone hulls.
- **John Rhys-Davies:** named in the original brief, but **no evidence** he voiced anyone in this game. Confirmed lead is Katee Sackhoff (Rán). Likely a misattribution.
- **User-guessed names** (Fenris, "Spook," Maraxos, Wisp, Gorgon) — not confirmed as Warzone hulls; the real roster is the 13 above.
- **Carrier names:** the Schism carrier is referenced; the Valkyrie-side carrier name was not firmly confirmed.

## Outstanding gaps (consolidated)
- No published per-ship **manufacturer/faction** attribution (only Shadow = "Drifter technology").
- Exact **numeric** balance values for many weapons/modules and the original→Warzone hull mapping are undocumented.
- Full **Recall campaign mission list** (confirmed: *The First Assault*, *Station 27*, *Esmes III*, *Convoy*).
- Wormhole-update drone names; complete trophy tiering; League season/reward structure; full original 2016 NPC bestiary.

*See the "Gaps / Could Not Confirm" section at the end of each individual file for the detailed, per-topic uncertainty list.*
