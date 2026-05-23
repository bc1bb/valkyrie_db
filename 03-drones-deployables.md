# EVE: Valkyrie – Warzone — Drones, Deployables, Turrets, Mines & AI Units

**Game:** EVE: Valkyrie (2016) / EVE: Valkyrie – Warzone (2017), CCP Games. VR + flatscreen multiplayer space-combat shooter.
**Scope of this document:** All player-deployable units (drones, mines, spiderbots, decoys, beams, fields), all environmental/AI deployables (carrier turrets, cooling nodes, power core, shields), and AI/NPC units in PvE/co-op and Carrier Assault.
**Compiled:** 2026-05-23. **Server status note:** Live servers were shut down on **5 Aug 2022**; the official site (`evevalkyrie.com`) is largely offline, so much primary data here is reconstructed from archived dev blogs, Steam community guides (which mirror official ship-tutorial text), and the EVE Fandom wiki.

> **Important reliability note.** Several "deployables" in Valkyrie are technically *abilities/secondary weapons* rather than persistent autonomous units. I have tried to classify them honestly. Where a source is a community guide that quotes official tutorial text verbatim, I treat it as reliable. Conflicts and unconfirmed items are flagged inline and collected at the end.

---

## 1. Terminology / how "deployables" work in this game

EVE: Valkyrie is an arcade dogfighter, not a base-builder. "Deployables" are mostly **ability slots** on a ship loadout. Each ship has four loadout slots:

- **Primary** — main gun
- **Secondary** — a second weapon or utility (missiles, beam, etc.)
- **Tertiary** — utility/defensive ability (ECM, EMS, self-repair, HUD scrambler, etc.)
- **Ultra** — a powerful cooldown "ultimate"

Deployable/summoned units appear mostly in the **Support** class (spiderbots, mines, beams) and as **environmental AI** in **Carrier Assault**. The four classes are **Assault, Heavy, Support, Covert**. Warzone's "next-gen fleet" was **13 unique ships** (4 Assault, 4 Heavy, 4 Support, 1 Covert); the *original* EVE: Valkyrie had ~23 ships and CCP narrowed the roster for Warzone. Some legacy ship names (Revenant, Spectre, Maelstrom, etc.) still appear in guides — see notes.

---

## 2. DRONES & DRONE-LIKE DEPLOYABLES

### 2.1 Capture Drones (Control mode & Carrier Assault) — universal
The most prominent "drone" in the game. **Every ship can deploy one.**

| Property | Detail |
|---|---|
| Name | Capture Drone / Control Drone (referred to simply as "a drone") |
| Function | Fly within range of a Control Point / Power Relay Station and deploy; the drone gradually **captures the point** for your team while you fly free and fight |
| Limit | **One drone per player at a time**; restocks after a cooldown |
| Vulnerability | Enemies can shoot down your drone; you must protect yours and destroy theirs |
| Effect of capture | Captured points drain the enemy **clone pool / resources** faster; capturing 2 of 3 points in Carrier Assault disables the enemy carrier's shields |
| Used in | **Control** mode and **Carrier Assault** (Skirmish stage) |

Supports are noted as the best "drone droppers" because they are fast and reach points quickly.
Sources: official Support-class article (relayed), Control Points article, Carrier Assault dev blog.

### 2.2 Spiderbots — Support class (offensive/healing drones)
The clearest true "drone" deployable. Small robotic units that attach to ships.

| Property | Detail |
|---|---|
| Name | **Spiderbots** ("adorable robot arachnids") |
| Function | A deployed cloud of bots that **attaches to any passing ship**: **heals friendlies** OR **damages enemies** |
| Offensive limit | Against enemies they **only degrade SHIELDS, not armor** (limited offensive value) |
| Defensive use | Deploying them also **breaks incoming missile lock** (counter-measure) |
| First/primary ship | **Banshee** (Support) — available from the start, Spiderbots are its **Tertiary** |
| Cap | All "drop" deployables (mines/spiderbots) cap at **3 active**; a 4th destroys the oldest |

Sources: Steam "Support Ship Guide" (mirrors official text), official "Mini Masterclass – Mines and Spiderbots," Fandom Weapons page (snippet).

