# <prompt>
functionExists()
{
	if [ -n "$(type -t ${1})" ] && [ "$(type -t ${1})" = function ]; then
		return 0
	fi
	return 1
}
commandExists()
{
	if [ -n "$(type -t ${1})" ]; then
		return 0
	fi
	return 0
}
# - <php>
phpPrompt()
{
	if functionExists "phpbrew_current_php_version"; then
		echo "$(phpbrew_current_php_version | cut -d '-' -f1 | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')"
	fi
}
# - </php>
# - <node>
nodePrompt()
{
	if commandExists "node"; then
		local version="$(node --version)"
		if [[ ${version:0:1} == "v" ]]; then
			version="${version:1}"
		fi
		echo "${version}"
	fi
}
# - </node>
# - <golang>
goPrompt()
{
        if commandExists "go"; then
                echo "$(go version | tail -n 1 | grep -oP '(\d+\.\d+\.\d+)')"
        fi
}
# - </golang>
assemblePrompt()
{
	local prompt=""
	# PHP
	local phpPrompt=$(phpPrompt)
	if [[ ! -z "${phpPrompt}" ]]; then
		prompt="${phpPrompt}|"
	fi
	# NodeJS
	local nodePrompt=$(nodePrompt)
	if [[ ! -z "${nodePrompt}" ]]; then
		prompt="${prompt}node:${nodePrompt}|"
	fi
	# Golang
        local goPrompt=$(goPrompt)
        if [[ ! -z "${goPrompt}" ]]; then
                prompt="${prompt}go:${goPrompt}|"
        fi

	if [[ ! -z "${prompt}" ]]; then
		echo -n "[${prompt::-1}]"' $(__git_ps1 " (%s)")'
	fi
}

exportPrompt()
{
	local ps=""
	ps="\[\033[01;31m\]\u"
	ps=$ps"\[\033[01;33m\]@"
	ps=$ps"\[\033[01;32m\]\H "
	ps=$ps"\[\033[01;33m\]\W $(assemblePrompt)"
	ps=$ps"\[\033[00m\]\n$ "
	export PS1="${ps}"
}

# </prompt>
