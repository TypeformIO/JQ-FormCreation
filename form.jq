.[$i | tonumber] |

{
	title: "Updating your information!",
	fields: [
		{
			type: "statement",
			question: "Hello \(.name)! Hope you're doing fine today!"
		},
		{
			type: "yes_no",
			question: "Do you still live in \(.location)?"
		},
		if .has_home then {
			type: "yes_no",
			question: "Do you still own your house?"
		} else {
			type: "yes_no",
			question: "Did you buy a house this year?"
		} end
	]
}
