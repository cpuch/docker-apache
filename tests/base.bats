#!/usr/bin/env bats
load '../node_modules/bats-support/load'
load '../node_modules/bats-assert/load'

# Test de l'image de base
@test "L'image de base doit démarrer correctement" {
    run docker run --rm --hostname localhost.localdomain cpuchalver/apache2:base apache2ctl -- -M
    assert_output --partial "Loaded Modules"
}

@test "L'image de base doit contenir les modules nécessaires" {
    run docker run --rm --hostname localhost.localdomain cpuchalver/apache2:base apache2ctl -- -M
    assert_output --partial "rewrite_module"
    assert_output --partial "headers_module"
}