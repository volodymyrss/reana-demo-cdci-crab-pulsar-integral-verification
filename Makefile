name?="crab"


IMAGE=cdci/crab-integral-verification:$(shell git describe --always --tags)

build:
	docker build code -t $(IMAGE)

push: build
	docker push $(IMAGE)

run:
	reana-client   -lDEBUG   create  -f reana.yaml --name $(name)
	reana-client   -lDEBUG   start --workflow $(name)

run-local:
	cwltool workflow/cwl/crab.cwl --t1 2018-08-29T00:00:00 --t2 2018-09-20T00:00:00 --nscw 5 --chi2_limit 1.2 --systematic_fraction 0.01

validate:
	cat reana.yaml
	reana-client -lDEBUG validate | grep 'is a valid'
	cwltool --validate workflow/cwl/*  | grep 'is valid'
