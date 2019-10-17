name?="wfl$(shell echo $RANDOM$(ps)$(date +%s) | md5sum | cut -c1-8)"

run:
	reana-client   -lDEBUG   create  -f reana.yaml --name $(name)
	reana-client   -lDEBUG   start --workflow $(name)

