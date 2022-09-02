variable "tag" {
  type = string
}
source "docker" "almalinux" {
  commit = true
  image  = "amq-base-image"
  pull   = false
  changes = [
    "USER amq",
    "ENTRYPOINT [\"/bin/bash\", \"/opt/amq/amq-broker/bin/artemis\", \"run\"]"
  ]

}
build {
  sources = ["source.docker.almalinux"]
  # provisioner "shell" {
  #   script = "install_python.sh"
  # }
  provisioner "ansible" {
    playbook_file = "playbook.yaml"
    user = "amq"
    extra_arguments = [ "-v" ]

  }

  post-processor "docker-tag" {
    repository = "my-image"
    tags       = [ var.tag ]
  }
}