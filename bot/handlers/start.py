from aiogram import Router
from aiogram.filters import CommandStart
from aiogram.fsm.context import FSMContext
from aiogram.types import Message

router = Router(name="start-router")


@router.message(CommandStart())
async def cmd_start(message: Message, state: FSMContext):
    data = await state.get_data()
    occurance = data.get("occurance", 0)
    if occurance == 0:
        text = "Привет! Продолжай нажимать /start, а я буду считать."
    else:
        text = f"Количество нажатий /start: {occurance}. Давай ещё!"
    await message.answer(text)
    await state.update_data(occurance=occurance + 1)
