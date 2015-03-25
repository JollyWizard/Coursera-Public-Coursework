root=`git rev-parse --show-toplevel`

cd ${root}

program=data-science
course=5-reproducible-research
project=repdata-003-project-1
projectUrl=https://github.com/JollyWizard/repdata-003-project-1.git

projectDir=$program/$course/$project

removeProjectRemote="git remote remove $project"
addProjectRemote="git remote add $project $projectUrl"
addProjectSubtree="git subtree add --prefix $projectDir $project master"
updateProjectSubtree="git pull $project master"

ensureRemote() {
	echo - - -
	echo $removeProjectRemote
	$removeProjectRemote

	echo - - -
	echo $addProjectRemote
	$addProjectRemote
}

syncProject() {
	echo - - -
	if [ ! -d "$root/$projectDir" ]; then
		echo $addProjectSubtree
		$addProjectSubtree
	else
		echo $updateProjectSubtree
		$updateProjectSubtree
	fi
}

ensureRemote
syncProject

