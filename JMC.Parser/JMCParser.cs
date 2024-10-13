﻿using Antlr4.Runtime;

namespace JMC.Parser;
public sealed class JMCParser(IToken[] tokens, BaseRule[] rules)
{
    private readonly IToken[] tokens = tokens;
    private readonly BaseRule[] rules = rules;
    private static readonly string[] COMMANDS = ["advancement", "attribute", "ban", "ban-ip", "banlist", "bossbar", "clear", "clone", "damage", "data", "datapack", "debug", "defaultgamemode", "deop", "difficulty", "effect", "enchant", "execute", "experience", "fill", "fillbiome", "forceload", "gamemode", "gamerule", "give", "help", "item", "jfr", "kick", "kill", "list", "locate", "loot", "me", "msg", "op", "pardon", "pardon-ip", "particle", "perf", "place", "playsound", "publish", "random", "recipe", "reload", "return", "ride", "save-all", "save-off", "save-on", "say", "schedule", "scoreboard", "seed", "setblock", "setidletimeout", "setworldspawn", "spawnpoint", "spectate", "spreadplayers", "stop", "stopsound", "summon", "tag", "team", "teammsg", "teleport", "tell", "tellraw", "tick", "time", "title", "tm", "tp", "trigger", "w", "weather", "whitelist", "worldborder", "xp"];

    public void Parse()
    {
    }
}