-- =====================================================================
--  EVE: Valkyrie - Warzone  --  Static Game Data (SQL)
-- =====================================================================
--  Game:        EVE: Valkyrie (CCP Games, 2016) + the free "Warzone"
--               relaunch/expansion (26 Sep 2017). VR + flatscreen
--               multiplayer space-combat shooter set in EVE Online's
--               New Eden universe. Online servers shut down 5 Aug 2022.
--  Dialect:     SQLite 3 (also loads on PostgreSQL/MySQL with minor
--               tweaks). Uses INTEGER PRIMARY KEY, TEXT, foreign keys.
--  Source:      Compiled 2026-05-23 from the research dataset in
--               ../01-ships.md ... ../06-progression-economy.md
--               (Fandom wikis, PlayStation Blog, CCP dev blogs/Azure
--               mirror, Steam guides, PSNProfiles, press coverage).
--  Conventions: A `confidence` column (high|medium|low) and a `notes`
--               column flag uncertain/conflicting data. "era" is
--               'warzone' (2017), 'original' (2016), or 'lore'.
--  Idempotent:  Re-running drops and recreates everything.
-- =====================================================================

PRAGMA foreign_keys = ON;

-- ---------- teardown (reverse dependency order) ----------------------
DROP VIEW  IF EXISTS v_ship_full;
DROP VIEW  IF EXISTS v_warzone_roster;
DROP TABLE IF EXISTS ship_loadout;
DROP TABLE IF EXISTS ultra;
DROP TABLE IF EXISTS drone_deployable;
DROP TABLE IF EXISTS ship;
DROP TABLE IF EXISTS ship_class;
DROP TABLE IF EXISTS weapon;
DROP TABLE IF EXISTS module;
DROP TABLE IF EXISTS carrier_assault_stage;
DROP TABLE IF EXISTS game_mode;
DROP TABLE IF EXISTS map;
DROP TABLE IF EXISTS character;
DROP TABLE IF EXISTS voice_cast;
DROP TABLE IF EXISTS faction;
DROP TABLE IF EXISTS named_entity;
DROP TABLE IF EXISTS place;
DROP TABLE IF EXISTS recall_mission;
DROP TABLE IF EXISTS currency;
DROP TABLE IF EXISTS salvage_tier;
DROP TABLE IF EXISTS rank_milestone;
DROP TABLE IF EXISTS cosmetic_type;
DROP TABLE IF EXISTS cosmetic_item;
DROP TABLE IF EXISTS reward_capsule;
DROP TABLE IF EXISTS daily_challenge_type;
DROP TABLE IF EXISTS trophy;
DROP TABLE IF EXISTS dlc_edition;

-- =====================================================================
--  1. SHIP CLASSES
-- =====================================================================
CREATE TABLE ship_class (
    id          INTEGER PRIMARY KEY,
    name        TEXT NOT NULL,            -- Assault, Heavy, Support, Covert, Fighter
    era         TEXT NOT NULL,            -- 'warzone' | 'original'
    role        TEXT,
    notes       TEXT
);
INSERT INTO ship_class (id, name, era, role, notes) VALUES
 (1,'Assault','warzone','Light, fast, weapon-packed mid-range interceptors; primary dogfighters. Easiest class to learn.','Renamed from "Fighter" in Warzone.'),
 (2,'Heavy','warzone','The tank class: slow but heavily armoured/shielded with area-effect firepower; carrier-assault pushers.',NULL),
 (3,'Support','warzone','Team augmentation: repair/recharge allies or drain/strip enemy shields. Agile, shield-heavy, light armour.',NULL),
 (4,'Covert','warzone','Stealth glass cannon (single ship, Shadow): cloaking device, low defence, ambush playstyle. Built on Drifter technology.','New class introduced in Warzone (2017).'),
 (5,'Fighter','original','Original 2016 starting class; well-rounded dogfighters.','Became "Assault" in Warzone.'),
 (6,'Heavy','original','Original 2016 tank class.',NULL),
 (7,'Support','original','Original 2016 support class.',NULL);

-- =====================================================================
--  2. ULTRA ABILITIES (one per Warzone ship)
-- =====================================================================
CREATE TABLE ultra (
    id          INTEGER PRIMARY KEY,
    name        TEXT NOT NULL,
    class_id    INTEGER REFERENCES ship_class(id),
    effect_type TEXT,                     -- super-missile, buff, stun, invuln, field, bomb...
    description TEXT,
    confidence  TEXT DEFAULT 'high'
);
INSERT INTO ultra (id, name, class_id, effect_type, description) VALUES
 (1,'Mjolnir',1,'super-missile','One-shot super missile; catastrophic damage that penetrates shields and armour.'),
 (2,'Matter Injection',1,'mobility-buff','Unlimited boost/capacitor for a short duration (great for carrier attacks).'),
 (3,'Remove Plasma Vent',1,'weapon-buff','Fire unlimited shots with no overheat penalty for a short time. (a.k.a. "Plasma Vent")'),
 (4,'Mayhem',1,'damage-buff','Temporary increased weapon damage.'),
 (5,'Void Storm',2,'aoe-stun','EMP bomb that stuns nearby enemy ships in a radius.'),
 (6,'Cocoon',2,'invulnerability','Temporary full invulnerability ("nothing can touch you").'),
 (7,'Silence',2,'aoe-stun','Instantly stuns ships within a pulse radius.'),
 (8,'Spectre Bond',2,'damage-immunity','Brief immunity to all damage. (a.k.a. "Spectre''s Bond")'),
 (9,'Fate''s Call',3,'team-field','Pulse that shield-recharges all nearby teammates.'),
 (10,'Radiant Burst',3,'team-field','Pulse that repairs the hulls of all nearby teammates.'),
 (11,'Death''s Grasp',3,'enemy-field','Strips all nearby enemy shields, leaving them vulnerable.'),
 (12,'Dragon''s Thorn',3,'sticky-bomb','Fires a sticky bomb that attaches to an enemy then detonates.'),
 (13,'Violent Whisper',4,'nova-bomb','Nova bomb with a massive blast radius (most destructive Ultra); drop then flee before detonation.');

