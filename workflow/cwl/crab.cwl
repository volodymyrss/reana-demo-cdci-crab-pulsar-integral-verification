#!/usr/bin/env cwl-runner

arguments:
- -c
- id; export HOME_OVERRRIDE=/tmp; mkdir -pv $HOME_OVERRRIDE; source /init.sh; source
  /etc/bashrc; nbrun /repo/crab.ipynb $@
baseCommand: bash
class: CommandLineTool
cwlVersion: v1.0
id: crab
inputs:
- id: t1
  inputBinding:
    prefix: --inp-t1=
    separate: false
  type: string
- id: t2
  inputBinding:
    prefix: --inp-t2=
    separate: false
  type: string
- id: nscw
  inputBinding:
    prefix: --inp-nscw=
    separate: false
  type: int
- id: chi2_limit
  inputBinding:
    prefix: --inp-chi2_limit=
    separate: false
  type: float
- id: systematic_fraction
  inputBinding:
    prefix: --inp-systematic_fraction=
    separate: false
  type: float
outputs:
- doc: lines found with the pattern
  id: summary
  type: string
- doc: lines found with the pattern
  id: fit_results
  type: string
- doc: lines found with the pattern
  id: crab_by_osa
  type: string
- doc: lines found with the pattern
  id: good_fit_png
  type: string
- doc: lines found with the pattern
  id: next_good_fit_png
  type: string
requirements:
  DockerRequirement:
    dockerPull: cdci/crab-integral-verification:0.1.0-1-g1f9ce94-root
