#!/usr/bin/env bats
load '../node_modules/bats-support/load'
load '../node_modules/bats-assert/load'

# Test de l'image de production
@test "L'image de production doit démarrer correctement" {
    run docker run --rm --hostname localhost.localdomain cpuchalver/apache2:prod apache2ctl -- -M
    assert_output --partial "Loaded Modules"
}

@test "L'image de production doit contenir les configurations nécessaires" {
    run docker run --rm --hostname localhost.localdomain cpuchalver/apache2:prod apache2ctl -- -t -D DUMP_INCLUDES
    assert_output --partial "/etc/apache2/conf-enabled/security.conf"
    assert_output --partial "/etc/apache2/conf-enabled/remoteip.conf"
    assert_output --partial "/etc/apache2/conf-enabled/ddos-protection.conf"
}