### 2.3 "Fancy new Drones" (Wormholes update, Feb 2017)
The Wormholes update added new Valkyrie-specific drone assets to the game. The dev blog explicitly states "the plan was always to create more Valkyrie-specific drones, and these cool new assets were added." **Exact names/types are not documented in available sources.** *(Flagged — see Gaps.)*
Source: Wormholes update article (relayed).

### 2.4 Decoy — holographic "drone"/fake ship
| Property | Detail |
|---|---|
| Name | **Decoy** |
| Function | Generates a **holographic copy of your ship** to distract pursuers |
| Limitation | Can fool a human pilot, but **cannot fool missile lock** |
| Class/ship | Present in the **original** game as a counter-measure-type ability; specific Warzone ship assignment **not confirmed** |

Source: Fandom EVE: Valkyrie page (snippet). *(Marked uncertain for Warzone.)*

---

## 3. MINES (deployable explosives)

| Property | Detail |
|---|---|
| Trigger | **Proximity** — explode instantly when an enemy ship runs into them |
| Damage | Significant / "great damage" on contact; AoE |
| Persistence | Remain in place until triggered |
| Active cap | **Maximum 3 active at once**; placing a 4th self-destructs the oldest |
| Secondary use | **Deploying mines breaks an incoming missile lock** (defensive) |
| Best maps | Solitude (3 underground tunnel entrances) is "made for a mine-dropping support ship" |
| Availability | Found on ships **across all classes**, but **most common on Support** |

**Mine-carrying ship explicitly named:**
- **Revenant** (Support) — "your first chance to try mines," unlocks at **125,000 XP**. Described as having "speed, mines, guns and a mighty corrupt beam that can amplify damage." *(Revenant appears to be a legacy/progression Support ship not in the headline 13-ship roster — see notes.)*

Sources: official "Mastering Mines," "Mini Masterclass – Mines and Spiderbots," "Taking the Supports to Solitude" (all relayed via search), Heavy/Support guides.

---

## 4. BEAMS, FIELDS & SHIELDS (support deployables / projected effects)

These are projected/channeled support effects rather than persistent objects, but they function as the game's "repair fields / shield generators / drain fields."

| Effect | Name | Ship | Slot | What it does |
|---|---|---|---|---|
| Heal beam | **Repair Beam** | Nagi | Secondary | Locks onto an ally; recharges **shields and armor** |
| Drain beam | **Drain Beam** | Banshee | Secondary | Locks onto enemy; **drains enemy shields** |
| Self-heal | **Self Repair** | Nagi (also Vulcan-Heavy) | Tertiary | Recharge own shield + repair armor in a safe spot |
| Overshield | **Apply Mini Over-shield** | Medusa | Secondary | Repairs an ally's shield or applies an **extra temporary shield** on top |
| Overshield (self) | **Overshield** | Jackal (Assault) | Tertiary | Deploys an additional shield on self |
| Capacitor heal | **Capacitor Restore Beam** | Kirin | Secondary | Locks onto teammate, restores their **capacitor** (run abilities w/o penalty) |
| Buff pulse (field) | **Fate's Call** (Ultra) | Banshee | Ultra | Pulse that **shield-recharges all nearby teammates** |
| Heal pulse (field) | **Radiant Burst** (Ultra) | Nagi | Ultra | Pulse that **recharges all friendly hulls within radius** |
| Shield strip (field) | **Death's Grasp** (Ultra) | Medusa | Ultra | **Strips all nearby enemy shields**, leaving them vulnerable |
| Generic "Buff Beam" | **Head-Tracked Buff Beam** | most Support ships (original game) | — | Restores ally armor/shield OR drains enemy shields |

Sources: Steam "Support Ship Guide," official Support-class article, Medusa/Nagi/Kirin ship pages (relayed), Fandom Weapons page.

---

## 5. ELECTRONIC-WARFARE / COUNTERMEASURE DEPLOYABLES

