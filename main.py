from dotenv import load_dotenv
from os import environ
from bot import *


if __name__=="__main__":
    load_dotenv()
    ShokamBot.ChannelID = int(environ.get("CID"))
    ShokamBot.Bot.run(environ.get("TOKEN"))