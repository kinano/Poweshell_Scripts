# Iterates through all the user playlists and adds them to the library
from gmusicapi import Mobileclient
import getpass

api = Mobileclient()

email = getpass.getpass(prompt='What is your email?')
password = getpass.getpass(prompt='What is your password?')

api.login(email, password, Mobileclient.FROM_MAC_ADDRESS)

email = None
password = None

allPlaylists = api.get_all_user_playlist_contents()

for playlist in allPlaylists:
	for track in playlist['tracks']:
		if 'track' in track and 'storeId' in track['track']:
			api.add_store_tracks(track['track']['storeId'])
		else:
			print 'Track not added: {}'.format(track)