| Name | Type | Ships | Effect |
|---|---|---|---|
| **ECM (Chaff)** | Counter-measure cloud | Wraith Mk6, Yurei (Assault); Hydra (Heavy) | Deploys a chaff cloud that **blocks/breaks incoming missiles** |
| **EMS** | Electromagnetic shield | Medusa (Support); Scarab, Corvus (Heavy) | **Blocks incoming missiles** and turns the ship's projectiles into **EMP rounds** |
| **HUD Scrambler** | Disorienting pulse | Kirin (Support) | **Scrambles enemy HUDs** |
| **Sonar** | Detection pulse | Corvus (Heavy) | **Reveals cloaked (Covert) ships** |
| **Mark Target** | Target painter | Shadow (Covert) | Marks an enemy → increases damage it takes from Shadow & teammates |
| **Countermeasures** | Generic flare/chaff | various original-game ships (Accord, Guardian, etc.) | Break missile lock |

Sources: Steam Assault/Heavy/Support guides, Covert articles, Fandom (snippets).

---

## 6. "TURRETS / SENTRY GUNS" deployed by players
**No evidence found** that any player ship can deploy a stationary *turret* or *sentry gun*. Turrets in Valkyrie are **environmental** (Carrier Assault — see §8). The closest player abilities to "turrets" are the auto-attaching **Spiderbots** (§2.2) and proximity **Mines** (§3). *(Flagged — could not confirm any player-deployable turret.)*

---

## 7. ULTRA ABILITIES THAT SUMMON / PROJECT AREA EFFECTS (full list for reference)

Many "Ultras" act like deployed area effects (bombs / fields). Full Warzone-roster Ultras:

| Class | Ship | Ultra | Type / effect |
|---|---|---|---|
| Assault | Wraith Mk6 | **Mjolnir** | One-shot super missile, catastrophic damage |
| Assault | Jackal | **Matter Injection** | Unlimited boost for a short time |
| Assault | Strix | **Remove Plasma Vent** | Unlimited shots, no overheat |
| Assault | Yurei | **Mayhem** | Increased weapons damage, short rampage |
| Heavy | Scarab | **Void Storm** | **EMP bomb** — stuns enemies in radius |
| Heavy | Vulcan | **Cocoon** | Brief invulnerability ("nothing can touch you") |
| Heavy | Corvus | **Silence** | **Stun pulse** — stuns ships in radius |
| Heavy | Hydra | **Spectre's Bond** | Immune to all damage for a short time |
| Support | Banshee | **Fate's Call** | Team shield-recharge pulse (field) |
| Support | Nagi | **Radiant Burst** | Team hull-recharge pulse (field) |
| Support | Medusa | **Death's Grasp** | Enemy shield-strip field |
| Support | Kirin | **Dragon's Thorn** | **Sticky bomb** that attaches to an enemy then detonates |
| Covert | Shadow | **Violent Whisper** | **Nova bomb** — massive blast radius, delayed detonation (drop & flee) |

Sources: Steam Assault/Heavy/Support guides, Covert class article (all relayed/quoted).

---

## 8. CARRIER ASSAULT — CAPITAL-SHIP SUBSYSTEMS & AI DEFENSES

Carrier Assault (free update, **June 2017**) is a **3-stage** PvP/co-op mode ending in a "trench-run" core attack. The enemy **Carrier** is a capital ship covered in destructible/AI subsystems.

### 8.1 The three stages
1. **Skirmish** — Capture **2 of 3 Power Relay Stations** (deploy capture drones, §2.1) → disables the enemy carrier's **shields** for a limited time.
2. **Attack** — With shields down, destroy **Cooling Nodes** across the carrier's surface (highlighted on HUD) → degrades the carrier's defense/firepower. Players must dodge automated turrets + defending pilots.
3. **Breach** — All cooling nodes destroyed → the **Core** is exposed in a trench-like access tunnel; pour fire into it until it goes critical, then escape the blast radius as the carrier explodes.

### 8.2 Carrier subsystems / deployables (environmental)

