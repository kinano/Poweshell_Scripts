# Iterates through all the user playlists and adds them to the library
from gmusicapi import Mobileclient

api = Mobileclient()

api.login('user@gmail.com', 'my-password', Mobileclient.FROM_MAC_ADDRESS)

allPlaylists = api.get_all_user_playlist_contents()

for playlist in allPlaylists:
	for track in playlist['tracks']:
		api.add_store_tracks(track['track']['storeId'])
