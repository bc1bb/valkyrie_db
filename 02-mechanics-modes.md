# EVE: Valkyrie – Warzone — Game Mechanics, Modes & Systems

**Game:** EVE: Valkyrie – Warzone (CCP Games)
**Platforms:** PC (Steam/Oculus), PlayStation 4 — playable in VR (Oculus Rift, HTC Vive, PSVR) or flatscreen
**"Warzone" update launched:** 26 September 2017 (base game *EVE: Valkyrie* launched 2016)
**Servers shut down:** 5 August 2022 (game no longer playable online)
**Research date:** 2026-05-23

> **Note on sourcing:** The official `www.evevalkyrie.com` domain and the Fandom wikis were unreachable / 403 during research. Most official-article content below was retrieved from a still-live Azure mirror of the official site (`evevalkyriesecure-production-pre-production.azurewebsites.net`) and from PlayStation Blog, PCGamesN, PC Gamer, Steam guides, EVE Online news, and trophy guides. Items marked **[UNCERTAIN]** or **[CONFLICTING]** could not be fully cross-confirmed.

---

## 1. Overview & Faction Context

Two clone-pilot factions fight across all competitive modes:

- **The Valkyrie** — led by **Rán Kavik** (voiced by Katee Sackhoff). A fiercely independent breakaway group. Rán was a Gallente Navy pilot who died in combat, was secretly cloned/resurrected by Fatal, and broke away after learning he had murdered her to harvest her piloting talent.
- **The Schism** — a technologically advanced clone-pilot army founded by **Fatal** (real name **Jirai Laitanen**), a corrupt former Caldari captain and exiled Guristas pirate.

This Valkyrie-vs-Schism conflict is the framing for both multiplayer matches and the single-player Recall missions. (Source: official "The Valkyrie and the Schism – What's Their Beef?" article via Azure mirror; Wikipedia.)

---

## 2. Game Modes

### 2.1 Multiplayer (PvP) Modes — typically 8v8

| Mode | Win condition | Rules summary |
|---|---|---|
| **Team Deathmatch** | Eliminate the enemy team's entire clone pool, or hold more clones when the timer expires | Each team has a shared pool of clones. Each pilot death subtracts one clone. When a team's pool reaches zero, that team loses. |
| **Control** | Drain the enemy clone pool to zero by holding capture points | Three control points (labeled **A, B, C**) on the map. Players **deploy a drone** near a point to capture it. Captured points accelerate the drain of the **enemy team's clone pool** — the more points you hold, the faster their resources disappear. |
| **Carrier Assault** | Destroy the enemy faction's Carrier (expose and destroy its Core) | Multi-stage objective mode (see §3). Combines Control-style capture with a base-assault "trench run" finale. A full match typically runs ~15–20 minutes. |
| **Extraction** | Capture-the-flag–style: secure a relic and deliver it to an assigned location | Both squadrons fight over a single **relic** and must deliver it to a drop-off point while the other team tries to steal it. Emphasizes teamplay, navigation, and using the environment. **Added in the Warzone update.** |
| **Wormhole Mode** | Varies (rotating ruleset) | Weekend event mode (Rank 5+). Rotating modified rulesets, unique environments, and **preset ship loadouts** issued equally to all players. **[UNCERTAIN]** — described in official modes guide; exact rotation cadence not confirmed. |

(Sources: PlayStation Blog "Everything You Need to Know"; official modes guide via Azure mirror; "Control Points – Easy as A, B, C"; "Introducing… Carrier Assault Mode"; EVE Online Warzone guest blog. The Warzone guest blog explicitly calls Extraction "the exciting new CTF-style game mode.")

### 2.2 Co-op vs AI

Players team up against **balanced AI opponents** and earn standard XP and currency. Co-op is available in **Deathmatch, Control, and Carrier Assault** formats. (Source: official modes guide via Azure mirror; imperium.news review mentions co-op squad battles awarding **salvage** crafting resource.)

### 2.3 Single-Player Modes (grouped under "Chronicles")

