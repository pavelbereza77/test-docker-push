from . import start
from aiogram import Router


def get_routers() -> list[Router]:
    return [
        start.router
    ]
