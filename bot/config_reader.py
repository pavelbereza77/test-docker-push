from pydantic import SecretStr
from pydantic_settings import BaseSettings


class BotSettings(BaseSettings):
    bot_token: SecretStr
