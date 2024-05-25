from fastapi import APIRouter
from ..models import *
router = APIRouter()


@router.post("/node")
async def add_node(node : Node):
    return node


