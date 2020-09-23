# Character customization

    ### Name [Sprinkles: age/aging]

    ### Player class < Character ([Paladin, Mage, Rogue, Ranger] Unique stats distribution) [Description of stat distrib.]
    
    ### Player Race  (Elf, Human, Dwarf, Orc, Troll. Unique base stats distribution) (Sprinkles: More classes, Description of stat distrib.)
 
    #### Distrib of custom stat points [Sprinkles]
    ### Stat summary [HP, STR, AGI, INT, DEX, LCK]
        Use gem-colorize for stats


# Mob generation

    ### Mob Race (Elf, Human, Dwarf, Orc, Troll)
    ### Mob Class (Tank, Mage, Roge, Ranger)

    mobRace => random(1..5)
    mobClass => random(1..4)

# Combat simulator

    Combat Init;
    ###turnOne:
        playerTurn = (playerAgi > mobAgi) ? true : false

        playerTurn == true; 
            -> player combat controller
            -> combat sim
        playerTurn == false;
            -> enemy turn
            -> combat sim

    ### HIT = playerDex - mobAgi
            = mobDex - playerAgi
            If hit, check crit; else miss.

    ### CRIT = playerLck - mobLck > 10
             = mobLck - playerLck > 10
            If true; crit = 1.2
            If false; crit = 1

    ### DMG = mobHP - (playerStr - mobStr)*crit
            = playerHP - (mobStr - playerStr)*crit
            = mobHP - (playerInt - mobInt)*crit
            = playerHP - (mobInt - playerInt)*crit
            = mobHP - (playerDex - mobStr)*crit
            = playerHP - (mobDex - playerStr)*crit
            
        Check for doubles? [SPRINKLES]

    ### playerAgi / mobAgi > 2 = loop 2

        if mobHP == 0;
            reward: give player random(minDrop..maxDrop) gold
        if playerHP == 0;
            puts "you have died!"
            playerGold = 0
            make new character or respawn?

        playerTurn (playerTurn = true) ? false : true

# Random event generator [Sprinkles]


### Main Street (Menu/Options)
    1. Adventure

            -> Mob generator

    2. Bank

            Goes to store/withdraw gold for death prevention loss (use bank app :P )

    3. Store

            Buy upgrades 

    4. Leaderboard

            Score calculated from: Furthest level reached/gold had/etc. (Use gem-table to display)

    5. Exit
            Are you sure? (Y/N)

#### Mob scaling [Sprinkles]