-- =====================================================================
--  3. SHIPS  (Warzone 13 + original-2016 roster + legendary/NPC)
-- =====================================================================
CREATE TABLE ship (
    id          INTEGER PRIMARY KEY,
    name        TEXT NOT NULL,
    class_id    INTEGER REFERENCES ship_class(id),
    era         TEXT NOT NULL,            -- 'warzone' | 'original' | 'legendary' | 'npc' | 'event'
    role        TEXT,
    armor       INTEGER,                  -- Warzone display stat (NULL if unknown)
    shields     INTEGER,                  -- Warzone display stat
    base_speed  INTEGER,
    max_speed   INTEGER,
    ultra_id    INTEGER REFERENCES ultra(id),
    -- original-2016 X/10 stat bars (NULL for Warzone hulls):
    fp_bar      INTEGER,                  -- firepower /10
    armor_bar   INTEGER,                  -- /10
    shield_bar  INTEGER,                  -- /10
    speed_bar   INTEGER,                  -- /10
    confidence  TEXT DEFAULT 'high',
    notes       TEXT
);
-- ----- Warzone (2017) roster: 13 ships, full display stats -----------
INSERT INTO ship (id,name,class_id,era,role,armor,shields,base_speed,max_speed,ultra_id,notes) VALUES
 (1,'Wraith',1,'warzone','All-round fighter (Mark Six / Mk6)',226,110,200,600,1,'Default starter/tutorial hull.'),
 (2,'Jackal',1,'warzone','Brawler (close-range)',210,168,140,600,2,NULL),
 (3,'Strix',1,'warzone','Sniper (long-range)',112,224,200,500,3,'Has forward Dash; Missile Pod up to 7.'),
 (4,'Yurei',1,'warzone','Interceptor',110,112,212,750,4,'Highest top speed in Assault class.'),
 (5,'Scarab',2,'warzone','Tank',336,336,200,400,5,NULL),
 (6,'Vulcan',2,'warzone','Brute',400,400,200,400,6,'Highest combined armour+shields in the game.'),
 (7,'Corvus',2,'warzone','Disruptor',224,448,200,500,7,'Sonar reveals cloaked Shadows (hard-counter to Covert).'),
 (8,'Hydra',2,'warzone','Gunner',448,224,200,500,8,'Dual-weapon: Flak Cannon + armour-piercing Rail Gun.'),
 (9,'Banshee',3,'warzone','Engineer',124,228,300,600,9,'Default Support hull; deploys Spiderbots.'),
 (10,'Nagi',3,'warzone','Medic',124,228,300,600,10,NULL),
 (11,'Medusa',3,'warzone','Defender',228,124,300,600,11,NULL),
 (12,'Kirin',3,'warzone','Saboteur',228,124,300,600,12,NULL),
 (13,'Shadow',4,'warzone','Ambush / assassin',140,60,400,600,13,'Only Covert ship; Cloak 30s on / 15s recharge; Drifter tech.');
-- ----- Original 2016 roster (X/10 stat bars) -------------------------
INSERT INTO ship (id,name,class_id,era,role,fp_bar,armor_bar,shield_bar,speed_bar,notes) VALUES
 (20,'Wraith',5,'original','Well-rounded basic fighter (starter)',6,5,3,6,'Gatling Guns, Head-Tracked Missiles, Countermeasures.'),
 (21,'Dominator',5,'original','Slower-firing, higher per-shot damage',7,4,4,5,'Auto Cannons, HT Missiles, Countermeasures.'),
 (22,'Accord',5,'original','Agile; strong vs shields, weak vs armour',7,3,4,6,'Pulse Cannons, HT Missiles, Countermeasures.'),
 (23,'Assuage',5,'original','Counters heavies via upgraded EMS',6,3,3,5,'Auto Cannons, HT Missiles, EMS.'),
 (24,'Spectre',6,'original','Base Heavy; balanced armour+shield',6,5,5,4,'HT Flak Cannon, Microwarp Drive, EMS.'),
 (25,'Rhino',6,'original','Trades shields for firepower',8,5,3,4,'HT Tri-Flak, Microwarp Drive, Countermeasures.'),
 (26,'Goliath',6,'original','Long-range missiles vs stripped targets',6,5,3,4,'HT Missiles, Microwarp Drive, Spiderbots.'),
 (27,'Cyclone',6,'original','Defensive heavy via EMS',7,5,3,4,'HT Tri-Flak, Microwarp Drive, EMS.'),
 (28,'Storm',6,'original','High-velocity energy bolts',6,3,5,4,'HT Laser Gatling Cannon, Microwarp Drive, EMS.'),
 (29,'Banshee',7,'original','Base Support',NULL,NULL,NULL,NULL,'Phaser charge / shield-strip.'),
 (30,'Guardian',7,'original','Support',NULL,NULL,NULL,NULL,'Buff Beam / Countermeasures.'),
 (31,'Warden',7,'original','Support',NULL,NULL,NULL,NULL,NULL),
 (32,'Sentinel',7,'original','Support',NULL,NULL,NULL,NULL,NULL),
 (33,'Revenant',7,'original','Mines + corrupt damage-amp beam',NULL,NULL,NULL,NULL,'First mine-capable Support; unlocks at 125,000 XP.'),
 (34,'Siren',7,'original','Support',NULL,NULL,NULL,NULL,NULL),
 (35,'Phantom',7,'original','Support',NULL,NULL,NULL,NULL,NULL),
 (36,'Maelstrom',6,'original','Heavy with Mortar special',NULL,NULL,NULL,NULL,'Mortar: slow shells, proximity-detonating cluster AoE, extreme direct-hit damage.');
-- ----- Legendary (Founder, pre-maxed) & event/NPC --------------------
INSERT INTO ship (id,name,class_id,era,role,confidence,notes) VALUES
 (40,'Squadron 33 Wraith',1,'legendary','Legendary pre-maxed Wraith',  'high','Oculus Rift Founder''s Pack (a.k.a. S-33).'),
 (41,'S4 Wraith',1,'legendary','Legendary pre-maxed Wraith',          'high','PlayStation VR Founder''s Pack.'),
 (42,'MkV Wraith',1,'legendary','Legendary pre-maxed Wraith',         'high','HTC Vive Founder''s Pack.'),
 (43,'Bounty',NULL,'legendary','Legendary variant',                   'low','Listed as a Legendary/Founder-era ship; details unconfirmed.'),
 (50,'Templar',NULL,'npc','NPC / enemy hull',  'low','From original-game NPC roster.'),
 (51,'Cyclops',NULL,'npc','NPC / enemy hull',  'low',NULL),
 (52,'Merlin',NULL,'npc','NPC / enemy hull',   'low','Caldari frigate name in EVE Online.'),
 (53,'Dragonfly',NULL,'npc','NPC / enemy hull','low',NULL),
 (54,'Blackbird',NULL,'npc','NPC / enemy hull','low','Caldari cruiser name in EVE Online.'),
 (55,'Hookbill',NULL,'npc','NPC / enemy hull','low','Caldari Navy frigate name in EVE Online.'),
 (56,'Kestrel',NULL,'npc','NPC / enemy hull','low','Caldari frigate name in EVE Online.'),
 (60,'Firbolg',NULL,'event','Event ship',     'low',NULL),
 (61,'Caldari Wraith',NULL,'event','Event Wraith variant','low',NULL),
 (62,'Infected',NULL,'event','Event ship',     'low',NULL);

