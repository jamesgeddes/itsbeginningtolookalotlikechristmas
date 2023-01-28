from requests import post, get


def get_data(client_id, client_secret, song_id):
    # Get an access token
    auth_response = post(
        "https://accounts.spotify.com/api/token",
        data={"grant_type": "client_credentials"},
        auth=(client_id, client_secret),
    )
    auth_response.raise_for_status()
    access_token = auth_response.json()["access_token"]

    # Set the authorization header for all subsequent requests
    headers = {"Authorization": f"Bearer {access_token}"}

    # Make a request to the Spotify API to get the song's information
    response = get(
        f"https://api.spotify.com/v1/tracks/{song_id}", headers=headers
    )
    response.raise_for_status()
    return response


def get_popularity(client_id, client_secret, song_id):
    response = get_data(
        client_id=client_id, client_secret=client_secret, song_id=song_id
    )
    song_info = response.json()
    popularity = song_info["popularity"]

    return popularity
