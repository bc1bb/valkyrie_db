# EVE: Valkyrie – Warzone — SQL Database

A normalized relational database of **EVE: Valkyrie – Warzone** static game data,
built from the research dataset in `../01-ships.md` … `../06-progression-economy.md`.

- **`eve_valkyrie_warzone.sql`** — schema + data (SQLite 3 dialect; portable to Postgres/MySQL with minor tweaks). Idempotent: re-running drops and recreates everything.
- **`build.sh`** — builds `eve_valkyrie_warzone.db` (uses the `sqlite3` CLI if available, else the Python `sqlite3` module).
- **`eve_valkyrie_warzone.db`** — the built SQLite database (regenerable).

## Build

```bash
./build.sh
# or directly:
sqlite3 eve_valkyrie_warzone.db < eve_valkyrie_warzone.sql
# or with Python (no CLI needed):
python3 -c "import sqlite3;sqlite3.connect('eve_valkyrie_warzone.db').executescript(open('eve_valkyrie_warzone.sql').read())"
```

## Conventions

- **`era`** — `warzone` (2017), `original` (2016), `legendary`/`npc`/`event`, or `lore`.
- **`confidence`** — `high` | `medium` | `low`; with **`notes`**, flags uncertain or
  conflicting source data (the underlying official site has been offline since the
  Aug 2022 server shutdown, so some values are reconstructed from mirrors/press).

## Schema (25 tables)

| Table | Rows | Contents |
|---|---|---|
| `ship_class` | 7 | Assault/Heavy/Support/Covert (Warzone) + Fighter/Heavy/Support (2016) |
| `ship` | 44 | 13 Warzone hulls (full stats) + 17 original-2016 hulls (stat bars) + legendary/NPC/event |
| `ultra` | 13 | One Ultra super-ability per Warzone ship |
| `weapon` | 26 | Primaries, secondaries, missiles, beams, rails |
| `module` | 14 | Defensive/utility/mobility/EWAR abilities |
| `ship_loadout` | 39 | Primary/Secondary/Tertiary slot per Warzone hull → weapon/module |
| `drone_deployable` | 23 | Drones, mines, beams, EWAR, carrier subsystems, AI units |
| `game_mode` | 11 | PvP, co-op, and single-player Chronicles modes |
| `carrier_assault_stage` | 3 | Skirmish / Attack / Breach |
| `map` | 11 | Arenas across launch / update / Warzone eras |
| `faction` | 10 | Valkyrie, Schism + referenced New Eden factions |
| `character` | 5 | Rán Kavik, Fatal, the Rabbit, etc. |
| `voice_cast` | 4 | Credited voice actors |
| `named_entity` | 11 | Capital ships / stations / lore objects (Phoenix, Station 27, Nidhoggur…) |
| `place` | 7 | Systems / regions / battles (New Eden, Solitude, Esmes III…) |
| `recall_mission` | 4 | Single-player Recall campaign missions |
| `currency` | 4 | Silver/Visk, Gold, Class XP, Pilot Reputation |
| `salvage_tier` | 3 | Raw / Component / Prime |
| `rank_milestone` | 8 | Rank thresholds (cap 60) and what they gate |
| `cosmetic_type` | 6 | Paint jobs, decals, cockpits, suits, helmets, avatars |
| `cosmetic_item` | 6 | Named cosmetics (Drifter/Founder exclusives) |
| `reward_capsule` | 2 | Standard / Gold loot capsules |
| `daily_challenge_type` | 5 | Named challenge archetypes |
| `trophy` | 34 | Full PS4 trophy list (1 Platinum, 4 Gold, 11 Silver, 18 Bronze) |
| `dlc_edition` | 3 | Launch Bundle, Drifter Pack, Founder's Packs |

### Views

- **`v_warzone_roster`** — the 13 Warzone ships with class, stats, and Ultra.
- **`v_ship_full`** — every ship's Primary/Secondary/Tertiary loadout joined to weapon/module names.

## Example queries

```sql
-- The Warzone fleet at a glance
SELECT * FROM v_warzone_roster;

-- Heaviest tanks (armor + shields)
SELECT name, armor+shields AS bulk FROM ship
WHERE era='warzone' ORDER BY bulk DESC LIMIT 3;

-- Every Support-class ability/weapon
SELECT * FROM v_ship_full WHERE class='Support';

-- Which ships counter the cloaking Shadow?
SELECT s.name FROM ship s JOIN ship_loadout l ON l.ship_id=s.id
JOIN module m ON m.id=l.module_id WHERE m.name='Sonar';

-- All EWAR deployables and their source ship
SELECT name, source, function FROM drone_deployable WHERE category='ewar';

-- Trophies you earn from the Recall campaign
SELECT name, objective, trophy FROM recall_mission WHERE trophy IS NOT NULL;
```

## Known data caveats

- **Trophy tiers:** the 34-trophy *total* and the 1/4/11/18 Platinum/Gold/Silver/Bronze
  *split* are reliable, but sources disagree on the exact tier of a few trophies
  (e.g. *Sting Like A Bee*, *Heavy Metal*, *Master And Commander*, *Aerial Arsenal*,
  and 2 of the 4 Golds). Ambiguous rows carry `confidence='medium'`.
- **Numeric balance values** (cooldown seconds, exact DPS, HP) are partial; official
  ship pages that held them are offline. Per-ship display stats for the 13 Warzone hulls
  are present and high-confidence.
- **Original-2016 vs Warzone** hulls are distinct rosters; don't conflate. The exact
  hull-to-hull mapping between eras is undocumented.