-- =====================================================================
--  4. WEAPONS  (primaries & secondaries) and MODULES (abilities/EWAR)
-- =====================================================================
CREATE TABLE weapon (
    id          INTEGER PRIMARY KEY,
    name        TEXT NOT NULL,
    category    TEXT,                     -- primary | secondary | missile | beam | rail
    description TEXT
);
INSERT INTO weapon (id,name,category,description) VALUES
 (1,'Assault Cannons','primary','Rapid-fire projectile; strong medium-range DPS (~150). Overheats with sustained fire.'),
 (2,'Ripper','primary','High-damage close-range burst shots with splash.'),
 (3,'Alternate Ripper','secondary','High-damage projectile without splash.'),
 (4,'Pulse Laser','primary','High-damage long-range "sniper" laser (paired beams).'),
 (5,'Pulse Cannon','primary','Mid-range automatic pulse cannon (~150 DPS).'),
 (6,'Pulse Cannons','primary','Dual pulse cannons (Yurei); sustained mid-range damage.'),
 (7,'Flak Cannon','primary','High-damage flak rounds with splash; close range.'),
 (8,'Tri Flak Cannon','primary','High close-range damage with extra splash.'),
 (9,'Laser Gatling','primary','Four rotating barrels, rapid-fire pulse beam; accuracy degrades with sustained fire.'),
 (10,'Rail Gun','secondary','Long-range armour-piercing projectile; punches through armour & shields. (a.k.a. Rail Cannon)'),
 (11,'Phaser','primary','Mid-range continuous-damage beam.'),
 (12,'Twin Linked Carbine','primary','Double-barrelled rapid-fire projectiles.'),
 (13,'Shard Rifle','primary','High-spread weapon firing sticky projectiles that detonate over time.'),
 (14,'Plasma Beam','primary','Hitscan; 4-shot burst or charge-and-release heavy blast (no lead reticle).'),
 (15,'Missile Launcher','missile','Up to 5 lock-on missiles with splash damage.'),
 (16,'Missile Pod','missile','Up to 7 lock-on missiles with splash.'),
 (17,'Trine Missiles','missile','Up to 3 lock-on missiles with splash.'),
 (18,'Drain Beam','beam','Lock-on beam that drains enemy shields (~10/s).'),
 (19,'Repair Beam','beam','Lock-on beam recharging ally shields & armour (~15/s). (a.k.a. Heal Beam)'),
 (20,'Capacitor Restore Beam','beam','Lock-on beam restoring a teammate''s capacitor (~10/s).'),
 (21,'Apply Mini Overshield','beam','Repairs an ally''s shield or applies an extra temporary shield.'),
 (22,'Gatling Guns','primary','Original-game primary (Wraith 2016).'),
 (23,'Auto Cannons','primary','Original-game primary (Dominator/Assuage 2016).'),
 (24,'Head-Tracked Missiles','missile','Original-game lock-on missiles aimed by headset gaze.'),
 (25,'Mortar','secondary','Maelstrom (original) special: slow shells, proximity-detonating cluster AoE, extreme direct-hit damage.'),
 (26,'Head-Tracked Buff Beam','beam','Generic original-game Support beam: heals ally armour/shield OR drains enemy shields.');

CREATE TABLE module (
    id          INTEGER PRIMARY KEY,
    name        TEXT NOT NULL,
    type        TEXT,                     -- defensive | utility | mobility | ewar
    description TEXT
);
INSERT INTO module (id,name,type,description) VALUES
 (1,'ECM','defensive','Deploys a chaff cloud that blocks/breaks incoming missiles.'),
 (2,'EMS','defensive','Electromagnetic shield: blocks incoming missiles and converts the ship''s projectiles into EMP rounds.'),
 (3,'Overshield','defensive','Adds a temporary extra shield layer (self).'),
 (4,'Self Repair','defensive','Recharges own shields and repairs armour when safe.'),
 (5,'Micro Warp Drive','mobility','Burst of speed for escape/repositioning. (MWD)'),
 (6,'Dash','mobility','Blasts the ship forward in a straight line (evasive escape).'),
 (7,'Sonar','ewar','Detection pulse that reveals cloaked (Covert) ships.'),
 (8,'HUD Scrambler','ewar','Disorienting pulse that scrambles enemy HUDs.'),
 (9,'Mark Target','ewar','Marks an enemy (~10s) so it takes increased damage from the Shadow and teammates.'),
 (10,'Spiderbots','utility','Auto-attaching robotic drones that heal allies or damage enemy shields; also break missile lock.'),
 (11,'Countermeasures','defensive','Generic flare/chaff (original game) that breaks missile lock.'),
 (12,'Cloak','utility','Covert cloaking device: invisible ~30s, ~15s recharge; firing/marking drops it.'),
 (13,'Proximity Mines','utility','Deployable explosives; detonate on contact, max 3 active; also break missile lock.'),
 (14,'Decoy','utility','Generates a holographic copy of your ship to distract pursuers (cannot fool missile lock).');

