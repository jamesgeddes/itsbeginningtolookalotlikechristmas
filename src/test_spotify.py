from dotenv import load_dotenv
from os import getenv
import spotify
import vars

load_dotenv()
client_id = getenv("SPOTIFY_CLIENT_ID")
client_secret = getenv("SPOTIFY_CLIENT_SECRET")


def test_get_status_200_from_spotify():
    assert (
        spotify.get_data(
            client_id=client_id,
            client_secret=client_secret,
            song_id=vars.song_id,
        ).status_code
        == 200
    )


def test_song_popularity_is_integer():
    assert isinstance(
        spotify.get_popularity(
            client_id=client_id,
            client_secret=client_secret,
            song_id=vars.song_id,
        ),
        int,
    )
