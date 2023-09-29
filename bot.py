import nextcord
from nextcord.ext import commands
import os, random

dir = os.path.dirname(os.path.abspath(__file__))+"\\assets"

class ShokamBot:
    Bot = commands.Bot(intents=nextcord.Intents.all())
    ChannelID = None


@ShokamBot.Bot.event
async def on_ready():
    print("ShokamBot is running")
    await PostShokam()
    await ShokamBot.Bot.close()

async def PostShokam():
    channel = ShokamBot.Bot.get_channel(ShokamBot.ChannelID)
    if not channel:
        return (print(f"Failed to locate channel of id {ShokamBot.ChannelID}"))
    path = f"{dir}\\{random.choice(os.listdir(dir))}"
    await channel.send(content="Hey everyone, this is YOUR daily dose of Shokam.", file=nextcord.File(path))
    print(f"Sent image: {path}")