| Mode | Purpose / rules |
|---|---|
| **Training (Training Modules)** | Foundational instruction: flight basics and weapon systems. Additional modules unlock as you progress through each ship class (Assault/Heavy/Support). Includes obstacle courses and ability practice. |
| **Recall** | Short story/lore missions where you relive the memories of pilots. Provide backstory **and** familiarize players with mechanics. Players collect audio logs called **"Echoes."** (See §6 for mission names.) |
| **Scout** | Enemy-free exploration of maps to learn layouts, shortcuts, and cover. Maps contain collectible **Echoes** and **salvage containers**. |
| **Survival** | Wave-based combat vs increasingly difficult AI. Two difficulty tiers: **Novice** and **Pro**. Score-attack focused; good for learning ship classes and squad compositions. |
| **Test Arena** | Free sandbox to try any ship with no time limit and no damage consequences (collision still active). |

(Sources: official modes guide via Azure mirror; PlayStation Blog; imperium.news review.)

---

## 3. Carrier Assault — Detailed Rules

Carrier Assault was the major mode added to the original game (June 2016 update) and carried into Warzone. Each faction (Valkyrie, Schism) has its **own Carrier**. The mode runs in alternating stages so a losing team can recover.

**Stage 1 — Skirmish / Shield Disable**
- Three control points across the map (same drone-deploy capture mechanic as Control).
- A team that captures **2 of the 3** control points **drops the enemy Carrier's shields** for a limited time.

**Stage 2 — Attack / Defense (Cooling Nodes)**
- With shields down, the attacking team flies in to destroy **Cooling Nodes** located all around the Carrier, while dodging the **Carrier's turrets** and the defending team.
- This phase is time-limited. If the attackers fail, the match reverts to Stage 1 (Skirmish).

**Stage 3 — Breach (the Core / "trench run")**
- If enough Cooling Nodes are destroyed, the Carrier's **Core** is exposed — a final position near the center of the ship, reached via a Star-Wars-style trench run.
- Dealing enough damage drives the Core **critical**, destroying the Carrier and granting **decisive victory**.

**Capital ships involved:** Both the **Valkyrie** and the **Schism** field a Carrier. The **Schism Carrier** is named in the official Carrier Assault article (the player destroys "the Schism carrier"). **[GAP]** The specific proper name of the **Valkyrie's** carrier was not confirmed (the carriers are referred to mainly by faction). **Speed Boost Gates** are present on the map to let pilots traverse quickly toward the carrier.

(Sources: "Introducing EVE: Valkyrie's New Carrier Assault Mode" via Azure mirror; original search snippet of same article; Wikipedia.)

---

## 4. Core Combat Mechanics

