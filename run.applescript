tell application "Finder"
	set current_path to (POSIX path of (container of (path to me) as alias))
end tell

tell application "Virtual ]["
	activate
	set theDisk to current_path & "disks/boop.dsk"
	tell front machine
		eject device "S6D2"
		insert theDisk into device "S6D2"
		type line "BLOAD BOOP,D2"
		type line "CALL 768"
	end tell
end tell
