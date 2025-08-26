group "default" {
    targets = ["base", "prod"]
}

target "base" {
    context = "."
    dockerfile = "Dockerfile.base"
    tags = ["cpuchalver/apache2:base"]
    platforms = ["linux/amd64"]
    cache-to = ["type=gha,scope=base,mode=max"]
    cache-from = ["type=gha"]
    args = {
        UID = 1000
        GID = 1000
    }
}

target "prod" {
    inherits = ["base"]
    context = "."
    dockerfile = "Dockerfile.prod"
    tags = ["cpuchalver/apache2", "cpuchalver/apache2:prod"]
    platforms = ["linux/amd64"]
    cache-to = ["type=gha,scope=prod,mode=max"]
    cache-from = ["type=gha"]
    args = {
        UID = 1000
        GID = 1000
    }
}