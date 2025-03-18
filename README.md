# illegal_crime_mc

The configuration files for the Illegal Crime Minecraft server.

## Usage

Follow these steps to set up and configure the project:

1. **Clone the repository**:
    
    ```
    git clone https://github.com/Kappeh/illegal_crime_mc.git
    cd illegal_crime_mc
    ```
    
2. **Create required directories**: See [Directory Setup](#directory-setup) for details.
    
3. **Set up environment variables**: See [Environment Variables](#environment-variables) for details.
 
4. **Import world files**:
    
    The world for the Fabric server is located at `fabric/data/world`. If you want to use an existing world, copy it to this location before running the container:
    
    ```
    cp path/to/world fabric/data/world
    ```
   
5. **Adjust permissions (recommended)**: Run the following commands in the root of the repository, replacing `UID` and `GID` with the corresponding values from your `.env` file:
    
    ```
    sudo chown -R UID:GID .
    sudo chmod -R 770 .
    ```
   
6. **Start the Docker Compose stack**: To start the services in detached mode, run:
    
    ```
    docker compose up -d
    ```
    
7. **Stop the Docker Compose stack**: To stop and remove the running containers, use:
    
    ```
    docker compose down
    ```
    
## Directory Setup

Make a directory called `schematics` in the root of the repository. This directory is used for storing [WorldEdit](https://worldedit.org/) schematic files. To create it, run:

```
mkdir schematics
```

## Environment Variables

To configure environment variables, make a copy of the example file:

```
cp .env.example .env
```

Then, open `.env` in a text editor and set appropriate values for your setup.

|**Environment Variable**|**Description**|
|---|---|
|`UID`|The user ID that should be used for file ownership within the project.|
|`GID`|The group ID that should be used for file ownership within the project.|
|`VELOCITY_PORT`|The port number where the Velocity proxy service will listen. Default is set to `25565`.|
|`RCON_PASSWORD`|The password for Remote Console (RCON) access. This should be a secure password.|
|`FORWARDING_SECRET`|A secret key for forwarding data between services or to the proxy. This should be a secure password.|
|`DCLINK_GUILD`|The Discord guild ID (server ID) where the bot will operate. See [dclink](#dclink) for more information.|
|`DCLINK_CHANNEL`|The Discord channel ID where the bot will operate. See [dclink](#dclink) for more information.|
|`DCLINK_ROLE`|The ID of the role that the bot will give to Discord members when they link their accounts. See [dclink](#dclink) for more information.|
|`DCLINK_TOKEN`|The bot token used for authentication with Discord's API. Ensure this is kept secret and secure.|
|`LUCKPERMS_DB_PASSWORD`|The password for the LuckPerms database. This should be a secure password.|

Instead of using environment variables, the secrets section of `docker-compose.yml` can be modified to read files instead. This method will likely be used by default in future.

## dclink
This configuration uses [dclink](https://github.com/Kalimero2Team/dclink) to link users' Minecraft accounts and Discord accounts. This is so that a user can gain access to the Minecraft server if they are a member of the configured Discord server. 

For this to work you must first [setup a discord bot](https://github.com/Kalimero2Team/dclink/wiki/Setup-Discord-Bot). Then set the relevant [Environment Variables](#environment-variables).

