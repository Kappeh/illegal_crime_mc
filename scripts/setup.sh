#!/usr/bin/env bash

set -eu

cat creative | awk '{ print "gamerule", $0 }' | docker exec -i illegal_crime_fabric rcon-cli

cat survival | awk '{ print "mvrule", $0, "survival" }' | docker exec -i illegal_crime_paper rcon-cli
cat survival | awk '{ print "mvrule", $0, "survival_nether" }' | docker exec -i illegal_crime_paper rcon-cli
cat survival | awk '{ print "mvrule", $0, "survival_the_end" }' | docker exec -i illegal_crime_paper rcon-cli
cat creative | awk '{ print "mvrule", $0, "creative" }' | docker exec -i illegal_crime_paper rcon-cli
cat creative | awk '{ print "mvrule", $0, "creative_nether" }' | docker exec -i illegal_crime_paper rcon-cli
cat creative | awk '{ print "mvrule", $0, "redstoner_creative" }' | docker exec -i illegal_crime_paper rcon-cli
cat creative | awk '{ print "mvrule", $0, "redstoner_bigplots" }' | docker exec -i illegal_crime_paper rcon-cli
cat creative | awk '{ print "mvrule", $0, "redstoner_trusted" }' | docker exec -i illegal_crime_paper rcon-cli
cat creative | awk '{ print "mvrule", $0, "synergy_plots_1" }' | docker exec -i illegal_crime_paper rcon-cli

docker exec illegal_crime_fabric rcon-cli time set 1000
docker exec illegal_crime_fabric rcon-cli weather clear

docker exec illegal_crime_paper rcon-cli mvm set gamemode survival survival
docker exec illegal_crime_paper rcon-cli mvm set gamemode survival survival_nether
docker exec illegal_crime_paper rcon-cli mvm set gamemode survival survival_the_end
docker exec illegal_crime_paper rcon-cli mvm set gamemode creative creative
docker exec illegal_crime_paper rcon-cli mvm set gamemode creative creative_nether
docker exec illegal_crime_paper rcon-cli mvm set gamemode creative redstoner_creative
docker exec illegal_crime_paper rcon-cli mvm set gamemode creative redstoner_bigplots
docker exec illegal_crime_paper rcon-cli mvm set gamemode creative redstoner_trusted
docker exec illegal_crime_paper rcon-cli mvm set gamemode creative synergy_plots_1