-- =====================================================================
--  5. SHIP LOADOUTS  (Warzone: Primary / Secondary / Tertiary per hull)
-- =====================================================================
CREATE TABLE ship_loadout (
    ship_id     INTEGER REFERENCES ship(id),
    slot        TEXT NOT NULL,            -- Primary | Secondary | Tertiary
    weapon_id   INTEGER REFERENCES weapon(id),
    module_id   INTEGER REFERENCES module(id),
    detail      TEXT,
    PRIMARY KEY (ship_id, slot)
);
INSERT INTO ship_loadout (ship_id,slot,weapon_id,module_id,detail) VALUES
 -- Wraith
 (1,'Primary',1,NULL,'Assault Cannons (~150 DPS)'),
 (1,'Secondary',15,NULL,'Missile Launcher (up to 5)'),
 (1,'Tertiary',NULL,1,'ECM (15s CD / 3s dur)'),
 -- Jackal
 (2,'Primary',2,NULL,'Ripper (~56 DPS)'),
 (2,'Secondary',3,NULL,'Alternate Ripper (~100 DPS)'),
 (2,'Tertiary',NULL,3,'Overshield (60s CD / 30s dur)'),
 -- Strix
 (3,'Primary',4,NULL,'Pulse Laser (~60 DPS)'),
 (3,'Secondary',16,NULL,'Missile Pod (up to 7)'),
 (3,'Tertiary',NULL,6,'Dash (30s CD / 2s dur)'),
 -- Yurei
 (4,'Primary',6,NULL,'Pulse Cannons (~150 DPS)'),
 (4,'Secondary',17,NULL,'Trine Missiles (up to 3)'),
 (4,'Tertiary',NULL,1,'ECM (15s CD / 3s dur)'),
 -- Scarab
 (5,'Primary',7,NULL,'Flak Cannons (~100 DPS)'),
 (5,'Secondary',NULL,5,'Micro Warp Drive (15s/4s)'),
 (5,'Tertiary',NULL,2,'EMS (15s/6s)'),
 -- Vulcan
 (6,'Primary',9,NULL,'Laser Gatlings (~100 DPS)'),
 (6,'Secondary',NULL,5,'Micro Warp Drive (15s/4s)'),
 (6,'Tertiary',NULL,4,'Self Repair (45s/5s)'),
 -- Corvus
 (7,'Primary',8,NULL,'Tri Flak Cannon (~100 DPS)'),
 (7,'Secondary',NULL,7,'Sonar (30s CD / 10s detect)'),
 (7,'Tertiary',NULL,2,'EMS (15s/6s)'),
 -- Hydra
 (8,'Primary',7,NULL,'Flak Cannon (~46 DPS)'),
 (8,'Secondary',10,NULL,'Rail Gun / Rail Cannon (~54 DPS)'),
 (8,'Tertiary',NULL,1,'ECM (15s/3s)'),
 -- Banshee
 (9,'Primary',11,NULL,'Phaser (~75 DPS)'),
 (9,'Secondary',18,NULL,'Drain Beam (~10/s)'),
 (9,'Tertiary',NULL,10,'Spiderbots (10s CD; 30 heal/s, 30 dmg/s)'),
 -- Nagi
 (10,'Primary',12,NULL,'Twin Linked Carbine (~26 DPS)'),
 (10,'Secondary',19,NULL,'Repair/Heal Beam (~15/s)'),
 (10,'Tertiary',NULL,4,'Self Repair (45s/5s)'),
 -- Medusa
 (11,'Primary',5,NULL,'Pulse Cannon (~150 DPS)'),
 (11,'Secondary',21,NULL,'Apply Mini Overshield'),
 (11,'Tertiary',NULL,2,'EMS (15s/6s)'),
 -- Kirin
 (12,'Primary',13,NULL,'Shard Rifle (~75 DPS)'),
 (12,'Secondary',20,NULL,'Capacitor Restore Beam (~10/s)'),
 (12,'Tertiary',NULL,8,'HUD Scrambler (30s/5s)'),
 -- Shadow
 (13,'Primary',14,NULL,'Plasma Beam (~33 DPS; 4-shot or charged)'),
 (13,'Secondary',NULL,9,'Mark Target (30s CD / 10s dur)'),
 (13,'Tertiary',NULL,12,'Cloak (15s CD / 30s dur)');

-- =====================================================================
--  6. DRONES, DEPLOYABLES, AI / CARRIER SUBSYSTEMS
-- =====================================================================
CREATE TABLE drone_deployable (
    id          INTEGER PRIMARY KEY,
    name        TEXT NOT NULL,
    category    TEXT,                     -- drone | mine | beam/field | ewar | carrier_subsystem | ai | map_feature
    source      TEXT,                     -- ship / class / environment
    function    TEXT,
    confidence  TEXT DEFAULT 'high',
    notes       TEXT
);
INSERT INTO drone_deployable (id,name,category,source,function,confidence,notes) VALUES
 (1,'Capture Drone','drone','All ships','Deploy near a Control Point / Power Relay Station to capture it; 1 per player.','high','a.k.a. Control Drone. Used in Control & Carrier Assault.'),
 (2,'Spiderbots','drone','Banshee (Support)','Auto-attaching bots that heal allies or drain enemy shields; also break missile lock.','high','Cap 3 active.'),
 (3,'Decoy','drone','Original game','Holographic copy of your ship to distract pursuers; cannot fool missile lock.','medium','Warzone ship assignment unconfirmed.'),
 (4,'Wormhole-update Drones','drone','Valkyrie-specific','New drone assets added in the Feb 2017 Wormholes update.','low','Existence confirmed; names undocumented.'),
 (5,'Proximity Mines','mine','Revenant + various','Detonate on contact for AoE damage; persist until triggered; break missile lock.','high','Cap 3 active; a 4th self-destructs the oldest.'),
 (6,'Repair Beam','beam/field','Nagi','Recharges ally shields & armour.','high',NULL),
 (7,'Drain Beam','beam/field','Banshee','Drains enemy shields.','high',NULL),
 (8,'Capacitor Restore Beam','beam/field','Kirin','Restores a teammate''s capacitor.','high',NULL),
 (9,'Mini Overshield','beam/field','Medusa','Applies an extra temporary shield to an ally.','high',NULL),
 (10,'ECM (Chaff)','ewar','Wraith, Yurei, Hydra','Chaff cloud that blocks/breaks incoming missiles.','high',NULL),
 (11,'EMS','ewar','Medusa, Scarab, Corvus','Blocks missiles; converts projectiles to EMP rounds.','high',NULL),
 (12,'HUD Scrambler','ewar','Kirin','Scrambles enemy HUDs.','high',NULL),
 (13,'Sonar','ewar','Corvus','Reveals cloaked Covert ships.','high',NULL),
 (14,'Mark Target','ewar','Shadow','Marks an enemy for bonus damage from team.','high',NULL),
 (15,'Carrier Shields','carrier_subsystem','Environment','Disabled when attackers hold 2 of 3 relay stations.','high',NULL),
 (16,'Power Relay Stations','carrier_subsystem','Environment','x3 capture points; capturing 2 lowers carrier shields.','high',NULL),
 (17,'Cooling Nodes','carrier_subsystem','Environment','Destructible nodes around the carrier; destroy to expose the Core.','high',NULL),
 (18,'Power Core','carrier_subsystem','Environment','Final objective in the trench/access tunnel; destroy to win.','high',NULL),
 (19,'Gun/Machine-gun Turrets','carrier_subsystem','Environment','Automated AI defence turrets, densest on the carrier front.','high',NULL),
 (20,'Flak Cannons (carrier)','carrier_subsystem','Environment','Automated carrier defence; hard to track up close.','high',NULL),
 (21,'Missile Launchers (carrier)','carrier_subsystem','Environment','Automated carrier defence; hard to track up close.','high',NULL),
 (22,'Boost Gates','map_feature','Environment','One-way speed-boost gates that catapult pilots toward objectives.','high','a.k.a. Speed Boost Gates.'),
 (23,'AI Pilot Ships','ai','Co-op & Survival','Bot-flown ships using the same 4 classes as players.','high','No unique NPC bestiary beyond carrier turrets.');

