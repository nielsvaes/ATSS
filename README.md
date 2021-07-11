# ATSS
## Advanced Threat Spawning System

The need for something like ATSS came after we were building training maps for our virtual fighter wing and we kept bumping into the limitations of the Mission Editor. We built a sandbox environment for every map that DCS offers. The idea was that we would all join a multiplayer map that was basically empty. Depending on what we wanted to practice, we would activate a particular objective from the radio menu. This could be something like dropping JDAMs or practicing BVR manoeuvres. The problem was that we would soon had  activated everything on the map and didn't have any means to clean it up and start over again, short of restarting the server. 

So while the default functionality could get us quite a long way, there were a couple of things missing that our training sorties desperately needed. Namely the ability to easily spawn, despawn and respawn objectives; with or without a layer of randomness applied. This would solve a couple of problems namely:

1. No reason to ever shut down the server, so we could have missions running on dedicated machines
2. Flexibility when spawning training objectives
    * exactly has the mission designer intended
    * purely random within the designer's vision
    * a mix of specifically placed targets and random targets
3. Everything could be carried over to actual missions, meaning the mission designer also wouldn't exactly know what we would be up against on mission days

## Pre-requisites
ATSS is built on top of the MOOSE framework and requires [MOOSE](https://github.com/FlightControl-Master/MOOSE) to be loaded for it to work. I will always try to keep ATSS working with the latest MOOSE release in case something drastic changes there. In reality, this probably won't be the case and if you have a "semi" up to date version of MOOSE in your mission already, ATSS should work just fine. 

## How it works
The actual functionality behind ATSS is quite simple as it's all named-based for the time being. Meaning that as long as you make sure you use a naming convention that makes sense to you, the mission designer, it shouldn't be too difficult to get everything running smoothly. I will try to outline a number of use-case scenarios in this README file that should help you on your way. 

## Making sure everything is loaded and good to go
You need to make sure everything is loaded (in the correct order, to some degree) when the mission starts. There are multiple ways to load scripts in DCS. The most common way is DO SCRIPT FILE. This will include all your scripts in the final .miz file, making it very portable

| Trigger | Conditions | Action|
| -- | -- | -- |
| MISSION START | None | DO SCRIPT FILE, Moose.lua |

![image](https://user-images.githubusercontent.com/7821618/125203702-dfe24400-e279-11eb-8d89-7e097cdff300.png)

| Trigger | Conditions | Action|
| -- | -- | -- |
| MISSION START | None | DO SCRIPT FILE, constants.lua |
| MISSION START | None | DO SCRIPT FILE, utils.lua |
| MISSION START | None | DO SCRIPT FILE, threat_spawners.lua |

![image](https://user-images.githubusercontent.com/7821618/125203634-84b05180-e279-11eb-92e3-d652653c2671.png)


You can also load script files from whatever location they are on your hard drive. This makes the mission not portable, but makes it a lot easier when you're constantly editing scripts. For example, if you're setting up the radio menu through code instead of the Mission Editor, this is a real time saver. 

| Trigger | Conditions | Action|
| -- | -- | -- |
| MISSION START | None | DO SCRIPT, `assert(loadfile("D:/Google Drive/Coconut Cockpit/ATSS/constants.lua"))()` |
| MISSION START | None | DO SCRIPT, `assert(loadfile("D:/Google Drive/Coconut Cockpit/ATSS/utils.lua"))()` |
| MISSION START | None | DO SCRIPT, `assert(loadfile("D:/Google Drive/Coconut Cockpit/ATSS/threat_spawners.lua"))()` |

![image](https://user-images.githubusercontent.com/7821618/125204399-66e4eb80-e27d-11eb-9f9d-507522a1ad15.png)


ATSS should now be ready to use in further triggers or from the radio menu

# Building an example mission

## Goal
Let's build an example mission that illustrates some use cases that might be interesting. For this example I'm using the free Marianas map and I'm going to set up 3 objectives:

* BVR practice
* Strike on a radar site
* Maverick training range


