bindkey '^[W' zaw-rad-boomwaffle-dev

#### dhost zaw source
###
### provides a filterable list of your dhost aliases
###
### key: option + shift + H

function zaw-src-rad-boomwaffle-dev() {

    local title="boomwaffles"
    : ${(A)candidates::=$(boomwaffle-list)}
    : ${(A)cand_descriptions::="${(@f)$(waffle-status)}"}

    echo "running boomwaffle-zaw" >> /tmp/zaw.log
    echo "${BOOMWAFFLE_LIST[*]}" >> /tmp/zaw.log

    actions=(\
      "zaw-rad-boomwaffle-dev-ssh" \
      "zaw-rad-boomwaffle-dev-watch" \
      "zaw-rad-boomwaffle-dev-wait-for-pi" \
      "zaw-rad-append-to-buffer" \
    )

    act_descriptions=(\
      "SSH to host" \
      "boom-watch (transfer files on change)" \
      "wait for pi" \
      "append hostname to buffer"
    )

    options=(-t "$title" -m -k)
}

function zaw-rad-boomwaffle-dev-ssh() { zaw-rad-buffer-action "ssh 'pi@${1}'" }

function zaw-rad-boomwaffle-dev-watch() { zaw-rad-buffer-action "boom-watch $1" }

function zaw-rad-boomwaffle-dev-wait-for-pi() { zaw-rad-buffer-action "waffle-wait-for-pi $1" }

zaw-register-src -n rad-boomwaffle-dev zaw-src-rad-boomwaffle-dev