-- =====================================================================
--  7. GAME MODES & CARRIER ASSAULT STAGES
-- =====================================================================
CREATE TABLE game_mode (
    id            INTEGER PRIMARY KEY,
    name          TEXT NOT NULL,
    category      TEXT,                   -- pvp | pve/coop | singleplayer
    win_condition TEXT,
    rules         TEXT,
    confidence    TEXT DEFAULT 'high'
);
INSERT INTO game_mode (id,name,category,win_condition,rules,confidence) VALUES
 (1,'Team Deathmatch','pvp','Deplete enemy clone pool, or hold more clones at time expiry.','8v8. Each team has a shared clone pool; each death subtracts one clone.','high'),
 (2,'Control','pvp','Drain the enemy clone pool to zero by holding capture points.','Three control points (A/B/C). Deploy a drone to capture; held points accelerate enemy pool drain.','high'),
 (3,'Carrier Assault','pvp','Destroy the enemy faction''s Carrier (expose & destroy its Core).','3-stage objective mode (Skirmish/Attack/Breach); ~15-20 min.','high'),
 (4,'Extraction','pvp','CTF-style: secure a relic and deliver it to a drop-off point.','Both squadrons fight over a single relic. Added in Warzone.','high'),
 (5,'Wormhole Mode','pvp','Varies (rotating ruleset).','Weekend event (Rank 5+); rotating modified rules, unique environments, preset loadouts.','medium'),
 (6,'Co-op vs AI','pve/coop','Same as the underlying mode, vs balanced AI.','Available in Deathmatch, Control and Carrier Assault; earns XP, Silver and Salvage.','high'),
 (7,'Training','singleplayer','Complete training modules.','Flight basics & weapon systems; modules unlock per class; obstacle courses.','high'),
 (8,'Recall','singleplayer','Complete story missions.','Short story/tutorial missions reliving pilots'' memories; collect audio logs called "Echoes".','high'),
 (9,'Scout','singleplayer','Explore.','Enemy-free exploration of maps; find Echoes (lore) and salvage/relic containers; earns Reward Capsules.','high'),
 (10,'Survival','singleplayer','Survive waves / score attack.','Wave-based combat vs increasingly difficult AI; difficulties Novice & Pro. Does NOT grant XP.','high'),
 (11,'Test Arena','singleplayer','Sandbox.','Free try-out of any ship, no time limit, no damage consequences (collision still active).','high');

CREATE TABLE carrier_assault_stage (
    stage_no    INTEGER PRIMARY KEY,
    name        TEXT NOT NULL,
    description TEXT
);
INSERT INTO carrier_assault_stage (stage_no,name,description) VALUES
 (1,'Skirmish / Shield Disable','Capture 2 of 3 control points (drone-deploy) to drop the enemy Carrier''s shields for a limited time.'),
 (2,'Attack / Defense (Cooling Nodes)','With shields down, destroy Cooling Nodes around the Carrier while dodging its turrets and defenders. Time-limited; failure reverts to Skirmish.'),
 (3,'Breach (Core / trench run)','With enough Cooling Nodes destroyed, the Core is exposed via a trench run. Drive it critical to destroy the Carrier and win.');

-- =====================================================================
--  8. MAPS / ARENAS
-- =====================================================================
CREATE TABLE map (
    id          INTEGER PRIMARY KEY,
    name        TEXT NOT NULL,
    era         TEXT,                     -- launch | update | warzone
    environment TEXT,
    lore        TEXT,
    confidence  TEXT DEFAULT 'high'
);
INSERT INTO map (id,name,era,environment,lore,confidence) VALUES
 (1,'Necropolis','launch','Drifting graveyard of destroyed ships / debris fields.','Wreckage of ships destroyed at the Battle of Esmes III.','high'),
 (2,'Shipyard','launch','Tunnels and beams of a ship-construction facility.','Former Caldari facility assimilated by the Guristas; supercarrier Phoenix docked here.','high'),
 (3,'Cathedral','launch','Cavernous central hall for religious gatherings.','Religious/spiritual installation (Amarr-flavoured).','high'),
 (4,'Forge','launch','Asteroid/industrial "forge"-themed environment.',NULL,'high'),
 (5,'Convoy','launch','Built around ships/convoy traffic.','Listed among the original ~5 maps (preview era); may have been renamed/cut.','low'),
 (6,'Crossroads','update','Map supporting Scout & Survival modes.','Home of Station 27 (~10 km long).','high'),
 (7,'Gateway','update','Iceteroid field around a massive unfinished warp gate; blue-white nebula.','Warp gate based on Gallente ring architecture; under construction. Added in the "Gatecrash" update (Dec 2016).','high'),
 (8,'Solitude','update','Snowy, rocky planetary landscape; carrier-exit onto terrain.','Shares its name with a real EVE Online region; one of the largest maps. Good for mine-dropping Supports.','high'),
 (9,'Fleet','warzone','Massive Sisters of EVE space station "preparing for war"; large SoE ships create fly-through cover.','Sisters of EVE station; Stratios & Nestor ships traffic the area.','high'),
 (10,'Outpost','warzone','Dark, fog-shrouded, lightning-dappled circular Drifter base; narrow rim tunnels.','Remote Drifter structure "that holds the key to new technologies"; Drifter battleships docked inside.','high'),
 (11,'Wormholes','warzone','Rotating weekly variants that twist the ruleset.','Not a fixed arena; weekend event content.','medium');

