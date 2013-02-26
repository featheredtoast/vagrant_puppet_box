class kibana::user {
    user { "kibana":
      ensure     => "present",
    }
}
