from requests import get
from pathlib import Path

def download(url, name):
	with open(name, "wb+") as f:
		response = get(url)
		f.write(response.content)

def check_sound_and_download(url, name):
	if not Path(name).exists():
		print("File \"%s\"doesn't exist, let's download it." % name)
		download(url, name)
	else:
		print("File \"%s\" already exists." % name)

def main():
	print("Fetching assets...")

	# calm1 through calm3
	for i in range(1,4):
		check_sound_and_download("https://betacraft.pl/MinecraftResources/music/calm%s.ogg" % i, Path("mods/minecraft_music/sounds/calm%s.ogg" % i))

	# piano1 through piano3
	for i in range(1,4):
		check_sound_and_download("https://betacraft.pl/MinecraftResources/newmusic/piano%s.ogg" % i, Path("mods/minecraft_music/sounds/piano%s.ogg" % i))

if __name__ == "__main__":
	main()