-- =====================================================================
--  9. FACTIONS, CHARACTERS, VOICE CAST
-- =====================================================================
CREATE TABLE faction (
    id          INTEGER PRIMARY KEY,
    name        TEXT NOT NULL,
    type        TEXT,                     -- game-original | new-eden
    role        TEXT,
    leader      TEXT,
    notes       TEXT
);
INSERT INTO faction (id,name,type,role,leader,notes) VALUES
 (1,'Valkyrie','game-original','Player faction; independent clone-pilot mercenary force.','Rán Kavik','Founded by Rán after defecting from the Schism.'),
 (2,'Schism','game-original','Antagonist faction; clone-pilot army.','Jirai "Fatal" Laitanen','Uses illegal cloning tech to harvest pilots.'),
 (3,'Caldari State','new-eden','Major empire.',NULL,'Origin of Fatal/the Guristas; Shipyard was a former Caldari facility.'),
 (4,'Gallente Federation','new-eden','Major empire.',NULL,'Gateway map''s warp gate uses Gallente ring architecture.'),
 (5,'Amarr Empire','new-eden','Major empire.',NULL,'Referenced via the Sarum Family royal house.'),
 (6,'Minmatar Republic','new-eden','Major empire.',NULL,'Referenced as a New Eden faction.'),
 (7,'Guristas Pirates','new-eden','Pirate clan.','Jirai "Fatal" Laitanen & Korako "the Rabbit" Kosakami','Canon EVE faction tied to Fatal''s backstory; based in Venal.'),
 (8,'Sisters of EVE','new-eden','Humanitarian/explorer org.',NULL,'Owners of the Fleet map station; ships Stratios & Nestor.'),
 (9,'Drifters','new-eden','Mysterious faction.',NULL,'Base is the Outpost map; Shadow built on Drifter technology.'),
 (10,'Sarum Family','new-eden','Amarr royal house.',NULL,'Named in PlayStation Blog lore coverage.');

CREATE TABLE character (
    id          INTEGER PRIMARY KEY,
    name        TEXT NOT NULL,
    role        TEXT,
    faction_id  INTEGER REFERENCES faction(id),
    voice_actor TEXT,
    confidence  TEXT DEFAULT 'high',
    notes       TEXT
);
INSERT INTO character (id,name,role,faction_id,voice_actor,confidence,notes) VALUES
 (1,'Rán Kavik','Leader of the Valkyrie; player''s commander, mentor and mission-giver.',1,'Katee Sackhoff','high','Provides briefings, status updates and flight training.'),
 (2,'Jirai "Fatal" Laitanen','Leader of the Schism; antagonist; inventor of the illegal clone-harvesting tech.',2,NULL,'high','Canon EVE co-founder of the Guristas; Rán''s former captor. In-game VA unconfirmed.'),
 (3,'Korako "the Rabbit" Kosakami','Technical genius; co-founder of the Guristas (lore).',7,NULL,'medium','EVE Online canon; spelling varies (Kosakami vs Koskarami).'),
 (4,'Luecin Rileau','Gallente Federation ambassador (lore; kidnapped by the Guristas).',4,NULL,'medium','EVE Online canon backstory only.'),
 (5,'The Player Pilot','A cloned ace pilot recruited into the Valkyrie.',1,NULL,'high','Identity built via Recall missions.');

CREATE TABLE voice_cast (
    id          INTEGER PRIMARY KEY,
    actor       TEXT NOT NULL,
    role        TEXT,
    confidence  TEXT DEFAULT 'high',
    notes       TEXT
);
INSERT INTO voice_cast (id,actor,role,confidence,notes) VALUES
 (1,'Katee Sackhoff','Rán (Rán Kavik)','high','Battlestar Galactica''s "Starbuck".'),
 (2,'Rich Keeble','Credited cast (role unconfirmed)','medium',NULL),
 (3,'Gabrielle Fritz','Female Pilot / Crew','medium',NULL),
 (4,'Paul-William Mawhinney','Pilot / Crew','medium',NULL);

-- =====================================================================
--  10. NAMED ENTITIES (capital ships / stations / lore objects) & PLACES
-- =====================================================================
CREATE TABLE named_entity (
    id          INTEGER PRIMARY KEY,
    name        TEXT NOT NULL,
    type        TEXT,                     -- supercarrier | carrier | station | titan | battleship | frigate | cruiser
    detail      TEXT,
    confidence  TEXT DEFAULT 'high'
);
INSERT INTO named_entity (id,name,type,detail,confidence) VALUES
 (1,'Phoenix','supercarrier','Docked at the Shipyard map; exceeds 3,000 m. (Also a Caldari dreadnought class in EVE Online.)','high'),
 (2,'Station 27','station','Space station at Crossroads; ~10 km long.','high'),
 (3,'Solitude base','installation','Surface installation on the Solitude map.','high'),
 (4,'Nidhoggur','carrier','Minmatar carrier class; a destroyed Nidhoggur appears as a map control point/cover.','high'),
 (5,'Schism Carrier','carrier','Capital ship destroyed in Carrier Assault when its Core goes critical.','high'),
 (6,'Valkyrie Carrier','carrier','Home/base carrier players launch from.','medium'),
 (7,'Titans','titan','Capital-ship class referenced in lore (13-18 km long; scale reference).','high'),
 (8,'Stratios','cruiser','Sisters of EVE ship seen at the Fleet map.','high'),
 (9,'Nestor','battleship','Sisters of EVE ship seen at the Fleet map.','high'),
 (10,'Drifter battleships','battleship','Capital/battleship hulls docked at the Outpost map.','high'),
 (11,'Condor','frigate','Fatal & the Rabbit stole two Condor-class frigates when deserting the Caldari Navy (lore).','high');

CREATE TABLE place (
    id          INTEGER PRIMARY KEY,
    name        TEXT NOT NULL,
    type        TEXT,                     -- galaxy | region | system | battle | border
    notes       TEXT,
    confidence  TEXT DEFAULT 'high'
);
INSERT INTO place (id,name,type,notes,confidence) VALUES
 (1,'New Eden','galaxy','The EVE Online universe / setting.','high'),
 (2,'Solitude','region','Real EVE Online region; shares its name with the icy/snowy map.','high'),
 (3,'Crossroads','system','Site of Station 27.','high'),
 (4,'Necropolis','location','Ship graveyard (map location).','high'),
 (5,'Battle of Esmes III','battle','Conflict that created the Necropolis wreckage; only system/planet name tied to a map.','medium'),
 (6,'Venal','region','Home region of the Guristas (Fatal''s backstory).','high'),
 (7,'Caldari/Gallente border space','border','Where Fatal & the Rabbit fled to found the Guristas.','high');

