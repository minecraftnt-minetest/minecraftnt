from requests import get
from pathlib import Path

def download(url, name):
	with open(name, "wb+") as f:
		response = get(url)
		f.write(response.content)

def check_sound_and_download(url, name):
	if not Path(name).exists():
		print("File \"%s\" doesn't exist, let's download it." % name)
		download(url, name)
	else:
		print("File \"%s\" already exists." % name)

def main():
	print("Fetching assets...")

	# calm1 through calm3
	for i in range(1,4):
		check_sound_and_download("https://betacraft.pl/MinecraftResources/music/calm%s.ogg" % i, Path("mods/mcnt_music/sounds/calm%s.ogg" % i))

	# piano1 through piano3
	for i in range(1,4):
		check_sound_and_download("https://betacraft.pl/MinecraftResources/newmusic/piano%s.ogg" % i, Path("mods/mcnt_music/sounds/piano%s.ogg" % i))

	# step sounds
	step_sounds = [ 'cloth', 'grass', 'gravel', 'sand', 'snow', 'stone', 'wood' ]
	for step_sound in step_sounds:
		for i in range(1,5):
			check_sound_and_download("https://betacraft.pl/MinecraftResources/newsound/step/%s%s.ogg" % (step_sound, i), Path("mods/mcnt_core/sounds/%s.%s.ogg" % (step_sound, i)))

	# item pickup sound
	check_sound_and_download("https://betacraft.pl/MinecraftResources/newsound/random/pop.ogg", Path("mods/mcnt_itemdrop/sounds/pop.ogg"))

if __name__ == "__main__":
	main()
