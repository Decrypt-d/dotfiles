#!/bin/bash
selectedSection=$1
outputCharacterLimit=$2
if ! [ $2 ]; then
	outputCharacterLimit=60
fi

currentSecion=""
selectedTask=""
get_todo_item() {
	sectionNum=0
	while IFS= read -r -d $'\n'  line
	do
		if [ "$sectionNum" = "$selectedSection" ]; then
			selectedTask=$line
			break	
		elif [ "$(echo $line | head - -c 1)" = '[' ]; then
			currentSection=$(echo $line | cut -d'[' -f 2 | cut -d ']' -f 1)
			((sectionNum=$sectionNum+1))
		fi
	done < $1
}

get_todo_item ~/todo
curPos=0
outputText="$currentSection - $selectedTask"
wordCount=${#outputText}
filemodified=`stat ~/todo | grep -i change`
while true; do
	if ! [ "$(stat ~/todo | grep -i change)" = "$filemodified" ]; then
		get_todo_item ~/todo
		curPos=0
		wordCount=${#outputText}
		filemodified=`stat ~/todo | grep -i change`
	fi

	if ! [ "$selectedTask" ]; then
		echo 'No Todo Item'
	else
		echo "${outputText:$curPos:$outputCharacterLimit}"
		if [ $(($wordCount-$curPos)) -le $outputCharacterLimit ]; then
			curPos=0
		#Use to enable text scrolling when the output limit is exceeded
		elif [ $wordCount -gt $outputCharacterLimit ]; then
			curPos=$((curPos+1))
		fi
	fi	
	sleep 0.2
done