-- =====================================================================
--  11. SINGLE-PLAYER RECALL MISSIONS
-- =====================================================================
CREATE TABLE recall_mission (
    id          INTEGER PRIMARY KEY,
    name        TEXT NOT NULL,
    objective   TEXT,
    trophy      TEXT,
    confidence  TEXT DEFAULT 'high'
);
INSERT INTO recall_mission (id,name,objective,trophy,confidence) VALUES
 (1,'The First Assault','Destroy a Carrier (acts as a Carrier-Assault primer).',NULL,'high'),
 (2,'Station 27','Recall mission / checkpoint.','Reboot & Rewind (Gold)','high'),
 (3,'Esmes III','Recall mission objective.','Quantum Leap (Gold)','high'),
 (4,'Convoy','Story-driven Recall mission scenario.',NULL,'medium');

-- =====================================================================
--  12. ECONOMY: CURRENCIES, SALVAGE, RANKS
-- =====================================================================
CREATE TABLE currency (
    id            INTEGER PRIMARY KEY,
    name          TEXT NOT NULL,
    alias         TEXT,
    warzone_status TEXT,
    how_earned    TEXT,
    what_buys     TEXT
);
INSERT INTO currency (id,name,alias,warzone_status,how_earned,what_buys) VALUES
 (1,'Silver','Visk','Primary in-game currency','Earned from battles, Daily Challenges, Reward Capsules.','Paint jobs, decals, cockpits, pilot suits, helmets, and implants/XP boosters.'),
 (2,'Gold','Gold Bonds','Removed as a spendable shop currency in Warzone','Originally purchasable with real money.','(Originally) premium cosmetics, ships, boosters. Remaining balances converted to Gold Reward Capsules; Gold->Silver rate doubled in players'' favour.'),
 (3,'Class XP',NULL,'Core progression','Per-ship combat performance.','Ship upgrade-tree modifications (15-node tree; from 1,000 XP each).'),
 (4,'Pilot Reputation',NULL,'Account rank metric (not spendable)','Aggregated Class XP at end of match.','Raises Pilot Rank.');

CREATE TABLE salvage_tier (
    id          INTEGER PRIMARY KEY,
    tier        TEXT NOT NULL,
    rarity      TEXT,
    notes       TEXT
);
INSERT INTO salvage_tier (id,tier,rarity,notes) VALUES
 (1,'Raw','Common','In-match pickup that fuels the Ultra gauge; team salvage shared after a match.'),
 (2,'Component','Rare',NULL),
 (3,'Prime','Epic','Higher-tier ships/upgrades require higher-value salvage.');

CREATE TABLE rank_milestone (
    rank        INTEGER PRIMARY KEY,
    label       TEXT,
    notes       TEXT
);
INSERT INTO rank_milestone (rank,label,notes) VALUES
 (1,'Start','New players begin in Flight School / Proving Grounds (bots+novices) until ~rank 5.'),
 (3,'Heavy unlock','Heavy-class daily challenges/ships gated until rank 3.'),
 (5,'New Player Servers exit','Up to rank 5 you play only similarly-skilled players + tuned AI.'),
 (10,'Graduation Day','Trophy milestone.'),
 (25,'Half A Legend','Trophy milestone.'),
 (26,'Matchmaking bracket','Moves from the 1-25 pool into the 26-60 pool.'),
 (50,'Master And Commander','Trophy milestone; ~739,000 XP total. Original rank cap.'),
 (60,'Warzone rank cap','Cap raised to 60 in Warzone (10 new Drifter-themed rank icons).');

-- =====================================================================
--  13. COSMETICS, REWARD CAPSULES, DAILY CHALLENGES
-- =====================================================================
CREATE TABLE cosmetic_type (
    id          INTEGER PRIMARY KEY,
    name        TEXT NOT NULL,
    details     TEXT
);
INSERT INTO cosmetic_type (id,name,details) VALUES
 (1,'Paint Jobs','"Literally dozens." Rarities Common/Rare/Epic; Rare+ also change cockpit interior and HUD.'),
 (2,'Decals','Layered on the ship; mix styles + colours (skulls, fangs, fists, smileys...).'),
 (3,'Cockpit interiors','Merged with paint jobs in Warzone (Rare/Epic paints change cockpit + HUD).'),
 (4,'Pilot suits','Themed flight suits (e.g. Assault, Stealth); male & female variants.'),
 (5,'Pilot helmets','Wide range; Silver-buyable or capsule-earned.'),
 (6,'Forum avatars','Profile/forum avatars (e.g. platform-coloured Founder avatars).');

CREATE TABLE cosmetic_item (
    id          INTEGER PRIMARY KEY,
    name        TEXT NOT NULL,
    type        TEXT,
    rarity      TEXT,
    source      TEXT
);
INSERT INTO cosmetic_item (id,name,type,rarity,source) VALUES
 (1,'Drifter ''Pulse'' Shadow Ship Paint Job','Paint Job','Epic','Drifter Pack (exclusive)'),
 (2,'Drifter ''Voltaic'' Pilot Suit','Pilot suit','Epic','Drifter Pack (exclusive)'),
 (3,'Drifter ''Voltaic'' Pilot Helmet','Pilot helmet','Epic','Drifter Pack (exclusive)'),
 (4,'Gold Founder Avatar','Forum avatar',NULL,'Oculus Founder''s Pack'),
 (5,'Blue Founder Avatar','Forum avatar',NULL,'PSVR Founder''s Pack'),
 (6,'Green Founder Avatar','Forum avatar',NULL,'Vive Founder''s Pack');

CREATE TABLE reward_capsule (
    id          INTEGER PRIMARY KEY,
    name        TEXT NOT NULL,
    tier        TEXT,
    contents    TEXT,
    notes       TEXT
);
INSERT INTO reward_capsule (id,name,tier,contents,notes) VALUES
 (1,'Reward Capsule','standard','Random: XP-boosting implants, paint jobs, decals, pilot suits, helmets, Silver.','Earned by playing online battles; also from Scout mode.'),
 (2,'Gold Reward Capsule','premium','Superior loot mix (same item pool, all also obtainable free).','Bought via platform stores; remaining Gold balances converted into these at Warzone launch.');