| Subsystem | Behavior | Role |
|---|---|---|
| **Carrier Shields** | Disabled when attackers hold 2 of 3 relay stations | Gate to the Attack phase |
| **Power Relay Stations** (×3) | Capture points (drone-deployed) | Lower carrier shields |
| **Cooling Nodes** | Destructible nodes "all around the carrier" | Destroy to reduce carrier firepower & expose Core |
| **Power Core** | Final objective in the trench/access tunnel | Destroy to win; goes critical & explodes |
| **Gun Turrets / Machine-gun Turrets** | **Automated AI defense turrets**; densest "on the front" of the carrier | Damage attackers automatically |
| **Flak Cannons** | Automated carrier defense | Hard to track if you fly in close |
| **Missile Launchers** | Automated carrier defense | Hard to track if you fly in close |
| **Boost Gates** | One-way speed-boost gates (map feature, added with Carrier Assault) | Catapult to objectives |

> Defensive-team tactic: when defending, **let your carrier's turrets damage enemies, then land the final shot** to get the kill credit.

Sources: official "Introducing Carrier Assault" dev blog, "Carrier Assault update coming June 20," UploadVR, RoadToVR, PC Gamer, Steam single/multiplayer modes guide, "Co-op vs AI" article (all relayed via search).

### 8.3 Are there carrier-launched "defense drones" / fighters?
The defending side is composed of **player or AI pilot ships** (matchmade AI in co-op), **not** swarms of autonomous fighter-drones launched by the carrier. The carrier's own defenses are the **automated turrets/flak/missiles** above. **No evidence of a distinct carrier-launched combat-drone unit was found.** *(Flagged — see Gaps.)*

---

## 9. AI / NPC UNITS IN PvE & CO-OP

| Mode | AI content |
|---|---|
| **Co-op vs AI** | Squad of up to 5 vs **AI pilots** matchmade to your skill. Both **Control** and **Carrier Assault** are playable in co-op (so AI defends/attacks carriers, captures points, etc.) |
| **Survival** | Wave-based PvE: survive **increasing waves of enemy AI ships** (various classes & squad combos) for a high score |
| **Scout** | Solo single-player narrative/training experience (story-driven; light combat) |
| **Recall / story missions** | Single-player missions vs AI (added/expanded in updates) |
| **Carrier Assault PvE** | AI pilots attack/defend; carrier subsystems (§8) are the AI/automated hazards |

The AI enemies are **the same ship classes as players** (Assault/Heavy/Support/Covert variants) flown by bots — there is no separate bestiary of unique NPC monster units. The only non-ship AI hazards are the **carrier turrets/flak/missile emplacements**.

Sources: imperium.news review/guide, "Co-op vs AI – New and Improved," Steam single/multiplayer modes guide, Survival mode descriptions (all relayed).

---

## 10. SHIP-BY-SHIP DEPLOYABLE SUMMARY (Warzone 13-ship roster)

| Class | Ship | Deployable / drone / mine / field abilities |
|---|---|---|
| Assault | **Wraith Mk6** | ECM (chaff); Mjolnir Ultra |
| Assault | **Jackal** | Overshield (self); Matter Injection Ultra |
| Assault | **Strix** | Dash; Remove Plasma Vent Ultra |
| Assault | **Yurei** | ECM (chaff); Mayhem Ultra |
| Heavy | **Scarab** | EMS; Micro Warp Drive; Void Storm (EMP bomb) Ultra |
| Heavy | **Vulcan** | Self Repair; Micro Warp Drive; Cocoon Ultra |
| Heavy | **Corvus** | EMS; Sonar (anti-cloak); Silence (stun) Ultra |
| Heavy | **Hydra** | ECM (chaff); Rail Cannon; Spectre's Bond Ultra |
| Support | **Banshee** | **Spiderbots** (heal/damage drones); Drain Beam; Fate's Call Ultra |
| Support | **Nagi** | Repair Beam; Self Repair; Radiant Burst Ultra |
| Support | **Medusa** | Mini Over-shield; EMS; Death's Grasp Ultra |
| Support | **Kirin** | Capacitor Restore Beam; HUD Scrambler; Dragon's Thorn (sticky bomb) Ultra |
| Covert | **Shadow** | Cloaking Device (30 s); Mark Target; Violent Whisper (nova bomb) Ultra |

