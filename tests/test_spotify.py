from src.spotify import get_data, get_popularity
from src.variables import song_id
from os import getenv
from dotenv import load_dotenv

load_dotenv()
client_id = str(getenv("SPOTIFY_CLIENT_ID"))
client_secret = str(getenv("SPOTIFY_CLIENT_SECRET"))


def test_get_data_returns_200():
    data = get_data(
        client_id=client_id, client_secret=client_secret, song_id=song_id
    )

    assert data.status_code == 200


def test_popularity_in_range():
    popularity = get_popularity(
        client_id=client_id, client_secret=client_secret, song_id=song_id
    )
    assert 0 <= popularity <= 100