CREATE TABLE daily_challenge_type (
    id          INTEGER PRIMARY KEY,
    name        TEXT NOT NULL,
    description TEXT
);
INSERT INTO daily_challenge_type (id,name,description) VALUES
 (1,'Tourist','Play different game modes.'),
 (2,'Slayer','Combat/kill-focused challenge.'),
 (3,'Drone Swatter','Destroy enemy drones.'),
 (4,'Primary Gunner','Kills/damage with primary weapons.'),
 (5,'Mechanic','Support/repair-focused challenge.');

-- =====================================================================
--  14. TROPHIES (PS4 -- 34 total: 1 Platinum, 4 Gold, 11 Silver, 18 Bronze)
-- =====================================================================
CREATE TABLE trophy (
    id          INTEGER PRIMARY KEY,
    name        TEXT NOT NULL,
    tier        TEXT,                     -- Platinum | Gold | Silver | Bronze
    description TEXT,
    confidence  TEXT DEFAULT 'high'
);
INSERT INTO trophy (id,name,tier,description,confidence) VALUES
 (1,'Ride of the Valkyrie','Platinum','Collect all trophies.','high'),
 (2,'Quantum Leap','Gold','Complete Recall mission Esmes III.','high'),
 (3,'Reboot & Rewind','Gold','Complete Recall mission Station 27.','high'),
 (4,'Death Metal','Silver','Earn 10 Reward Capsules from battle (PVP or Co-Op).','high'),
 (5,'Dye Fighter','Silver','Apply a Rare Paint Job to any ship.','high'),
 (6,'Flight School','Silver','Complete all training modules.','high'),
 (7,'Goosed','Silver','Lose a PVP battle with 5 clones or fewer remaining.','high'),
 (8,'Graduation Day','Silver','Reach Rank 10.','high'),
 (9,'Inner Beauty','Silver','Apply an Epic Paint Job to any ship.','high'),
 (10,'Shield Of Steel','Silver','Destroy 100 enemy missiles using countermeasures.','high'),
 (11,'Transfer Complete','Silver','Apply a Decal to any ship.','high'),
 (12,'Shopaholic','Silver','Unlock 25 cosmetic items.','high'),
 (13,'Boost Management','Bronze','Lap time below 60s in Assault training.','high'),
 (14,'Drone Strike','Bronze','Destroy 100 enemy drones.','high'),
 (15,'Full Deck','Bronze','Complete 3 Daily Challenges.','high'),
 (16,'Metal Detective','Bronze','Earn a Reward Capsule from Scout mode.','high'),
 (17,'Red Leader','Bronze','Win a PVP battle as squad leader.','high'),
 (18,'Stay Frosty','Bronze','Disable 50 enemy ships with EMS shots.','high'),
 (19,'Tactical Mind','Bronze','Assign 4 modifications to any ship.','high'),
 (20,'Voices From Beyond','Bronze','Discover 10 Echoes from Scout maps.','high'),
 (21,'Born Survivor','Bronze','Survive to wave 10 on a Survival map.','high'),
 (22,'Call The Doctor','Bronze','Make a kill in all Support ships.','high'),
 (23,'Control Freak','Bronze','Win 50 PVP Control battles.','high'),
 (24,'Giant Slayer','Bronze','Win 50 PVP Carrier Assault battles.','high'),
 (25,'Half A Legend','Bronze','Reach Rank 25.','high'),
 (26,'Heavy Metal','Bronze','Make a kill in all Heavy ships.','medium'),
 (27,'Maverick','Bronze','Win 50 PVP Team Deathmatch battles.','high'),
 (28,'Nightingale','Bronze','Earn 10,000 points from healing allies.','high'),
 (29,'Sting Like A Bee','Bronze','Make a kill in all Assault ships.','medium'),
 (30,'Thar She Blows','Bronze','Deliver the killshot to 3 cores in Carrier Assault.','high'),
 (31,'Aerial Arsenal','Bronze','Make a kill in all ships.','medium'),
 (32,'Master And Commander','Bronze','Reach Rank 50.','medium'),
 (33,'Peacock','Bronze','Place top in 10 PVP battles.','high'),
 (34,'Sweet Loot','Bronze','Earn 50 Reward Capsules from battle.','high');

-- =====================================================================
--  15. DLC / EDITIONS / BUNDLES
-- =====================================================================
CREATE TABLE dlc_edition (
    id          INTEGER PRIMARY KEY,
    name        TEXT NOT NULL,
    type        TEXT,                     -- edition | dlc | founders
    price       TEXT,
    contents    TEXT,
    status      TEXT
);
INSERT INTO dlc_edition (id,name,type,price,contents,status) VALUES
 (1,'EVE: Valkyrie - Warzone (Launch Bundle)','edition','$29.99 / €29.99','Base Warzone game (PS4 & Steam); included the Drifter Pack free until 24 Oct (2017). All later map/ship/mode updates free.','available at launch'),
 (2,'Drifter Pack','dlc',NULL,'Dynamic Theme (PS4); 5x Gold Reward Capsules; Epic ''Pulse'' Shadow paint; Epic ''Voltaic'' suit; Epic ''Voltaic'' helmet; 14x forum avatars. PS SKU UP5018-CUSA05789_00-VKDRIFTERDLCBNDL.','released'),
 (3,'Founder''s Packs (per platform)','founders','—','Free Legendary Wraith (Squadron 33 / S4 / MkV per platform), coordinated flight suit (M/F), 2,500 Gold, platform-coloured avatars, 7-day XP boost for CCP account link.','retired');

-- =====================================================================
--  16. CONVENIENCE VIEWS
-- =====================================================================
CREATE VIEW v_warzone_roster AS
SELECT s.name AS ship, c.name AS class, s.role,
       s.armor, s.shields, s.base_speed, s.max_speed, u.name AS ultra
FROM ship s
JOIN ship_class c ON c.id = s.class_id
LEFT JOIN ultra u ON u.id = s.ultra_id
WHERE s.era = 'warzone'
ORDER BY c.id, s.id;

CREATE VIEW v_ship_full AS
SELECT s.name AS ship, c.name AS class, l.slot,
       COALESCE(w.name, m.name) AS item, l.detail
FROM ship s
JOIN ship_class c ON c.id = s.class_id
JOIN ship_loadout l ON l.ship_id = s.id
LEFT JOIN weapon w ON w.id = l.weapon_id
LEFT JOIN module m ON m.id = l.module_id
ORDER BY c.id, s.id,
         CASE l.slot WHEN 'Primary' THEN 1 WHEN 'Secondary' THEN 2 ELSE 3 END;

-- =====================================================================
--  END OF FILE
-- =====================================================================