**Legacy / progression ships referenced in guides (not in headline 13):**
- **Revenant** (Support) — mines + corrupt beam, unlock 125,000 XP.
- **Spectre** (Heavy) — "base form of the Heavies," head-tracked proximity AoE weapon + EMS.
- **Maelstrom** (original game) — **Mortar** special (slow, proximity-detonating AoE).
- Original-game ships with named loadouts incl. Accord, Assuage, Guardian, Dominator (Buff Beam / Countermeasures / EMS variants).

> Conflict to flag: sources describe both "13 unique Warzone ships" and "23 ships in the original game." Revenant/Spectre/Maelstrom are best understood as **original/legacy ships** carried over or as upgrade tiers. The 13-ship list (Wraith, Jackal, Strix, Yurei, Scarab, Corvus, Hydra, Vulcan, Banshee, Medusa, Nagi, Kirin, Shadow) is the consistently cited Warzone roster.

---

## 11. CONSOLIDATED LIST — every drone/deployable/AI unit found

**Player drones / summoned units**
- Capture/Control Drone (all ships)
- Spiderbots (Banshee — heal/damage drones)
- "Fancy new Drones" added in Wormholes update (names unknown)
- Decoy (holographic ship — original game)

**Player mines / bombs**
- Proximity Mines (Revenant + various ships; cap 3)
- Dragon's Thorn (Kirin sticky bomb Ultra)
- Violent Whisper (Shadow nova bomb Ultra)

**Player beams / fields / projected shields**
- Repair Beam (Nagi), Drain Beam (Banshee), Capacitor Restore Beam (Kirin), Head-Tracked Buff Beam (generic Support)
- Mini Over-shield (Medusa), Overshield (Jackal), Self Repair (Nagi/Vulcan)
- Fate's Call, Radiant Burst, Death's Grasp (Ultra fields)

**Player EWAR/counter deployables**
- ECM/Chaff, EMS, HUD Scrambler, Sonar, Mark Target, Countermeasures

**Environmental / carrier subsystems (AI / automated)**
- Carrier Shields, Power Relay Stations (×3), Cooling Nodes, Power Core
- Automated Gun/Machine-gun Turrets, Flak Cannons, Missile Launchers
- Boost Gates (map feature)

**AI/NPC**
- AI pilot ships (co-op & Survival; same classes as players)
- Survival wave enemies
- Carrier automated turret emplacements

---

## 12. Gaps / Could Not Confirm

- **Exact names/types of the "fancy new Drones"** added in the Wormholes update (Feb 2017) — confirmed they exist, names not documented in accessible sources.
- **Whether the Decoy ability survived into Warzone** and on which ship — only confirmed as an original-game ability.
- **Any player-deployable stationary turret / sentry gun** — none found; appears not to exist (turrets are carrier-only environmental).
- **Carrier-launched autonomous combat drones/fighters** — no evidence; the carrier's only AI defenses are turrets/flak/missile emplacements, defenders are pilot ships.
- **Numeric stats** (mine damage values, spiderbot tick rates, drone capture times, turret DPS, cooling-node/core HP, ability cooldowns) — not published in accessible sources; live game balance changed across patches (R3, R4.4, Wormholes, Groundrush, Carrier Assault).
- **Full original-game (pre-Warzone) 23-ship roster with each special weapon** — only partial (Wraith, Maelstrom/Mortar, Accord, Assuage, Guardian, Dominator, Revenant, Spectre). The EVE **Fandom wiki** (eve.fandom.com) has per-ship pages but **blocks automated fetching** (HTTP 403), so it could only be read via search snippets.
- **PvE/Scout mission-specific scripted enemies or named bosses** — no distinct named NPC units found beyond generic AI pilots and carrier turrets.
- Official site pages (`www.evevalkyrie.com`) are **offline / returning connection errors**; data leans on Steam community guides that quote official ship-tutorial text, plus archived press coverage.

---

## Sources