| Mechanic | Description |
|---|---|
| **Missile lock-on** | **Head-tracked** missiles (in VR you literally look at a target). Hold the trigger to acquire a visual lock; release to fire. Holding the lock longer **loads more missiles into the chamber** (up to a max), so you can fire 1–2 or a full barrage. Locked missiles track while you do other things. At point-blank range you must aim at the enemy **cockpit** to register the lock. Locks can be manually cancelled (e.g., click right analogue stick). |
| **Missile types** | No mechanical difference is exposed by missile *name*; behavior varies by **ship/launcher**. Low-velocity missiles are good for harassing; high-velocity missiles for direct damage to a ship ahead of you. Found predominantly on Assault-class ships, with Heavy/Support variants. |
| **Primary cannons** | Each ship has a primary auto-cannon/laser/plasma weapon; many primaries can **overheat** (e.g., Vulcan's Laser Gatling accuracy degrades with sustained fire; Strix's Ultra removes the overheat penalty temporarily). |
| **Boost / Afterburner** | Boost lets you accelerate/close distance or escape. Several ships have boost-related modules/Ultras (Jackal's **Matter Injection** Ultra = unlimited boost for a short time). **Speed Boost Gates** placed on maps give a speed surge. |
| **Countermeasures (decoys / chaff)** | **ECM / Chaff** is the standard countermeasure: fires chaff to both sides to confuse incoming missiles into self-destructing (PS4 = Square, PC = X by default). Other anti-missile tools exist: **mines**, and **spider-bots** that break missile locks. Players are advised to save ECM for moments environmental cover can't help. |
| **Evasive maneuvers / drift** | Pilots use **environmental evasion** (flying around structures/debris) to dodge missiles and gunfire. Some ships have a **Dash** module (Strix) for a quick repositioning blast. **[UNCERTAIN]** — a dedicated "drift" mechanic was asked about but not confirmed as a named system; maneuvering is free-flight 6DoF dogfighting. |
| **Repair** | **Self-Repair** modules restore shields/armor on several ships (Vulcan, Nagi). Support ships can repair allies via **Repair Beam** (Nagi) and area repair Ultras (Nagi's **Radiant Burst**, Banshee's **Fate's Call** recharge pulse). |
| **Shields & armor** | Ships have shields (regenerating) and armor (hull). Overshield modules add a temporary extra shield layer (Jackal Overshield, Medusa Mini Overshield). |
| **Respawn** | On death a pilot is re-cloned and re-launched from a **launch tube**; each death drains the team **clone pool** in pool-based modes. Players can unlock additional **launch tubes** to pre-load multiple loadouts for faster respawn swaps. |
| **"Ultra" abilities (super weapons)** | Each ship has one charge-up **Ultra** that can swing a battle (see §5). |
| **EMS / EMP** | EMS modules block missiles and can convert projectiles into EMP rounds; several Ultras stun enemies in a radius (Void Storm, Silence). |

(Sources: "Mini Masterclass – Missile Deployment" via Azure mirror; Neoseeker FAQ snippet; Steam Heavy/Assault ship guides; class articles; imperium.news.)

---

## 5. Ship Classes & Ultra Abilities

Warzone reworked the ships into **four classes**. The original game's "Fighter" class became **Assault**; **Heavy** and **Support** remained; **Covert** was brand new for Warzone.

> Loadout slots per ship: **Primary**, **Secondary**, **Tertiary** (module), and one **Ultra**. **Mods** customize ship stats.

### 5.1 Assault Class (formerly Fighter) — fast, all-round damage dealers

| Ship | Primary | Secondary | Tertiary | Ultra |
|---|---|---|---|---|
| **Wraith (Mk6)** | Assault Cannons | Missile Launcher (up to 5 missiles, splash) | ECM (chaff) | **Mjolnir** — one-shot super missile, catastrophic damage; penetrates shields & armor |
| **Jackal** | Ripper (close-range, splash) | Alternate Ripper (no splash) | Overshield (extra shield / repair) | **Matter Injection** — unlimited boost, short duration |
| **Strix** | Pulse Laser (long-range sniping, pair of beams) | Missile Pod (up to 7, splash) | Dash (evasive forward blast) | **Remove Plasma Vent** — unlimited shots, no overheat, temporarily |
| **Yurei** | Pulse/Plasma Cannon (mid-range auto) | Trine Missiles (up to 3, splash) | ECM (chaff) | **Mayhem** — temporary increased weapon damage (boosts the plasma cannon) |

*Note:* The Wraith is described as the ideal beginner ship. **[CONFLICTING]** One PCGamesN snippet listed Yurei's Ultra as a generic "Mayhem"-style buff while the official Assault article ties Yurei specifically to a plasma-cannon damage Ultra named **Mayhem** — treated here as the same ability.

### 5.2 Heavy Class — slow, durable tanks with heavy firepower

| Ship | Primary | Secondary | Tertiary | Ultra |
|---|---|---|---|---|
| **Spectre** (base Heavy) | — | — | — | **Spectre's Bond** — temporary immunity to all damage **[UNCERTAIN]** (one source assigns Spectre's Bond to "Hydra"; Spectre is named as the base Heavy elsewhere — likely the same lineage) |
| **Scarab** | Flak Cannon (close-range splash) | Micro Warp Drive (reposition/escape) | EMS (block missiles / convert to EMP) | **Void Storm** — EMP bomb stuns enemies in radius |
| **Vulcan** | Laser Gatling (rapid mid-range; accuracy degrades) | Micro Warp Drive | Self Repair (shields/armor) | **Cocoon** — temporary invulnerability |
| **Corvus** | Tri-Flak (high damage, close-range splash) | Sonar (reveals cloaked ships) | EMS | **Silence** — stuns enemies in radius |
| **Hydra** | Flak Cannon | Rail Cannon (long-range, penetrates shields/armor) | ECM (chaff missile defense) | **Spectre's Bond** — temporary damage immunity |

*Note:* The Heavy class includes a counter to stealth (Corvus's **Sonar** / a "radar ping" that reveals cloaked Covert ships).

### 5.3 Support Class — agile electronic warfare / healing

| Ship | Primary | Secondary | Tertiary | Ultra |
|---|---|---|---|---|
| **Medusa** | Pulse Cannon (mid-range auto) | Apply Mini Overshield (temp protection) | EMS (block missiles / EMP rounds) | **Death's Grasp** — strips all nearby enemy shields |
| **Banshee** | Phaser (continuous damage) | Drain Beam (strips enemy shields) | Spiderbots (attach to passing ships; heal allies or damage enemies) | **Fate's Call** — shield-recharge pulse to nearby teammates |
| **Kirin** | Shard Rifle (sticky delayed-detonation projectiles) | Capacitor Restore Beam (restores teammate power) | HUD Scrambler (disorients enemy targeting) | **Dragon's Thorn** — sticky bomb attached to enemy |
| **Nagi** | Twin Linked Carbine (rapid fire) | Repair Beam (restores ally shields/armor) | Self Repair | **Radiant Burst** — instantly repairs friendly hulls in radius |

*Class role:* Supports use a **buff/drain beam** to sap enemy shields or heal teammates.

### 5.4 Covert Class (NEW in Warzone) — stealth assassin

| Ship | Key mechanics | Ultra |
|---|---|---|
| **Shadow** (the only Covert ship) | **Cloaking device**: invisible for ~**30 seconds**, then ~**15-second** recharge. Firing the **Plasma Beam** (a charge-and-release weapon) or using **Mark Target** instantly drops the cloak; charging a weapon also breaks stealth. Splash damage / nearby flak makes the ship **shimmer** (Predator-style). Enemy fire can disable the cloak. Low shields & armor. Counterable by Heavy-class radar/Sonar ping. | **Violent Whisper** — a nova bomb with a very large blast radius |

(Sources: PCGamesN Assault & Covert class articles; PC Gamer stealth-ships article; official Support & Assault class articles via Azure mirror; Steam Heavy Ship Guide; PCGamesN/search ship-class snippets.)

---

## 6. Single-Player Recall (Campaign) Missions

Recall is a short set of story missions that double as tutorials. **[GAP]** A definitive, complete numbered list of Recall mission **titles** could not be fully confirmed from accessible sources. Confirmed mission references:

| Mission | Objective / context |
|---|---|
| **The First Assault** | Destroy a Carrier (acts as a Carrier-Assault primer). |
| **Station 27** | Recall mission / checkpoint (confirmed via trophy guides). |
| **Esmes III** | Recall mission objective (confirmed via trophy guides). |
| **Convoy** | A Recall mission scenario (story-driven). |

Multiple sources state Recall consists of roughly **four** story missions in which you relive a pilot's memories and collect **Echoes**. Additional lore is told through a 4-volume Dark Horse comic series, not in-game. There is **no large branching single-player campaign** — Recall is brief and tutorial-oriented; the game is primarily competitive multiplayer.

(Sources: PSNProfiles & MetaGame trophy guides; search snippets; official modes guide via Azure mirror.)

---

## 7. Targeting & HUD Systems

- **Head-tracked targeting:** In VR you aim missile locks by looking at targets; a visual lock indicator confirms acquisition. Without eye-tracking, the game may interpret your gaze imperfectly (noted as a usability quirk in reviews).
- **Lock indicators / incoming-missile alarm:** Audible alarm warns of incoming missiles, cueing ECM use.
- **Cockpit HUD:** Each ship shows shields/armor, weapon heat/overheat, Ultra charge, boost, and objective markers. Warzone **revamped cockpit interiors, the HUD, menus and UI**.
- **Mark Target:** Tagging ability (e.g., used by the Covert Shadow) that pings a target for the team but breaks one's own cloak.
- **HUD Scrambler:** Kirin's module that disorients enemy targeting/HUD.
- **Cloak detection:** Heavy ships' Sonar / radar ping reveals stealthed ships on the map.

(Sources: Neoseeker FAQ snippet; imperium.news review; EVE Online Warzone guest blog; class articles.)

---

## 8. Match Structure, Scoring & Progression

- **Team size:** 8v8 in standard PvP.
- **Clone pool:** Core scoring resource in Team Deathmatch and Control — depleting it (or holding more at time expiry) decides the match.
- **Carrier Assault win:** Destroying the enemy Carrier's Core.
- **Extraction win:** Delivering the relic to the objective.
- **Currency / crafting:** Players earn **Silver** and **Salvage** (a crafting material; team salvage is split equally among squadmates). Used to craft/unlock ships, variants, and upgrades.
- **Blueprints / variants:** Upgrade blueprints unlock new ship variants and modules.
- **Mods:** Warzone added **mod-based customization** to tune ship stats to playstyle.
- **Reward Capsules:** Warzone introduced a **capsule-based reward system with randomized loot**. Optional **Gold Capsules** could be purchased (cosmetic only; all items also obtainable with in-game currency).
- **Ranks:** Rank cap raised to **60** in Warzone (with 10 new Drifter-themed rank icons). Player progression also tracked per ship class.
- **New Player Servers:** Players up to **Rank 5** play only against similarly skilled players plus tuned AI before entering the general pool.
- **Daily challenges:** Provide extra progression.

(Sources: EVE Online Warzone guest blog; PlayStation Blog; "New Player Servers – Rank Increased"; MetaGame & PSNProfiles trophy guides.)

---

## 9. Cross-Play / VR-vs-Flatscreen (Warzone's headline change)

- **VR requirement removed:** Warzone made the game fully playable **with or without VR**. Supported in VR on **Oculus Rift, HTC Vive, PSVR**, and in flatscreen on PC and PS4.
- **True cross-play:** All pilots share the same servers — **PS4, PSVR, PC, HTC Vive, and Oculus Rift players matched together** ("cross-platform, cross-reality"). This was promoted as giving "painless matchmaking" via a combined population.
- **Limitations:** Cross-platform **voice chat and squads are NOT supported** across platforms.
- **Input support:** Keyboard & mouse (with custom keybindings, added in Warzone), Xbox controllers, Steam Controller, and compatible **HOTAS** flight sticks.
- **Balance note:** VR's head-tracked aiming vs flatscreen mouse/stick aiming were both supported; CCP balanced lock-on so neither input had a decisive advantage. **[UNCERTAIN]** — specifics of how VR vs flatscreen aiming were balanced were not deeply documented in accessible sources.
- **Two new maps** shipped with Warzone: **Fleet** and **Outpost**.

(Sources: EVE Online Warzone guest blog; "Cross-Platform, Cross-Reality" article; Wikipedia; FAQ via Steam discussion; GeForce/NVIDIA Warzone article.)

---

## 10. Gaps / Could Not Confirm

- **Valkyrie faction Carrier proper name** — only the **Schism** carrier is named in the Carrier Assault article; the Valkyrie's carrier name was not confirmed. **[GAP]**
- **Complete Recall mission list & order** — only *The First Assault*, *Station 27*, *Esmes III*, and *Convoy* confirmed; the official count (~4) and any further titles/objectives unverified. **[GAP]**
- **Spectre vs Hydra Ultra ("Spectre's Bond")** — sources disagree on which Heavy ship is the base "Spectre" and which carries Spectre's Bond. Treated as same lineage but **[CONFLICTING]**.
- **"Drift" mechanic** — no dedicated named drift system confirmed; maneuvering is 6DoF free-flight with Dash/boost modules. **[UNCERTAIN]**
- **Wormhole Mode** rotation/cadence and exact rulesets — described but not fully detailed. **[UNCERTAIN]**
- **Exact clone-pool sizes, timers, capture rates, damage values** — not published in accessible sources (game-balance numbers). **[GAP]**
- **Full ship roster completeness** — Assault (4), Heavy (5 incl. Spectre), Support (4), Covert (1) listed; it's possible additional variants/skins existed. **[UNCERTAIN]**
- Several official articles were only reachable via an Azure staging mirror; original `evevalkyrie.com` and Fandom pages returned ECONNREFUSED/403, and the Wayback Machine was blocked — so some official wording could not be re-verified against the canonical source.

---

## 11. Sources

- Eve: Valkyrie — Wikipedia: https://en.wikipedia.org/wiki/Eve:_Valkyrie
- Introducing EVE: Valkyrie's New Carrier Assault Mode (Azure mirror of official): https://evevalkyriesecure-production-pre-production.azurewebsites.net/articles/dev-blogs/introducing-eve-valkyrie-s-new-carrier-assault-mode
- Guide to Single- and Multi-Player Modes (Azure mirror): https://evevalkyriesecure-production-pre-production.azurewebsites.net/articles/pilot-training/guide-to-single-and-multi-player-modes
- Get to Know the New Assault Class (Azure mirror): https://evevalkyriesecure-production-pre-production.azurewebsites.net/articles/pilot-training/get-to-know-the-new-assault-class
- Warzone: The Inside Scoop on the Support Class (Azure mirror): https://evevalkyriesecure-production-pre-production.azurewebsites.net/articles/pilot-training/warzone-the-inside-scoop-on-the-support-class
- The Valkyrie and the Schism – What's Their Beef? (Azure mirror): https://evevalkyriesecure-production-pre-production.azurewebsites.net/articles/news/the-valkyrie-and-the-schism-what-s-their-beef
- Mini Masterclass – Missile Deployment (Azure mirror): https://evevalkyriesecure-production-pre-production.azurewebsites.net/articles/news/mini-masterclass-missile-deployment
- Control Points – Easy as A, B, C (official, via search): https://www.evevalkyrie.com/articles/news/control-points-easy-as-a-b-c
- Revealed at Last: the Elusive Covert Class (official, via search): https://www.evevalkyrie.com/articles/pilot-training/revealed-at-last-the-elusive-covert-class
- Welcome To The Warzone – Guest Blog (EVE Online): https://www.eveonline.com/news/view/welcome-to-the-warzone-a-guest-blog-from-the-eve-valkyrie-team
- Everything You Need to Know About Eve: Valkyrie (PlayStation Blog): https://blog.playstation.com/2016/08/29/everything-you-need-to-know-about-eve-valkyrie/
- Eve: Valkyrie – Warzone class guide / Assault (PCGamesN): https://www.pcgamesn.com/eve-valkyrie/eve-valkyrie-class-guide
- Eve: Valkyrie's new Covert class (PCGamesN): https://www.pcgamesn.com/eve-valkyrie/eve-valkyrie-shadow-covert-class
- Stealthy ship / VR-exclusivity removal (PC Gamer): https://www.pcgamer.com/check-out-the-stealthy-ships-coming-in-eve-valkyries-massive-update-that-removes-vr-exclusivity/
- Heavy Ship Guide (Steam Community): https://steamcommunity.com/sharedfiles/filedetails/?id=1134266763
- Assault Ship Guide (Steam Community): https://steamcommunity.com/sharedfiles/filedetails/?id=1134260537
- EVE: Valkyrie Review and Guide (Imperium.News): https://imperium.news/eve-valkyrie-review-guide/
- EVE: Valkyrie – Warzone Trophy Guide (PSNProfiles): https://psnprofiles.com/guide/6748-eve-valkyrie-warzone-trophy-guide
- EVE: Valkyrie – Warzone Trophy Guide (MetaGame.guide): https://metagame.guide/eve-valkyrie-warzone-ps4/trophy-guide
- EVE: Valkyrie FAQ/Strategy Guide (Neoseeker, BlueboyX): https://www.neoseeker.com/eve-valkyrie/faqs/1819556-walkthrough.html
- EVE: Valkyrie – Warzone (PCGamingWiki): https://www.pcgamingwiki.com/wiki/EVE:_Valkyrie_-_Warzone
- New Player Servers – Rank Increased (official, via search): https://www.evevalkyrie.com/articles/news/New%20Player%20Servers%20-%20Rank%20Increased
- EVE: Valkyrie – Warzone Brings CCP's Game to Desktops (GeForce/NVIDIA): https://www.nvidia.com/en-gb/geforce/news/gfecnt/eve-valkyrie-warzone-for-desktops-nvidia-gameworks/
