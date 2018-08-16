bindkey '^[W' zaw-rad-boomwaffle-pi

#### dhost zaw source
###
### provides a filterable list of your dhost aliases
###
### key: option + shift + H

function zaw-src-rad-boomwaffle-pi() {
    local title="actions"



    : ${(A)candidates::=""}
    : ${(A)cand_descriptions::=$(echo "${(k)DHOST_ALIAS_MAP}" | tr ' ' "\n")}

    actions=(zaw-rad-boomwaffle-pi-set-dockerhost)
    command -v 'docker-clean' &> /dev/null && actions+="zaw-rad-boomwaffle-pi-clean"
    command -v ddoctor &> /dev/null && actions+="zaw-rad-boomwaffle-pi-doctor"
    actions+=(zaw-rad-append-to-buffer)

    act_descriptions=("set DOCKER_HOST")
    command -v 'docker-clean' &> /dev/null && act_descriptions+="clean"
    command -v ddoctor &> /dev/null && act_descriptions+="doctor"
    act_descriptions+="append name to buffer"

    options=(-t "$title" -m -k)
}

function zaw-rad-boomwaffle-pi-set-dockerhost() {
    zaw-rad-buffer-action "dhost $1"
}

function zaw-rad-boomwaffle-pi-clean() {
    zaw-rad-buffer-action "dhost $1 && docker-clean"
}

function zaw-rad-boomwaffle-pi-doctor() {
    zaw-rad-buffer-action "dhost $1 && ddoctor"
}

zaw-register-src -n rad-boomwaffle-pi zaw-src-rad-boomwaffle-pi