- EVE: Valkyrie – Warzone, Support Ship Guide (Steam Community / Steam Solo) — quotes official ship tutorials: https://steamcommunity.com/sharedfiles/filedetails/?id=1138771785 and https://steamsolo.com/guide/support-ship-guide-eve-valkyrie-warzone/
- EVE: Valkyrie – Warzone, Assault Ship Guide (Steam): https://steamcommunity.com/sharedfiles/filedetails/?id=1134260537 ; https://steamsolo.com/guide/assault-ship-guide-eve-valkyrie-warzone/
- EVE: Valkyrie – Warzone, Heavy Ship Guide (Steam): https://steamcommunity.com/sharedfiles/filedetails/?id=1134266763
- Official: "Warzone – the inside scoop on the Support class": https://www.evevalkyrie.com/articles/pilot-training/warzone-the-inside-scoop-on-the-support-class
- Official: "Get to know the new Assault class": https://www.evevalkyrie.com/articles/pilot-training/get-to-know-the-new-assault-class
- Official: "Warzone – the lowdown on the Heavies": https://www.evevalkyrie.com/articles/pilot-training/warzone-the-lowdown-on-the-heavies
- Official: "Revealed at last: the elusive Covert class": https://www.evevalkyrie.com/articles/pilot-training/revealed-at-last-the-elusive-covert-class
- Official: "Mini Masterclass – Mines and Spiderbots": https://account.evevalkyrie.com/articles/news/mini-masterclass-mines-and-spiderbots
- Official: "Mastering Mines – The Best Places to Plant Your Explosives": https://www.evevalkyrie.com/articles/news/mastering-mines-the-best-places-to-plant-your-explosives
- Official: "Mini Masterclass – Taking the Supports to Solitude": https://www.evevalkyrie.com/articles/news/mini-masterclass-taking-the-supports-to-solitude
- Official: "Control Points – Easy as A, B, C": https://www.evevalkyrie.com/articles/news/control-points-easy-as-a-b-c
- Official: "Introducing EVE: Valkyrie's New Carrier Assault Mode": https://www.evevalkyrie.com/articles/dev-blogs/introducing-eve-valkyrie-s-new-carrier-assault-mode
- Official: "Carrier Assault update coming June 20": https://www.evevalkyrie.com/articles/news/carrier-assault-update-coming-june-20
- Official: "Mini Masterclass – Carrier Assault Sewn-up with Supports": https://www.evevalkyrie.com/articles/news/mini-masterclass-carrier-assault-sewn-up-with-supports
- Official: "Mini Masterclass – Own Carrier Assault with the Fighters": https://www.evevalkyrie.com/articles/news/mini-masterclass-own-carrier-assault-with-the-fighters
- Official: "Co-op Versus AI – New and Improved": https://www.evevalkyrie.com/articles/news/co-op-versus-ai-new-and-improved
- Official: "Wormholes update and Patch Notes": https://www.evevalkyrie.com/articles/updates-and-patches/wormholes-update-and-patch-notes
- Official ship pages: Medusa / Nagi / Kirin / Vulcan / Scarab / Shadow (https://www.evevalkyrie.com/ships and /ships/<name>)
- UploadVR – Carrier Assault Update: https://www.uploadvr.com/eve-valkyrie-carrier-assault-update/
- RoadToVR – Carrier Assault trench-run: https://www.roadtovr.com/eve-valkyrie-receive-carrier-assault-mode-star-wars-style-trench-run/
- PC Gamer – Carrier Assault free update: https://www.pcgamer.com/eve-valkyrie-gets-free-carrier-assault-update/
- PCGamesN – Covert class (Shadow): https://www.pcgamesn.com/eve-valkyrie/eve-valkyrie-shadow-covert-class
- Imperium News – EVE: Valkyrie Review & Guide (modes/AI): https://imperium.news/eve-valkyrie-review-guide/
- Steam: "Guide to Single and Multi-player Modes": https://steamsolo.com/guide/guide-to-single-and-multi-player-modes-eve-valkyrie/
- EVE Fandom Wiki — EVE: Valkyrie, Weapons, Ships List, Maelstrom, Wraith, Revenant (read via search snippets; site blocks automated fetch): https://eve.fandom.com/wiki/EVE:_Valkyrie
- PSNProfiles Warzone Trophy Guide: https://psnprofiles.com/guide/6748-eve-valkyrie-warzone-trophy-guide
