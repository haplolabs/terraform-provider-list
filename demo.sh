run_terraform() {
  echo terraform provider mirror
}

checksum_validate() {
  local -r zipfile="$1"
  local sha256sum_old="$2"
  echo "Validating checksum"
}

main() {
  run_terraform
  checksum_validate
}

main "$@"
